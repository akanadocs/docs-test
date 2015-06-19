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

##Akana Platform Database Maintenance

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#introduction">Introduction</a></li>
	<li><a href="#data">Types of Volatile Data</a></li>
	<li><a href="#built-in">Using the built-in jobs</a></li>
	<li><a href="#using-cron">Leveraging cron to delete data</a></li>
	<li><a href="#partitioning">Partitioning large data stores</a></li>
	<li><a href="#partitioning-verylarge">Partitioning large data stores under load (MySQL Only)</a></li>
	<li><a href="#drop-partitions">Dropping partitions</a></li>
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
| COMMENTS |  stores the comments on the board items above (Has FK with BOARD_ITEMS with cascading delete)
| COMMENT_MARKS | stores the 'like/thumbs-up' votes for the comments (Has FK with COMMENTS with cascading delete)


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

**Note:** there is no scheduled job to delete/archive Alerts or any Community Manager data. This is best done using a cron jobs as described in the next section.

**Note:** to disable the built-in jobs for higher throughput environments, set all '*.enable' properties to false as follows:

```
monitoring.delete.rollup.MO_ROLLUP15.enable=falsemonitoring.delete.rollup.MO_ROLLUPDATA.enable=falsemonitoring.delete.rollup.MO_ROLLUP_DAY.enable=falsemonitoring.delete.rollup.MO_ROLLUP_HOUR.enable=falsemonitoring.delete.rollup.MO_ROLL_ORG15.enable=false
monitoring.delete.rollup.MO_ROLL_ORG_D.enable=false
monitoring.delete.rollup.MO_ROLL_ORG_H.enable=false
monitoring.delete.usage.enable=false
```

### <a name="using-cron"></a>Leveraging cron to delete data

For higher throughput environments its better to offload the task to delete/archive data by simply executing scripts directly against the database using a cron job. The following scripts will delete all:

* next-hop data in MO\_USAGE_NEXTHOP older than 1 month
* usage messages in MO_USAGEMSGS older than 1 month
* usage data in MO_USAGEDATA older than 1 month
* 5-second rollup data in MO_ROLLUPDATA older than 1 month
* 15-minute rollup data in MO_ROLLUP15 older than 1 month
* 15-minute rollup data in MO\_ROLL_ORG15 older than 1 month
* 1-hour rollup data in MO\_ROLLUP_HOUR older than 3 months
* 1-hour rollup data in MO\_ROLL\_ORG_H older than 3 months
* 1-day rollup data in MO\_ROLLUP_DAY older than 1 year
* 1-day rollup data in MO\_ROLL\_ORG_D older than 1 year
* alerts in AM\_ALERTS and AM\_ALERTS_SLAS older than 1 month

```
delete from MO_USAGE_NEXTHOP where REQUESTDTS < TIMESTAMPADD(MONTH, -1, now());

delete from MO_USAGEMSGS where MSGCAPTUREDDTS < TIMESTAMPADD(MONTH, -1, now());

delete from MO_USAGEDATA where REQUESTDTS < TIMESTAMPADD(MONTH, -1, now());

delete from MO_ROLLUPDATA where ROLLUPDATAID < (select min(MAX_ID) from MO_STATUS) and INTVLSTARTDTS < TIMESTAMPADD(MONTH, -1, now());

delete from MO_ROLLUP15 where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -1, now());

delete from MO_ROLL_ORG15 where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -1, now());

delete from MO_ROLLUP_HOUR where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -3, now());

delete from MO_ROLL_ORG_H where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -3, now());

delete from MO_ROLLUP_DAY where INTVLSTARTDTS < TIMESTAMPADD(YEAR, -1, now());

delete from MO_ROLL_ORG_D where INTVLSTARTDTS < TIMESTAMPADD(YEAR, -1, now());

delete s from AM_ALERTS a inner join AM_ALERTS_SLAS s on s.ALERTSID = a.ALERTSID where a.SOURCEDTS < TIMESTAMPADD(MONTH, -1, now());

delete from AM_ALERTS where SOURCEDTS < TIMESTAMPADD(MONTH, -1, now());

```

For Community Manager, there are additional tables such as the Boards (Forums) that you may want to clean up:

```
delete from BOARD_ITEM_ASSIGNMENTS where ITEMID in (select ITEMID from BOARD_ITEMS where ARCHIVABLE='Y' and CREATEDDTS < TIMESTAMPADD(YEAR, -1, now());

delete from BOARD_ITEMS where ARCHIVABLE='Y' and CREATEDDTS < TIMESTAMPADD(YEAR, -1, now());

```
For sample scripts on MySql and Oracle (other databases coming soon) download the following zip archive: [sample_scripts.zip](sample_scripts.zip)

Once satisfied with the script, you can set up a cron job to execute it each night. For example, configuring cron to execute at 1am each morning as follows:

```
0 1 * * * /xxx/bin/cleanup.sh
```

### <a name="partitioning"></a>Partitioning large data stores

When the amount of data in the MO\_USAGE\_DATA, MO\_USAGEMSGS and MO\_USAGE_NEXTHOP tables climbs over 100 GB of data, the deletion of data takes too long and locks up the tables for concurrent write operations. To overcome this, it is highly recommended that you implement a partitioning strategy that allows you to simply drop an entire partition without incurring any performance overhead. 

Partitioning is fairly complex. As a result, we recommend that you test this thoroughly before attempting it on a production system.

**Note:** If the tables contain a large amount of data, the process of partitioning will be extremely time and resource intensive and will be virtually impossible to perform under load. Refer to the next section for the correct approach in these circumstances.

#### MySQL ####


##### Drop existing foreign keys, modify, and add new indexes #####

Partitioning in MySQL does not support foreign key relationships. In addition, the partition key must be added to the primary key index:
 
```
ALTER TABLE MO_USAGE_NEXTHOP
DROP FOREIGN KEY FK_NXTHOP_EVENTID,
DROP PRIMARY KEY,
ADD PRIMARY KEY (NEXTHOPID, REQUESTDTS);

ALTER TABLE MO_USAGEMSGS
DROP PRIMARY KEY,
ADD PRIMARY KEY (EVENTID,SEQ,MSGCAPTUREDDTS),
DROP FOREIGN KEY FK_USG_EVENTID;

ALTER TABLE MO_USAGEDATA
DROP PRIMARY KEY,
ADD PRIMARY KEY (USAGEDATAID, REQUESTDTS),
DROP INDEX UI_USG_EVENTID,
ADD INDEX NUI_USG_EVENTID(EVENTID),
ADD INDEX NUI_USG_USAGEDATAID(USAGEDATAID);
```

##### Create partitions #####

You then create partitions, with the idea that each partition represents the deletion interval. In this example, you are deleting data once a week and keeping a maximum of 8 weeks of data. The dates must also be changed to match the current time. The names of the partitions are arbitrary, but are used by the cleanup script.

```
ALTER TABLE MO_USAGE_NEXTHOP
PARTITION BY RANGE (TO_DAYS(REQUESTDTS)) (
     PARTITION p0000 VALUES LESS THAN (TO_DAYS('2015-01-04 00:00:00')),
     PARTITION p0111 VALUES LESS THAN (TO_DAYS('2015-01-11 00:00:00')),
     PARTITION p0118 VALUES LESS THAN (TO_DAYS('2015-01-18 00:00:00')),
     PARTITION p0125 VALUES LESS THAN (TO_DAYS('2015-01-25 00:00:00')),
     PARTITION p0201 VALUES LESS THAN (TO_DAYS('2015-02-01 00:00:00')),
     PARTITION p0208 VALUES LESS THAN (TO_DAYS('2015-02-08 00:00:00')),
     PARTITION p0215 VALUES LESS THAN (TO_DAYS('2015-02-15 00:00:00')),
     PARTITION p0222 VALUES LESS THAN (TO_DAYS('2015-02-22 00:00:00')),
     PARTITION future VALUES LESS THAN MAXVALUE
);

ALTER TABLE MO_USAGEMSGS
PARTITION BY RANGE (TO_DAYS(MSGCAPTUREDDTS)) (
     PARTITION p0000 VALUES LESS THAN (TO_DAYS('2015-01-04 00:00:00')),
     PARTITION p0111 VALUES LESS THAN (TO_DAYS('2015-01-11 00:00:00')),
     PARTITION p0118 VALUES LESS THAN (TO_DAYS('2015-01-18 00:00:00')),
     PARTITION p0125 VALUES LESS THAN (TO_DAYS('2015-01-25 00:00:00')),
     PARTITION p0201 VALUES LESS THAN (TO_DAYS('2015-02-01 00:00:00')),
     PARTITION p0208 VALUES LESS THAN (TO_DAYS('2015-02-08 00:00:00')),
     PARTITION p0215 VALUES LESS THAN (TO_DAYS('2015-02-15 00:00:00')),
     PARTITION p0222 VALUES LESS THAN (TO_DAYS('2015-02-22 00:00:00')),
     PARTITION future VALUES LESS THAN MAXVALUE
);

ALTER TABLE MO_USAGEDATA
PARTITION BY RANGE (TO_DAYS(REQUESTDTS)) (
     PARTITION p0000 VALUES LESS THAN (TO_DAYS('2015-01-04 00:00:00')),
     PARTITION p0111 VALUES LESS THAN (TO_DAYS('2015-01-11 00:00:00')),
     PARTITION p0118 VALUES LESS THAN (TO_DAYS('2015-01-18 00:00:00')),
     PARTITION p0125 VALUES LESS THAN (TO_DAYS('2015-01-25 00:00:00')),
     PARTITION p0201 VALUES LESS THAN (TO_DAYS('2015-02-01 00:00:00')),
     PARTITION p0208 VALUES LESS THAN (TO_DAYS('2015-02-08 00:00:00')),
     PARTITION p0215 VALUES LESS THAN (TO_DAYS('2015-02-15 00:00:00')),
     PARTITION p0222 VALUES LESS THAN (TO_DAYS('2015-02-22 00:00:00')),
     PARTITION future VALUES LESS THAN MAXVALUE
);
```

#### Oracle ####

Oracle does not permit the ALTER-ing of tables to add partitions. This means that new tables need to be created and the data migrated over.

##### Step 1: Create new tables #####

Create new, paritioned tables with a _NEW suffix. Note that the 'PARTITION BY RANGE (REQUESTDTS) INTERVAL' clause will result in new partitions being created automatically.
 
```
CREATE TABLE MO_USAGE_NEXTHOP_NEW (
        NEXTHOPID number(38,0) NOT NULL,
        EVENTID varchar2(41) NOT NULL,
        URL varchar2(512) NULL,
        REQUESTDTS date NOT NULL,
        CREATEDTS date NOT NULL,
        RESPTIME number(38,0) NULL
        ,CONSTRAINT MO_USG_NEXTHOP_BAK_PK primary key (NEXTHOPID,REQUESTDTS))
        PARTITION BY RANGE (REQUESTDTS) INTERVAL (NUMTODSINTERVAL(7,'day'))
( PARTITION p0 VALUES LESS THAN (to_date('01-JUN-2015','DD-MON-YYYY'))
);

CREATE TABLE MO_USAGEMSGS_NEW (
        EVENTID varchar2(41) NOT NULL,
        SEQ number(38,0) NOT NULL,
        MSGNAME varchar2(64) NOT NULL,
        MSGCAPTUREDDTS date NOT NULL,
        MSGCAPTUREDMILLIS number(38,0) NOT NULL,
        MESSAGE clob NOT NULL,
        TYPE varchar2(10) NOT NULL,
        ISCOMPLETEMESSAGE char(1) NOT NULL,
        TRANSPORTHEADERS varchar2(2048) NULL,
        CONSTRAINT MO_USAGEMSGS_BAK_PK primary key (EVENTID,SEQ, MSGCAPTUREDDTS))
        PARTITION BY RANGE (MSGCAPTUREDDTS) INTERVAL (NUMTODSINTERVAL(7,'day'))
( PARTITION p0 VALUES LESS THAN (to_date('01-JUN-2015','DD-MON-YYYY'))
);

CREATE TABLE MO_USAGEDATA_NEW (
        USAGEDATAID number(38,0) NOT NULL,
        EVENTID varchar2(41) NOT NULL,
        PARENTEVENTID varchar2(41) NULL,
        CLIENTHOST varchar2(255) NULL,
        MPNAME varchar2(64) NOT NULL,
        OPERATIONID number(38,0) NOT NULL,
        SERVICEID number(38,0) NOT NULL,
        ORGID number(38,0) DEFAULT 0 NULL,
        CONTRACTID number(38,0) NOT NULL,
        BINDTEMPLATEID number(38,0) NOT NULL,
        REQUSERNAME varchar2(128) NULL,
        REQUESTDTS date NOT NULL,
        REQUESTMILLIS number(38,0) NOT NULL,
        RESPONSETIME number(38,0) NOT NULL,
        REQMSGSIZE number(38,0) NOT NULL,
        NMREQMSGSIZE number(38,0) NULL,
        RESPMSGSIZE number(38,0) NULL,
        NMRESPMSGSIZE number(38,0) NULL,
        ERRCATEGORY number(38,0) NULL,
        ERRMESSAGE varchar2(512) NULL,
        ERRDETAILS varchar2(1024) NULL,
        CREATEDTS date NOT NULL,
        CREATEDMILLIS number(38,0) NOT NULL,
        NEXTHOPURL varchar2(512) NULL,
        ISSOAPFLTBYMP number(38,0) NOT NULL,
        ISSOAPFLTBYNEXTHOP number(38,0) NOT NULL,
        LISTENERURL varchar2(512) NULL,
        NEXTHOPRESPTIME number(38,0) NULL,
        APPUSERNAME varchar2(128) NULL,
        OTHERUSERNAMES varchar2(512) NULL,
        CUSTOMFIELD1 varchar2(256) NULL,
        VERB varchar2(8) NULL,
        STATUS_CODE varchar2(8) NULL
        ,CONSTRAINT MO_USAGEDATA_PK primary key (USAGEDATAID,REQUESTDTS))
        PARTITION BY RANGE (REQUESTDTS) INTERVAL (NUMTODSINTERVAL(7,'day'))
( PARTITION p0 VALUES LESS THAN (to_date('01-JUN-2015','DD-MON-YYYY'))
);

CREATE  INDEX MO_USAGEDATA_PK1 ON MO_USAGEDATA_NEW(REQUESTDTS DESC,REQUESTMILLIS DESC);
CREATE  INDEX MO_USAGEDATA_PK2 ON MO_USAGEDATA_NEW(OPERATIONID);
CREATE  INDEX MO_USAGEDATA_PK3 ON MO_USAGEDATA_NEW(CONTRACTID);

```

**Note:** Table definitions might change based on product version. You should check to make sure that the definition above matches your table structure and alter it as necessary.

##### Step 2: Switch the new tables with the old tables #####

Rename the existing live tables to *\_BCK and replace them with the new, empty tables:

```
RENAME TABLE MO_USAGEMSGS TO MO_USAGEMSGS_BAK;
RENAME TABLE MO_USAGEMSGS_NEW TO MO_USAGEMSGS;
RENAME TABLE MO_USAGEDATA TO MO_USAGEDATA_BAK;
RENAME TABLE MO_USAGEDATA_NEW TO MO_USAGEDATA;
RENAME TABLE MO_USAGE_NEXTHOP TO MO_USAGE_NEXTHOP_BAK;
RENAME TABLE MO_USAGE_NEXTHOP_NEW TO MO_USAGE_NEXTHOP;

```

##### Step 3: Merge data #####

Due to the fact that you created a set of new tables, you need to merge the data from the old tables into the new partitioned tables so that it is not lost.

```
INSERT INTO MO_USAGE_NEXTHOP SELECT * FROM MO_USAGE_NEXTHOP_BAK;
INSERT INTO MO_USAGEDATA SELECT * FROM MO_USAGEDATA_BAK;
INSERT INTO MO_USAGEMSGS SELECT * FROM MO_USAGEMSGS_BAK;

```

These scripts would be called several times with different, incremental values of X and Y where X and Y represents a small time interval like 6 hours. This keeps the merging of data discrete and less error-prone. 

You also might want to call this from a shell script to automate the process - see the sample script merge.sh in [sample_scripts.zip](sample_scripts.zip).

**Note:** Table definitions might change based on product version. You should check to make sure that the definition above matches your table structure and alter it as necessary.


### <a name="partitioning-verylarge"></a>Partitioning large data stores under load (MySQL Only)

If the usage tables contain a large amount of data you will need to rename, rotate and transfer data from the existing tables to a new set of partitioned tables. For Oracle, the steps are exactly the same as shown in the previous section. For MySQL, it is quicker to partition the tables with an ALTER statement and merge a much smaller dataset. This is shown below.

#### Step 1: Create new tables (MySQL only) ####

Firstly create new tables that will temporarily support the live system. These do not have to be partitioned as they will only support a small amount of data:

```
CREATE TABLE MO_USAGEMSGS_NEW (
	EVENTID VARCHAR(41) NOT NULL,
	SEQ INT NOT NULL,
	MSGNAME VARCHAR(64) NOT NULL,
	MSGCAPTUREDDTS TIMESTAMP DEFAULT 0 NOT NULL,
	MSGCAPTUREDMILLIS INT NOT NULL,
	MESSAGE LONGTEXT NOT NULL,
	TYPE VARCHAR(10) NOT NULL,
	ISCOMPLETEMESSAGE CHAR(1) NOT NULL,
	TRANSPORTHEADERS VARCHAR(2048) NULL.
	CONSTRAINT MO_USAGEMSGS_PK primary key (EVENTID,SEQ,MSGCAPTUREDDTS)

) ROW_FORMAT=DYNAMIC Engine=InnoDB;

CREATE INDEX NUI_MO_USGMSGS1 ON MO_USAGEMSGS_NEW(MSGCAPTUREDDTS);
CREATE INDEX NUI_MO_USGMSGS2 ON MO_USAGEMSGS_NEW(MSGCAPTUREDDTS, MSGCAPTUREDMILLIS);

CREATE TABLE MO_USAGEDATA_NEW (
	USAGEDATAID BIGINT AUTO_INCREMENT NOT NULL,
	EVENTID VARCHAR(41) NOT NULL,
	PARENTEVENTID VARCHAR(41) NULL,
	CLIENTHOST VARCHAR(255) NULL,
	MPNAME VARCHAR(64) NOT NULL,
	OPERATIONID INT NOT NULL,
	SERVICEID INT NOT NULL,
	ORGID INT NULL DEFAULT 0,
	CONTRACTID INT NOT NULL,
	BINDTEMPLATEID INT NOT NULL,
	REQUSERNAME VARCHAR(128) NULL,
	REQUESTDTS TIMESTAMP DEFAULT 0 NOT NULL,
	REQUESTMILLIS INT NOT NULL,
	RESPONSETIME INT NOT NULL,
	REQMSGSIZE INT NOT NULL,
	NMREQMSGSIZE INT NULL,
	RESPMSGSIZE INT NULL,
	NMRESPMSGSIZE INT NULL,
	ERRCATEGORY INT NULL,
	ERRMESSAGE VARCHAR(512) NULL,
	ERRDETAILS VARCHAR(1024) NULL,
	CREATEDTS TIMESTAMP DEFAULT 0 NOT NULL,
	CREATEDMILLIS INT NOT NULL,
	NEXTHOPURL VARCHAR(4000) NULL,
	ISSOAPFLTBYMP INT NOT NULL,
	ISSOAPFLTBYNEXTHOP INT NOT NULL,
	LISTENERURL VARCHAR(4000) NULL,
	NEXTHOPRESPTIME INT NULL,
	APPUSERNAME VARCHAR(128) NULL,
	OTHERUSERNAMES VARCHAR(512) NULL,
	CUSTOMFIELD1 VARCHAR(256) NULL,
	VERB VARCHAR(8) NULL,
	STATUS_CODE VARCHAR(8) NULL,
	CONSTRAINT MO_USAGEDATA_PK primary key (USAGEDATAID, REQUESTDTS)

) ROW_FORMAT=DYNAMIC Engine=InnoDB;

CREATE INDEX MO_USAGEDATA_PK1 ON MO_USAGEDATA_NEW(REQUESTDTS DESC,REQUESTMILLIS DESC);
CREATE INDEX MO_USAGEDATA_PK2 ON MO_USAGEDATA_NEW(OPERATIONID);
CREATE INDEX MO_USAGEDATA_PK3 ON MO_USAGEDATA_NEW(CONTRACTID);

CREATE TABLE MO_USAGE_NEXTHOP_NEW (
	NEXTHOPID BIGINT AUTO_INCREMENT NOT NULL,
	EVENTID VARCHAR(41) NOT NULL,
	URL VARCHAR(4000) NULL,
	REQUESTDTS TIMESTAMP DEFAULT 0 NOT NULL,
	CREATEDTS TIMESTAMP DEFAULT 0 NOT NULL,
	RESPTIME BIGINT NULL,
	CONSTRAINT MO_USG_NEXTHOP_PK primary key (NEXTHOPID)

) ROW_FORMAT=DYNAMIC Engine=InnoDB;
```

**Note:** Table definitions might change based on product version. You should check to make sure that the definition above matches your table structure and alter it as necessary.

#### Step 2: Switch the new tables with the old tables (MySQL only) ####

Rename the existing live tables to *\_BCK and replace them with the new, empty tables:

```
RENAME TABLE MO_USAGEMSGS TO MO_USAGEMSGS_BCK, MO_USAGEMSGS_NEW TO MO_USAGEMSGS;
RENAME TABLE MO_USAGEDATA TO MO_USAGEDATA_BCK, MO_USAGEDATA_NEW TO MO_USAGEDATA;
RENAME TABLE MO_USAGE_NEXTHOP TO MO_USAGE_NEXTHOP_BCK, MO_USAGE_NEXTHOP_NEW TO MO_USAGE_NEXTHOP;
```

#### Step 3: Drop existing foreign keys and add new indexes (MySQL only) ####

Alter the tables as shown in the previous chapter, but this time against the *_BCK tables. 

**Note:** This may take several hours
 
```
ALTER TABLE MO_USAGE_NEXTHOP_BCK
DROP FOREIGN KEY FK_NXTHOP_EVENTID,
DROP PRIMARY KEY,
ADD PRIMARY KEY (NEXTHOPID, REQUESTDTS);

ALTER TABLE MO_USAGEMSGS_BCK
DROP PRIMARY KEY,
ADD PRIMARY KEY (EVENTID,SEQ,MSGCAPTUREDDTS),
DROP FOREIGN KEY FK_USG_EVENTID;

ALTER TABLE MO_USAGEDATA_BCK
DROP PRIMARY KEY,
ADD PRIMARY KEY (USAGEDATAID, REQUESTDTS),
DROP INDEX UI_USG_EVENTID,
ADD INDEX NUI_USG_EVENTID(EVENTID),
ADD INDEX NUI_USG_USAGEDATAID(USAGEDATAID);
```

#### Step 4: Create partitions (MySQL only) ####

You then create partitions as shown in the previous chapter - this time against the *_BCK tables. The dates and intervals would be changed to suit your system.

**Note:** This may take several hours

```
ALTER TABLE MO_USAGE_NEXTHOP_BCK
PARTITION BY RANGE (TO_DAYS(REQUESTDTS)) (
     PARTITION p0000 VALUES LESS THAN (TO_DAYS('2015-01-04 00:00:00')),
     PARTITION p0111 VALUES LESS THAN (TO_DAYS('2015-01-11 00:00:00')),
     PARTITION p0118 VALUES LESS THAN (TO_DAYS('2015-01-18 00:00:00')),
     PARTITION p0125 VALUES LESS THAN (TO_DAYS('2015-01-25 00:00:00')),
     PARTITION p0201 VALUES LESS THAN (TO_DAYS('2015-02-01 00:00:00')),
     PARTITION p0208 VALUES LESS THAN (TO_DAYS('2015-02-08 00:00:00')),
     PARTITION p0215 VALUES LESS THAN (TO_DAYS('2015-02-15 00:00:00')),
     PARTITION p0222 VALUES LESS THAN (TO_DAYS('2015-02-22 00:00:00')),
     PARTITION future VALUES LESS THAN MAXVALUE
);

ALTER TABLE MO_USAGEMSGS_BCK
PARTITION BY RANGE (TO_DAYS(MSGCAPTUREDDTS)) (
     PARTITION p0000 VALUES LESS THAN (TO_DAYS('2015-01-04 00:00:00')),
     PARTITION p0111 VALUES LESS THAN (TO_DAYS('2015-01-11 00:00:00')),
     PARTITION p0118 VALUES LESS THAN (TO_DAYS('2015-01-18 00:00:00')),
     PARTITION p0125 VALUES LESS THAN (TO_DAYS('2015-01-25 00:00:00')),
     PARTITION p0201 VALUES LESS THAN (TO_DAYS('2015-02-01 00:00:00')),
     PARTITION p0208 VALUES LESS THAN (TO_DAYS('2015-02-08 00:00:00')),
     PARTITION p0215 VALUES LESS THAN (TO_DAYS('2015-02-15 00:00:00')),
     PARTITION p0222 VALUES LESS THAN (TO_DAYS('2015-02-22 00:00:00')),
     PARTITION future VALUES LESS THAN MAXVALUE
);

ALTER TABLE MO_USAGEDATA_BCK
PARTITION BY RANGE (TO_DAYS(REQUESTDTS)) (
     PARTITION p0000 VALUES LESS THAN (TO_DAYS('2015-01-04 00:00:00')),
     PARTITION p0111 VALUES LESS THAN (TO_DAYS('2015-01-11 00:00:00')),
     PARTITION p0118 VALUES LESS THAN (TO_DAYS('2015-01-18 00:00:00')),
     PARTITION p0125 VALUES LESS THAN (TO_DAYS('2015-01-25 00:00:00')),
     PARTITION p0201 VALUES LESS THAN (TO_DAYS('2015-02-01 00:00:00')),
     PARTITION p0208 VALUES LESS THAN (TO_DAYS('2015-02-08 00:00:00')),
     PARTITION p0215 VALUES LESS THAN (TO_DAYS('2015-02-15 00:00:00')),
     PARTITION p0222 VALUES LESS THAN (TO_DAYS('2015-02-22 00:00:00')),
     PARTITION future VALUES LESS THAN MAXVALUE
);
```

#### Step 5: Switch the partitioned tables back (MySQL only) ####

Now switch the partitioned tables (*_BCK) with the new tables you created in Step 1. This will return the original data tables to live.

```
RENAME TABLE MO_USAGEDATA TO MO_USAGEDATA2, MO_USAGEDATA_BCK TO MO_USAGEDATA;
RENAME TABLE MO_USAGEMSGS TO MO_USAGEMSGS2, MO_USAGEMSGS_BCK TO MO_USAGEMSGS;
RENAME TABLE MO_USAGE_NEXTHOP TO MO_USAGE_NEXTHOP2, MO_USAGE_NEXTHOP_BCK TO MO_USAGE_NEXTHOP;
```

#### Step 6: Merge data (MySQL only) ####

Due to the fact that you created a set of new tables to temporarily store live data while the partitioning was done, you need to merge the data from those tables back into the live tables so that it is not lost.

```
INSERT INTO MO_USAGE_NEXTHOP 
	(EVENTID, URL, REQUESTDTS, CREATEDTS, RESPTIME) 
SELECT EVENTID, URL, REQUESTDTS, CREATEDTS, RESPTIME 
	FROM MO_USAGE_NEXTHOP_BCK where REQUESTDTS between X and Y;

INSERT INTO MO_USAGEDATA 
	(EVENTID PARENTEVENTID CLIENTHOST MPNAME OPERATIONID SERVICEID ORGID CONTRACTID BINDTEMPLATEID REQUSERNAME REQUESTDTS REQUESTMILLIS RESPONSETIME REQMSGSIZE NMREQMSGSIZE RESPMSGSIZE NMRESPMSGSIZE ERRCATEGORY ERRMESSAGE ERRDETAILS CREATEDTS CREATEDMILLIS NEXTHOPURL ISSOAPFLTBYMP ISSOAPFLTBYNEXTHOP LISTENERURL NEXTHOPRESPTIME APPUSERNAME OTHERUSERNAMES CUSTOMFIELD1 VERB STATUS_CODE) 
SELECT EVENTID PARENTEVENTID CLIENTHOST MPNAME OPERATIONID SERVICEID ORGID CONTRACTID BINDTEMPLATEID REQUSERNAME REQUESTDTS REQUESTMILLIS RESPONSETIME REQMSGSIZE NMREQMSGSIZE RESPMSGSIZE NMRESPMSGSIZE ERRCATEGORY ERRMESSAGE ERRDETAILS CREATEDTS CREATEDMILLIS NEXTHOPURL ISSOAPFLTBYMP ISSOAPFLTBYNEXTHOP LISTENERURL NEXTHOPRESPTIME APPUSERNAME OTHERUSERNAMES CUSTOMFIELD1 VERB STATUS_CODE 
	FROM MO_USAGEDATA_BCK where REQUESTDTS between X and Y;

INSERT INTO MO_USAGEMSGS 
	SELECT * FROM MO_USAGEMSGS_BCK where MSGCAPTUREDDTS between X and Y;
```

**Note:** Table definitions might change based on product version. You should check to make sure that the definition above matches your table structure and alter it as necessary.

These scripts would be called several times with different, incremental values of X and Y where X and Y represents a small time interval like 6 hours. This keeps the merging of data discrete and less error-prone.

You also might want to call this from a shell script to automate the process - see the sample script merge.sh in [sample_scripts.zip](sample_scripts.zip).

### <a name="drop-partitions"></a>Dropping partitions

The benefit of partitioning your data is that you can delete old data by simply dropping a partition. The next sections will describe how to drop partitions for different databases

#### Oracle ####

For Oracle, the tables will automatically create new partitions each week. 

For sample procedures to drop the partitions, download the following zip archive: [sample_scripts.zip](sample_scripts.zip)

#### MySQL ####

For MySQL, you will need to create new partitions and drop old partitions each week. For sample scripts on MySql download the following zip archive: [sample_scripts.zip](sample_scripts.zip)

Once satisfied with the scripts, you can set up a cron job to execute it each night. For example, configuring cron to execute on Sunday morning at 1am as follows:

```
0 1 * * 0 /xxx/bin/partition.sh
```
