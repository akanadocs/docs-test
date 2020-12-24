#!/bin/bash
# $Id$
# $Revision$

PATH=/opt/oracle/instantclient_11_2:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/oracle/instantclient_11_2

SID=""
DB_USER=""
DB_PASS=""
DB_HOST=""
DB_PORT="1521"

sqlcmd="sqlplus -S ${DB_USER}/${DB_PASS}@'(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=${DB_HOST})(PORT=${DB_PORT})))(CONNECT_DATA=(SID=${SID})))'"

date
$sqlcmd <<EOF
delete from MO_ROLLUPDATA where ROLLUPDATAID < (select min(MAX_ID) from MO_STATUS) and INTVLSTARTDTS < TIMESTAMPADD(MONTH, -1, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete from MO_ROLLUP15 where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -1, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete from MO_ROLL_ORG15 where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -1, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete from MO_ROLLUP_HOUR where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -3, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete from MO_ROLL_ORG_H where INTVLSTARTDTS < TIMESTAMPADD(MONTH, -3, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete from MO_ROLLUP_DAY where INTVLSTARTDTS < TIMESTAMPADD(YEAR, -1, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete from MO_ROLL_ORG_D where INTVLSTARTDTS < TIMESTAMPADD(YEAR, -1, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete s from AM_ALERTS a inner join AM_ALERTS_SLAS s on s.ALERTSID = a.ALERTSID where a.SOURCEDTS < TIMESTAMPADD(MONTH, -1, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete from AM_ALERTS where SOURCEDTS < TIMESTAMPADD(MONTH, -1, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete from BOARD_ITEM_ASSIGNMENTS where ITEMID in (select ITEMID from BOARD_ITEMS where ARCHIVABLE='Y' and CREATEDDTS < TIMESTAMPADD(YEAR, -1, now());
EOF
[ $? != 0 ] && exit 1

date
$sqlcmd <<EOF
delete from BOARD_ITEMS where ARCHIVABLE='Y' and CREATEDDTS < TIMESTAMPADD(YEAR, -1, now());
EOF
[ $? != 0 ] && exit 1

date