--------------------------------------------------------------------------------------
-- Name	       : OT (Oracle Tutorial) Sample Database
-- Link	       : http://www.oracletutorial.com/oracle-sample-database/
-- Version     : 1.0
-- Last Updated: July-28-2017
-- Copyright   : Copyright © 2017 by www.oracletutorial.com. All Rights Reserved.
-- Notice      : Use this sample database for the educational purpose only.
--               Credit the site oracletutorial.com explitly in your materials that
--               use this sample database.
--------------------------------------------------------------------------------------
--------------------------------------------------------------------
-- execute the following statements to create a user name OT and
-- grant priviledges
--------------------------------------------------------------------

--alter session set container=pdbname;
alter session set container=XEPDB1; --XEPDB1, PDB$SEED, CDB$ROOT;

SELECT name FROM v$pdbs WHERE con_id = 3;
SELECT sys_context('USERENV', 'CON_NAME') AS current_container FROM dual;

-- create new user
create user kamal identified by mkamal 
default tablespace users
quota unlimited on users;

--
create user scott identified by tiger 
default tablespace users
quota unlimited on users;

-- grant privileges
GRANT CONNECT, RESOURCE, CREATE SESSION TO scott;