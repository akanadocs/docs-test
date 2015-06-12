PATH=$PATH:/usr/bin

date
mysql -u xxx -pxxx -D open -e "delete from MO_USAGE_NEXTHOP where REQUESTDTS < TIMESTAMPADD(MONTH, -1, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D open -e "delete from MO_USAGEMSGS where MSGCAPTUREDDTS < TIMESTAMPADD(MONTH, -1, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D open -e "delete from MO_USAGEDATA where REQUESTDTS < TIMESTAMPADD(MONTH, -1, now());"
[ $? != 0 ] && exit 1

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
mysql -u xxx -pxxx -D dbname -e "delete from BOARD_ITEM_ASSIGNMENTS where ITEMID in (select ITEMID from BOARD_ITEMS where ARCHIVABLE='Y' and CREATEDDTS < TIMESTAMPADD(YEAR, -1, now());"
[ $? != 0 ] && exit 1

date
mysql -u xxx -pxxx -D dbname -e "delete from BOARD_ITEMS where ARCHIVABLE='Y' and CREATEDDTS < TIMESTAMPADD(YEAR, -1, now());"
[ $? != 0 ] && exit 1
