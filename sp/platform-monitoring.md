---
layout: page
title: Platform Monitoring
description: A guide on how to monitor the platform using shell scripts and Nagios
product: sp
category: ref
sub-nav-class: 
weight: 4
type: page
nav-title: Platform Monitoring
---

Akana Platform Monitoring Guide
-------------------------------------

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#introduction">Introduction</a></li>
	<li><a href="#operational-gen">General Operational Monitoring</a></li>
	<li><a href="#db-mon">Database Monitoring</a></li>
	<ol>
		<li><a href="#db-msg-queue">Message queue</a></li>
		<li><a href="#db-idx-queue">Index queue</a></li>
		<li><a href="#db-scheduler">Scheduler</a></li>
		<li><a href="#db-fed">Federation Synchronization</a></li>
		<li><a href="#db-connection-pool">Connection pool</a></li>
	</ol>
	<li><a href="#log-mon">Log Monitoring</a></li>
</ol>

### <a name="introduction"></a>Introduction

This document describes ways to monitor the platform - specifically log analysis and database monitoring. It is currently a work in progress.

### <a name="operational-gen"></a>General Operational Monitoring
There are several key operational metrics to monitor on all servers:

* CPU utilization
* Disk utilization
* Zombie processes
* Total processes
* Available swap space

Tools like Nagios provide guidelines on configuring monitoring for the operating system and we recommend that you consult their documentation in detail. As an example, we commonly leverage the following Nagios checks for our own systems:

```
command[check_load]=/usr/local/nagios/libexec/check_load -w 15,10,5 -c 30,25,20
command[check_disk]=/usr/local/nagios/libexec/check_disk -w 20% -c 10% -e
command[check_zombie_procs]=/usr/local/nagios/libexec/check_procs -w 5 -c 10 -s Z
command[check_total_procs]=/usr/local/nagios/libexec/check_procs -w 150 -c 200
command[check_swap]=/usr/local/nagios/libexec/check_swap -w 20 -c 10
```

### <a name="db-mon"></a>Database Monitoring

There are several key operational / application metrics and conditions to monitor for on the platform database server. The example script below demonstrates how the most common monitors can be aggregated together and applied to a mySQL database server. Each one will be explained in more detail in the next section:

```
#!/bin/bash

NL=$'\n'
ERROR_MSG=""
BLK=""
DB_STAT=`cat /var/tmp/db_stat`
DB_USER=""
DB_PASS=""
DB_NAME=""

sqlcmd="mysql -u $DB_USER -p${DB_PASS} -D $db -BNe"
query="select count(*) from MSG_QUEUE"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ "$result" -a $result -gt 10 ] && ERROR_MSG=${ERROR_MSG}"MSG_QUEUE is more than 10 in $db database: ${result}${NL}"

query="select max(DELIVERYATTEMPTS) from MSG_QUEUE"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
if [ "$result" != "NULL" ];then
   [ $result -gt 10 ] && ERROR_MSG=${ERROR_MSG}"There are more than 10 retries in $db database DELIVERYATTEMPTS: ${result}${NL}"
fi

query="select count(*) from INDEX_QUEUE"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ $result -gt 20 ] && ERROR_MSG=${ERROR_MSG}"INDEX_QUEUE is more than 20 in $db database: ${result}${NL}${NL}"

query="select * from SOA_QRTZ_TRIGGERS where TRIGGER_STATE = 'BLOCKED' and TRIGGER_NAME not in (select TRIGGER_NAME from SOA_QRTZ_FIRED_TRIGGERS)"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ ! -z "$result" -a "$result" != "NULL" ] && { ERROR_MSG=${ERROR_MSG}"There are blocked jobs in $db database:${NL}${result}${NL}"; BLK="1"; }

query="select * from SOA_QRTZ_TRIGGERS where TRIGGER_STATE = 'ACQUIRED' and TRIGGER_NAME not in (select TRIGGER_NAME from SOA_QRTZ_FIRED_TRIGGERS)"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ ! -z "$result" -a "$result" != "NULL" ] && ERROR_MSG=${ERROR_MSG}"There are acquired jobs in $db database:${NL}${result}${NL}";

query="select TRIGGER_NAME, STATE, INSTANCE_NAME, FROM_UNIXTIME(FIRED_TIME/1000), \"GMT\" from SOA_QRTZ_FIRED_TRIGGERS where FIRED_TIME/1000 <= UNIX_TIMESTAMP(TIMESTAMPADD(MINUTE, -10, now()))"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ ! -z "$result" -a "$result" != "NULL" ] && ERROR_MSG=${ERROR_MSG}"Below jobs are running for longer than 10 minutes in $db database:${NL}TRIGGER_NAME\tSTATE\tINSTANCE_NAME\tFIRED_TIME\tGMT${NL}${result}${NL}"

query="select EVENTID, EVENTTYPE, SOURCEFEDMEMBERID, TARGETFEDMEMBERID, CREATEDDTS, LASTPOSTEDDTS, STATUS, NUMTRIES, EVENTCTXDATAID from EVENT_QUEUE
where (STATUS='event.status.pending' and NUMTRIES > 3) or (STATUS='event.status.suspended')";
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
if [ ! -z "$result" -a "$result" != "NULL" ];then
   ERROR_MSG=${ERROR_MSG}"Potential federation issues. Event pending after too many tries:{NL}${result}${NL}"
fi

sqlcmd="mysql -u $DB_USER -p${DB_PASS} -D mysql -BNe"
query="SHOW PROCESSLIST"
result=`$sqlcmd "$query" | grep $DB_NAME | wc -l`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ $result -ge 180 ] && ERROR_MSG=${ERROR_MSG}"Master database has $result sockets exhausted out of 180"

if [ -n "$ERROR_MSG" ]; then
  [ -n "$BLK" ] && DB_STAT=`expr $DB_STAT + 1` || DB_STAT=1;
  echo "$DB_STAT" > /var/tmp/db_stat;
  echo -e "$ERROR_MSG";
elif [ $DB_STAT -ge 1 ]; then
  echo "0" > /var/tmp/db_stat;
  echo "Database monitor is OK";
fi
```
This script can be put in a cron job, set to run every 5 minutes as follows:

```
# crontab -l
MAILTO=prod_critical@yourcompany.com
*/5 * * * * /xxx/bin/db_monitor.sh
```

The next sections will explain each of the metrics or conditions that are determined in the above script.

#### <a name="db-msg-queue"></a>Message queue

**Scope**: Community Manager

If email cannot be sent for some reason, the MSG_QUEUE table will fill up. This script will send an alert if the table contains more than 10 entries:

```
sqlcmd="mysql -u $DB_USER -p${DB_PASS} -D $db -BNe"
query="select count(*) from MSG_QUEUE"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ "$result" -a $result -gt 10 ] && ERROR_MSG=${ERROR_MSG}"MSG_QUEUE is more than 10 in $db database: ${result}${NL}"
```

If an email continually fails delivery for some reason, this can be detected by inspecting the DELIVERYATTEMPTS field in the MSG_QUEUE table. This script will send an alert if more than 10 delivery attempts have been made:

```
query="select max(DELIVERYATTEMPTS) from MSG_QUEUE"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
if [ "$result" != "NULL" ];then
   [ $result -gt 10 ] && ERROR_MSG=${ERROR_MSG}"There are more than 10 retries in $db database DELIVERYATTEMPTS: ${result}${NL}"
fi
```

#### <a name="db-idx-queue"></a>Index queue

**Scope**: Community Manager

If the indexing of the Community Manager site fails for some reason, the INDEX_QUEUE table will fill up. This script will send an alert if the table contains more than 20 entries :

```
sqlcmd="mysql -u $DB_USER -p${DB_PASS} -D $db -BNe"
query="select count(*) from INDEX_QUEUE"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ $result -gt 20 ] && ERROR_MSG=${ERROR_MSG}"INDEX_QUEUE is more than 20 in $db database: ${result}${NL}${NL}"
```

#### <a name="db-scheduler"></a>Scheduler

**Scope**: Community Manager and Policy Manager

Occasionally the scheduled jobs can get stuck in a state where they are blocked or thought to be running, but are not. These scripts will send an alert if these occur:

```
sqlcmd="mysql -u $DB_USER -p${DB_PASS} -D $db -BNe"
query="select * from SOA_QRTZ_TRIGGERS where TRIGGER_STATE = 'BLOCKED' and TRIGGER_NAME not in (select TRIGGER_NAME from SOA_QRTZ_FIRED_TRIGGERS)"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ ! -z "$result" -a "$result" != "NULL" ] && { ERROR_MSG=${ERROR_MSG}"There are blocked jobs in $db database:${NL}${result}${NL}"; BLK="1"; }

query="select * from SOA_QRTZ_TRIGGERS where TRIGGER_STATE = 'ACQUIRED' and TRIGGER_NAME not in (select TRIGGER_NAME from SOA_QRTZ_FIRED_TRIGGERS)"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ ! -z "$result" -a "$result" != "NULL" ] && ERROR_MSG=${ERROR_MSG}"There are acquired jobs in $db database:${NL}${result}${NL}";
```

It is often useful to know if a particular scheduled job has been executing for too long - this is often a sign of database contention or poor database maintenance. This script will send an alert if any scheduled job takes longer than 10 minutes:

```
query="select TRIGGER_NAME, STATE, INSTANCE_NAME, FROM_UNIXTIME(FIRED_TIME/1000), \"GMT\" from SOA_QRTZ_FIRED_TRIGGERS where FIRED_TIME/1000 <= UNIX_TIMESTAMP(TIMESTAMPADD(MINUTE, -10, now()))"
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ ! -z "$result" -a "$result" != "NULL" ] && ERROR_MSG=${ERROR_MSG}"Below jobs are running for longer than 10 minutes in $db database:${NL}TRIGGER_NAME\tSTATE\tINSTANCE_NAME\tFIRED_TIME\tGMT${NL}${result}${NL}"
```

#### <a name="db-fed"></a>Federation Synchronization

**Scope**: Community Manager

If you have implemented a federation between Community Manager tenants, the synchronization of events between the members of the federation can fail and the EVENT_QUEUE table will start filling up. This query examines this table for federation events in a bad state:

```
query="select EVENTID, EVENTTYPE, SOURCEFEDMEMBERID, TARGETFEDMEMBERID, CREATEDDTS, LASTPOSTEDDTS, STATUS, NUMTRIES, EVENTCTXDATAID from EVENT_QUEUE
where (STATUS='event.status.pending' and NUMTRIES > 3) or (STATUS='event.status.suspended')";
result=`$sqlcmd "$query"`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
if [ ! -z "$result" -a "$result" != "NULL" ];then
   ERROR_MSG=${ERROR_MSG}"Potential federation issues. Event pending after too many tries:{NL}${result}${NL}"
fi
```

#### <a name="db-connection-pool"></a>Connection pool

**Scope**: All products

It is important to monitoring the number of database connections the platform is consuming and warn when then number climbs above a theshold of 80%. The following script snippet illustrates how this can be done:

```
sqlcmd="mysql -u $DB_USER -p${DB_PASS} -D mysql -BNe"
query="SHOW PROCESSLIST"
result=`$sqlcmd "$query" | grep $DB_NAME | wc -l`
[ $? -ne 0 ] && { echo "Cannot connect to database"; exit 1; }
[ $result -ge 180 ] && ERROR_MSG=${ERROR_MSG}"Master database has $result sockets exhausted out of 180"
```

### <a name="log-mon"></a>Log Monitoring

There are several key phrases to search for within the platform logs. The following example script demonstrates how Nagios can be configured with a set of critical errors that can occur in the log:

```
@searches = ({
  logfile => '/root/sm70/instances/@HNAME@/log/@HNAME@.log',
  rotation => 'loglog0log1',
  criticalpatterns => ['OutOfMemoryError',
        'Cannot get a connection, pool exhausted',
        'Error in creating Prepared statement for the query',
        'org.apache.lucene.store.jdbc.JdbcStoreException',
        'Timeout waiting for idle object',
        'GC overhead limit exceeded',
        'Wsdl does not conform to wsdl schema',
        'Error encountered in WS-Security engine',
        'com.mysql.jdbc.exceptions.jdbc4.CommunicationsException',
        'Data truncation',
		 'ERROR [DBStatementAndResultSetTracker] PreparedStatementTracker' ]
});
```
 
This table explains what each of these log phrases mean:

<table>
	<tr>
		<th>Phrase/Pattern</th>
		<th>Description</th>
		<th>Severity</th>
		<th>Resolution</th>
	</tr>
	<tr>
		<td>OutOfMemoryError</td>
		<td>This occurs when the platform runs out of memory due to a memory leak or high demand. The container typically becomes unresponsive.</td>
		<td>Critical</td>
		<td>1) Take a thread dump <br> 2) Restart the container</td>
	</tr>

<tr>
		<td> Cannot get a connection, pool exhausted</td>
		<td>This is due to the DB connection pool in the in platform running out of connections due to high load.</td>
		<td>Critical</td>
		<td>1) Check DB availability <br> 2) Increase pool size or add containers to the cluster (preferred)<br> 3) Restart the container |
<tr>
		<td> Error in creating Prepared statement for the query</td>
		<td>Database query execution error. </td>
		<td>High</td>
		<td>Check root cause in same log entry |
<tr>
		<td>org.apache.lucene.store.jdbc.<wbr>JdbcStoreException</td>
		<td>Search index database error</td>
		<td>High</td>
		<td>1) If the log includes the phrase like 'Duplicate entry [X] for [Y]', wait to see if it resolves itself. If it does not resolve itself, restart the container <br> 2) If the log includes the phrase 'Deadlock found when trying to get lock', it should resolve itself<br> 3) If the log includes the phrase 'No entry for [X] table index\_objects', wait to see if it resolves itself. If it does not resolve itself, force a reindex by truncating the INDEX\_OBJECTS, INDEX\_QUEUE and INDEX\_STATUS tables. Restart one of the Community Manager servers.|
<tr>
		<td>Timeout waiting for idle object</td>
		<td>Typically a full connection pool due to load </td>
		<td>High </td>
		<td>Increase pool size or add containers to the cluster (preferred)
</tr>
<tr>
		<td>GC overhead limit exceeded </td>
		<td>Critical </td>
		<td>This is typically caused by a memory leak in the platform. The container typically becomes unresponsive. </td>
		<td>Restart and report to support if not resolved 
</tr>
<tr>
		<td>Wsdl does not confirm to wsdl schema </td>
		<td>Typically due to a malformed WSDL </td>
		<td>Low</td>
		<td>Inspect the log for the associated service key and correct the WSDL via the Policy Manager user interface 
</tr>

<tr>
		<td>Error encountered in WS-Security engine </td>
		<td>Unknown error when a container is in a bad state</td>
		<td>High</td>
		<td>Restart and report to support if not resolved 
</tr>

<tr>
		<td>com.mysql.jdbc.exceptions.jdbc4.<wbr>CommunicationsException </td>
		<td>This is due to the DB going down or a network issue</td>
		<td>Critical</td>
		<td>Check DB availability 
</tr>

<tr>
		<td>Data truncation</td>
		<td>Due to data being too large to fit in the DB</td>
		<td>High</td>
		<td>Contact Akana Support 
</tr>

<tr>
		<td>ERROR [DBStatementAndResultSetTracker] PreparedStatementTracker</td>
		<td>This is due to poor DB performance issues </td>
		<td> Critical </td>
		<td>Check DB availability 
</tr>
</table>

