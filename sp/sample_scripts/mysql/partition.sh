#!/bin/bash
# $id$

DB_USER=""
DB_PASS=""
DB_NAME=""
WEEKS_KEEP=10

mysqlcmd="mysql -NB -u $DB_USER -p${DB_PASS} -D $DB_NAME -e "
NDAY=`$mysqlcmd "select TIMESTAMPADD(DAY, +8,DATE_FORMAT(now(), '%Y-%m-%d 00:00:00'))"`
[ $? != 0 ] && { echo "cannot connect to database"; exit 1; }

MSGS_NUM=`$mysqlcmd "show create table MO_USAGEMSGS\G" | grep PARTITION | wc -l`
MSGS_DEL=`$mysqlcmd "show create table MO_USAGEMSGS\G" | awk '/PARTITION/ { if (match($2,"p[0-9][1-9]")) { print $2; exit;} }'`
[ $? != 0 ] && { echo "cannot connect to database"; exit 1; }

DATA_NUM=`$mysqlcmd "show create table MO_USAGEDATA\G" | grep PARTITION | wc -l`
DATA_DEL=`$mysqlcmd "show create table MO_USAGEDATA\G" | awk '/PARTITION/ { if (match($2,"p[0-9][1-9]")) { print $2; exit;} }'`
[ $? != 0 ] && { echo "cannot connect to database"; exit 1; }

HOP_NUM=`$mysqlcmd "show create table MO_USAGE_NEXTHOP\G" | grep PARTITION | wc -l`
HOP_DEL=`$mysqlcmd "show create table MO_USAGE_NEXTHOP\G" | awk '/PARTITION/ { if (match($2,"p[0-9][1-9]")) { print $2; exit;} }'`
[ $? != 0 ] && { echo "cannot connect to database"; exit 1; }

[ -z "$NDAY" -o "$NDAY" = "NULL" ] && { echo "New partition date $NDAY is invalid"; exit 1; }
[ -z "$MSGS_DEL" -o "$MSGS_DEL" = "NULL" ] && { echo "Old MO_USAGEMSGS partition name $MSGS_DEL is invalid"; exit 1; }
[ -z "$DATA_DEL" -o "$DATA_DEL" = "NULL" ] && { echo "Old MO_USAGEDATA partition name $DATA_DEL is invalid"; exit 1; }
[ -z "$HOP_DEL" -o "$HOP_DEL" = "NULL" ] && { echo "Old MO_USAGE_NEXTHOP partition name $HOP_DEL is invalid"; exit 1; }

echo $NDAY | egrep -q '^20[1-9]' || { echo "New partition date $NDAY is invalid"; exit 1; }
echo $MSGS_DEL | egrep -q '^p[0-9][1-9]' || { echo "Old MO_USAGEMSGS partition name $MSGS_DEL is invalid"; exit 1; }
echo $DATA_DEL | egrep -q '^p[0-9][1-9]' || { echo "Old MO_USAGEDATA partition name $DATA_DEL is invalid"; exit 1; }
echo $HOP_DEL | egrep -q '^p[0-9][1-9]' || { echo "Old MO_USAGE_NEXTHOP partition name $HOP_DEL is invalid"; exit 1; }

PNAME=`echo $NDAY | awk '{ split($1,pname,"-"); print "p"pname[2]pname[3]; }'`
echo $PNAME | egrep -q '^p[0-9][1-9]' || { echo "New partition name $PNAME is invalid"; exit 1; }

[ $MSGS_NUM -le $((WEEKS_KEEP+3)) ] && MSGSCMD1="ALTER TABLE MO_USAGEMSGS DROP PARTITION future" || \
MSGSCMD1="ALTER TABLE MO_USAGEMSGS DROP PARTITION $MSGS_DEL, future"
MSGSCMD2="ALTER TABLE MO_USAGEMSGS ADD PARTITION (PARTITION $PNAME VALUES LESS THAN (TO_DAYS('$NDAY')), PARTITION future  VALUES LESS THAN MAXVALUE)"

[ $DATA_NUM  -le $((WEEKS_KEEP+3)) ] && DATACMD1="ALTER TABLE MO_USAGEDATA DROP PARTITION future" || \
DATACMD1="ALTER TABLE MO_USAGEDATA DROP PARTITION $DATA_DEL, future"
DATACMD2="ALTER TABLE MO_USAGEDATA ADD PARTITION (PARTITION $PNAME VALUES LESS THAN (TO_DAYS('$NDAY')), PARTITION future  VALUES LESS THAN MAXVALUE)"

[ $HOP_NUM  -le $((WEEKS_KEEP+3)) ] && HOPCMD1="ALTER TABLE MO_USAGE_NEXTHOP DROP PARTITION future" || \
HOPCMD1="ALTER TABLE MO_USAGE_NEXTHOP DROP PARTITION $HOP_DEL, future"
HOPCMD2="ALTER TABLE MO_USAGE_NEXTHOP ADD PARTITION (PARTITION $PNAME VALUES LESS THAN (TO_DAYS('$NDAY')), PARTITION future  VALUES LESS THAN MAXVALUE)"

$mysqlcmd "$MSGSCMD1"
[ $? != 0 ] && { echo "alter tabel failed; $MSGSCMD1"; exit 1; } || { echo "Successfully ran $MSGSCMD1"; }
$mysqlcmd "$MSGSCMD2"
[ $? != 0 ] && { echo "alter tabel failed; $MSGSCMD2"; exit 1; } || { echo "Successfully ran $MSGSCMD2"; }
$mysqlcmd "$DATACMD1"
[ $? != 0 ] && { echo "alter tabel failed; $DATACMD1"; exit 1; } || { echo "Successfully ran $DATACMD1"; }
$mysqlcmd "$DATACMD2"
[ $? != 0 ] && { echo "alter tabel failed; $DATACMD2"; exit 1; } || { echo "Successfully ran $DATACMD2"; }
$mysqlcmd "$HOPCMD1"
[ $? != 0 ] && { echo "alter tabel failed; $HOPCMD1"; exit 1; } || { echo "Successfully ran $HOPCMD1"; }
$mysqlcmd "$HOPCMD2"
[ $? != 0 ] && { echo "alter tabel failed; $HOPCMD2"; exit 1; } || { echo "Successfully ran $HOPCMD2"; }

$mysqlcmd "show create table MO_USAGEMSGS\G" | grep PARTITION
$mysqlcmd "show create table MO_USAGEDATA\G" | grep PARTITION
$mysqlcmd "show create table MO_USAGE_NEXTHOP\G" | grep PARTITION
exit 0