begin
  for i in (select view_name from user_views) loop
    execute immediate 'drop view ' || i.view_name;
  end loop;
end;
begin
  for i in (select mview_name from USER_MVIEWS) loop
    execute immediate 'drop MATERIALIZED VIEW ' || i.mview_name;
  end loop;
end;
begin
  for i in (select table_name from USER_TABLES WHERE table_name LIKE 'MLOG$_%') loop
    execute immediate 'drop MATERIALIZED VIEW LOG ON ' || REPLACE(i.table_name,'MLOG$_','');
  end loop;
end;
begin
  for i in (select * from USER_TABLES) loop
    execute immediate 'drop table ' || i.table_name || ' CASCADE CONSTRAINTS purge';
  end loop;
end;
begin
	for i in (select * from USER_SCHEDULER_JOBS) loop
		dbms_scheduler.drop_job(job_name => i.JOB_NAME );
	end loop;
end;

 
