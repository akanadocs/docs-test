---
layout: page
title: Database Maintenance
description: A guide on how to maintain the database
product: sp
category: ref
sub-nav-class: 
weight: 4
type: page
nav-title: Database Maintenance
---

Akana Platform Database Maintenance
-------------------------------------

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#introduction">Introduction</a></li>
	<li><a href="#data">Types of Volatile Data</a></li>
	<li><a href="#built-in">Using the built-in jobs</a></li>
	<li><a href="#using-cron">Leveraging CRON to delete data</a></li>
	<li><a href="#partitioning">Partitioning large data stores</a></li>
</ol>

### <a name="introduction"></a>Introduction

This document describes the types of data that require regular archiving and ways to implement it.

### <a name="data"></a>Types of Volatile Data

There are several key tables that require regular maintenance:

#### Policy Manager Tables:

| Table Name| Description|
| ------ | ------- |
| AM_ALERTS |  stores the fired alerts in the system
| AM\_ALERTS_SLAS | stores the fired SLA alerts in the system
| MO_USAGEDATA\** |  stores the metadata about the Service/API calls managed by the API Gateway. This is controlled by the auditing policy
| MO\_USAGE_NEXTHOP\** |  stores references to downstream (next hop) usage data records
| MO_USAGEMSGS\** |  stores the Service/API calls (request/response/fault) message contents. This is controlled by the auditing policy
| MO_ROLLUPDATA |  stores 5-second rollup data transmitted by each Network Director.
| MO_ROLLUP15 |  stores 15-minute rollups derived from the above table by the Policy Manager Scheduled Jobs
| MO\_ROLLUP_HOUR |  stores hourly rollups derived by the Policy Manager Scheduled Jobs
| MO\_ROLLUP_DAY | stores daily rollups derived by the Policy Manager Scheduled Jobs
| MO\_ROLL_ORG15 | stores 15-minute rollups per business (organization) derived by the Policy Manager Scheduled Jobs
| MO\_ROLL\_ORG_H | stores hourly rollups per business (organization) derived by the Policy Manager Scheduled Jobs
| MO\_ROLL\_ORG_D | stores daily rollups per business (organization) derived by the Policy Manager Scheduled Jobs


** Note: these tables can potentially contain VERY large quantities of data and will require special handling such as partitioning


#### Community Manager Tables:

| Table Name| Description|
| ------ | ------- |
| BOARD_ITEMS |  stores the tickets, discussions and reviews
| COMMENTS |  stores the comments on the board items above
| COMMENT_MARKS | stores the 'like/thumbs-up' votes for the comments


### <a name="built-in"></a>Using the built-in jobs

The Policy Manager has a built-in capability to delete/archive data in the MO\_USAGE* and MO\_ROLL* tables. These jobs run every hour and can add significant overhead to the Policy Manager container so are best suited to low-throughput environments with limited retained data. 

To configure the built-in jobs go to the Policy Manager Admin console -> Configuration tab -> com.soa.rollup.delete.old. The settings in this screen can be summarized as follows:

* *.enable - enable/disable the job
* *.exportDeleted - set to true if you want the data exported on delete
* *.unit - the time unit to retain data (hour, week, month, year)
* *.windowSize = the number of units to retain data

For example, if you want to delete all the 15-minute rollup data more than 1 week old you would set:

```
monitoring.delete.rollup.MO_ROLLUP15.enable=true
monitoring.delete.rollup.MO_ROLLUP15.exportDeleted=false
monitoring.delete.rollup.MO_ROLLUP15.unit=week
monitoring.delete.rollup.MO_ROLLUP15.windowSize=1
```	

**Note:** there is no scheduled job to delete/archive Alerts or any Community Manager data. This is best done using a CRON jobs as described in the next section.

**Note:** to disable the built-in jobs for higher throughput environments, set all '*.enable' properties to false as follows:

```
monitoring.delete.rollup.MO_ROLLUP15.enable=falsemonitoring.delete.rollup.MO_ROLLUPDATA.enable=falsemonitoring.delete.rollup.MO_ROLLUP_DAY.enable=falsemonitoring.delete.rollup.MO_ROLLUP_HOUR.enable=falsemonitoring.delete.rollup.MO_ROLL_ORG15.enable=false
monitoring.delete.rollup.MO_ROLL_ORG_D.enable=false
monitoring.delete.rollup.MO_ROLL_ORG_H.enable=false
monitoring.delete.usage.enable=false
```

### <a name="using-cron"></a>Leveraging CRON to delete data

For higher throughput environments its better to offload the task to delete/archive data by simply executing scripts directly against the database using a CRON job. The following script (cleanup.sh) will delete all:

* 5-second rollup data in MO_ROLLUPDATA older than 1 month
* 15-minute rollup data in MO_ROLLUP15 older than 1 month
* 15-minute rollup data in MO\_ROLL_ORG15 older than 1 month
* 1-hour rollup data in MO\_ROLLUP_HOUR older than 3 months
* 1-hour rollup data in MO\_ROLL\_ORG_H older than 3 months
* 1-day rollup data in MO\_ROLLUP_DAY older than 1 year
* 1-day rollup data in MO\_ROLL\_ORG_D older than 1 year
* alerts in AM_ALERTS and AM_ALERTS_SLAS older than 1 month

```
PATH=$PATH:/usr/bin

date
mysql -u xxx -pxxx -D dbname -e "delete from MO_ROLLUPDATA where ROLLUPDATAID < (select min(MAX_ID) from MO_STATUS) and INTVLSTARTDTS < TIMESTAMPADD(MONTH, -1, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D dbname -e "delete from MO_ROLLUP15 where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -1, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D dbname -e "delete from MO_ROLL_ORG15 where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -1, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D dbname -e "delete from MO_ROLLUP_HOUR where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -3, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D dbname -e "delete from MO_ROLL_ORG_H where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -3, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D dbname -e "delete from MO_ROLLUP_DAY where INTVLSTARTDTS < TIMESTAMPADD(YEAR, -1, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D dbname -e "delete from MO_ROLL_ORG_D where INTVLSTARTDTS < TIMESTAMPADD(YEAR, -1, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D dbname -e "delete s from AM_ALERTS a inner join AM_ALERTS_SLAS s on s.ALERTSID = a.ALERTSID where a.SOURCEDTS < TIMESTAMPADD(MONTH, -1, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D dbname -e "delete from AM_ALERTS where SOURCEDTS < TIMESTAMPADD(MONTH, -1, now());"
[ $? != 0 ] && exit 1

date

```

Once satisfied with the script, you can set up a CRON job to execute it each night. For example, configuring CRON to execute at 1am each morning as follows:

```
# crontab -l
0 1 * * * /xxx/bin/cleanup.sh
```