CONNECT sys/system@XE as sysdba;
CONNECT sys/system@XEPDB1 as sysdba;

--========= Container Related=============
--alter session set container=pdbname;
alter session set container=CDB$ROOT; --XEPDB1, PDB$SEED, CDB$ROOT;
alter session set container=XEPDB1;

SELECT * FROM v$pdbs WHERE con_id = 3;
SELECT sys_context('USERENV', 'CON_NAME') AS current_container FROM dual;

--CONNECT kamal/mkamal@XEPDB1; -- to connect to a pdb user;

select username from dba_users where lower(username) like 'k%';
SELECT * FROM cdb_users; -- show all container databases users
SELECT *  FROM dba_pdbs; -- show all pluggable databases

--======= Control File Related=======--
alter database backup controlfile to trace as 'D:\trace_cf.txt'; -- to show control file as text mode in other file
select * from v$controlfile;  -- to show control files location
show parameter control_file;  -- to show control files location


--============= Others ==============
SELECT USER FROM dual; -- show current Oracle user
SELECT SESSION_USER FROM dual; -- show current Oracle user
SELECT * FROM user_users; -- Show the information of the current user
SELECT name, log_mode FROM v$database;
SELECT * FROM DBA_TABLESPACE_GROUPS;

SELECT * FROM V$SESSION;


select GROUP#,bytes/1024/1024 "MB",MEMBERS from v$log;
select * from v$log;
select group#,member from v$logfile;
select * from v$logfile;

select * from dba_tables where lower(table_name) like 'v$%' 




SELECT * --tablespace_name, file_name, bytes / (1024 * 1024) as size_mb
FROM dba_data_files
ORDER BY tablespace_name;

SELECT property_name, property_value FROM database_properties WHERE property_name='DEFAULT_TEMP_TABLESPACE'; --to check which tablespace is default
SELECT * FROM database_properties WHERE property_name='DEFAULT_TEMP_TABLESPACE'; --to check which tablespace is default







