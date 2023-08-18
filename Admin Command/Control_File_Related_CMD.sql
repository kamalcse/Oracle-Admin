--=========== Control File Related ==============--
alter database backup controlfile to trace as 'D:\trace_cf.txt'; -- to show control file as text mode in other file
select * from v$controlfile;  -- to show control files location
show parameter control_file;  -- to show control files location



--=====CREATE CONTROLFILE : This command creates a new control file.
CREATE CONTROLFILE
   [REUSE] [FILE='new_control.ctl']
   DATABASE "database_name"
   [NORESETLOGS | RESETLOGS]
   [ARCHIVELOG | NOARCHIVELOG]
   [MAXLOGFILES integer]
   [MAXLOGMEMBERS integer]
   [MAXDATAFILES integer]
   [MAXINSTANCES integer]
   [MAXLOGHISTORY integer]
   LOGFILE
      GROUP integer ('log_group_name_1', 'log_group_name_2', ...)
      [SIZE integer [K | M | G]]
      [BLOCKSIZE integer]
      [THREAD integer]
      [ARCHIVE | NOARCHIVE]
   DATAFILE 'data_file_name_1'
      [SIZE integer [K | M | G]]
      [AUTOEXTEND ON [NEXT integer [K | M | G]] [MAXSIZE integer [K | M | G]]]
      ...
   [CHARACTER SET charset]
   [RECOVERABLE]
   [TEMPFILE 'temp_file_name_1' [SIZE integer [K | M | G]]];
   
CREATE CONTROLFILE REUSE DATABASE "DB_NAME" NORESETLOGS ARCHIVELOG
...;
--REUSE: Specifies that an existing control file can be overwritten.
--FILE: The name of the new control file. It is optional
--DATABASE : Specifies the database name.
--NORESETLOGS: Indicates that the database should not be reset to a new incarnation.A Boolean value that specifies whether the database should be reset to a point before the creation of the new control file.
--ARCHIVELOG: Specifies that the database operates in archive log mode.
--Various parameters for controlling the maximum number of log files, data files, etc.
--LOGFILE: Specifies information about redo log groups with size.
--DATAFILE: Specifies information about data files.
--CHARACTER SET AL32UTF8: Specifies the character set for the database.

--example:
CREATE CONTROLFILE REUSE DATABASE "HRDB" NORESETLOGS ARCHIVELOG
    MAXLOGFILES 32
    MAXLOGMEMBERS 2
    MAXDATAFILES 1024
    MAXINSTANCES 8
    MAXLOGHISTORY 292
LOGFILE
    GROUP 1 ('/u01/app/oracle/oradata/HRDB/redo01.log') SIZE 100M,
    GROUP 2 ('/u01/app/oracle/oradata/HRDB/redo02.log') SIZE 100M,
    GROUP 3 ('/u01/app/oracle/oradata/HRDB/redo03.log') SIZE 100M
DATAFILE '/u01/app/oracle/oradata/HRDB/system01.dbf' SIZE 500M,
    '/u01/app/oracle/oradata/HRDB/users01.dbf' SIZE 100M
CHARACTER SET AL32UTF8;

CREATE CONTROLFILE REUSE FILE='new_control.ctl'
       DATABASE 'orcl'
       LOGFILE GROUP 1 ('redo01.log', 'redo02.log') SIZE 50M
       NORESETLOGS;
       
----=====ALTER CONTROLFILE : This command modifies an existing control file.
ALTER CONTROLFILE ADD DATAFILE 'new_datafile.dbf'; --adds a new datafile called new_datafile.dbf to the control file.
ALTER CONTROLFILE REMOVE DATAFILE 'old_datafile.dbf'; --To remove a datafile from the control file
ALTER CONTROLFILE RENAME TO new_control.ctl;  --To change the name of the control file
ALTER CONTROLFILE MOVE TO '/u01/app/oracle/product/11.2.0/dbhome_1/dbs/new_control.ctl';  --To change the location of the control file
ALTER CONTROLFILE ADD LOGFILE GROUP 2 ('redo03.log', 'redo04.log') SIZE 50M;  --To add a new redo log file

ALTER DATABASE RENAME FILE '/path/to/old/controlfile.ctl' TO '/new/path/controlfile.ctl';  --to rename a control file.
ALTER DATABASE BACKUP CONTROLFILE TO '/backup/location/controlfile.bak';  -- to create a backup of the control file to a specified location
alter system set control_files='D:\TOOLS\ORACLE\ORADATA\XE\CONTROL01.CTL', 'D:\TOOLS\ORACLE\ORADATA\XE\CONTROL02.CTL' scope=spfile; -- to modify the list of control files for the database, which can be useful in case you need to add or remove control files.



--=====DROP CONTROLFILE : This command deletes an existing control file.
DROP CONTROLFILE 'old_control.ctl';

--=====BACKUP CONTROLFILE : This command backs up an existing control file.
BACKUP CONTROLFILE TO '/u01/app/oracle/product/11.2.0/dbhome_1/backup/control.ctl';

--=====RESTORE CONTROLFILE : This command restores a control file from a backup.
RESTORE CONTROLFILE FROM 'backup.ctl';

--=====EXPORT CONTROLFILE : This command exports an existing control file to a file.
EXPORT CONTROLFILE TO 'control.exp';

--=====IMPORT CONTROLFILE : This command imports a control file from a file.
IMPORT CONTROLFILE FROM 'control.exp';