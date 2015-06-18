CREATE OR REPLACE FUNCTION add_days (d date, n number)
RETURN DATE
IS
v_date DATE;
BEGIN
v_date := d + n;

RETURN v_date;
END;
/

CREATE OR REPLACE procedure drop_mo_partition (weeks_to_keep in number := 10)
authid current_user
is
   v_date DATE;
   v_date_cut DATE;
   d DATE;
   n number;
BEGIN
   n := weeks_to_keep * -7;
   v_date_cut :=  add_days (SYSDATE, n);
   FOR cc IN (SELECT partition_name, high_value
                FROM user_tab_partitions
               WHERE table_name = 'MO_USAGEMSGS') 
   LOOP
      EXECUTE IMMEDIATE 'SELECT ' || cc.high_value || ' from dual'
         INTO v_date;
   IF v_date < v_date_cut
   THEN
     EXECUTE IMMEDIATE 'alter table MO_USAGEMSGS drop partition ' || cc.partition_name;
   END IF;
   END LOOP;

   FOR cc IN (SELECT partition_name, high_value
                FROM user_tab_partitions
               WHERE table_name = 'MO_USAGEDATA') 
   LOOP
      EXECUTE IMMEDIATE 'SELECT ' || cc.high_value || ' from dual'
         INTO v_date;
   IF v_date < v_date_cut
   THEN
     EXECUTE IMMEDIATE 'alter table MO_USAGEDATA drop partition ' || cc.partition_name;
   END IF;
   END LOOP;
END;
/

BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
   job_name          =>  'CLEAN_PARTITION',
   program_name      =>  'drop_mo_partition', 
   repeat_interval   =>  'FREQ=WEEKLY;BYDAT=SUN;BYHOUR=0;BYMINUTE=5',
   comments          =>  'Sundays 12:05AM');
END;
/