LOAD DATA 
    INFILE '/u01/app/oracle/backup/emp.dat'
    APPEND
       INTO TABLE emp_sql
       --WHEN deptno <> '30'
       FIELDS TERMINATED BY ','
       (deptno    INTEGER EXTERNAL,
        dname     CHAR(30),
        loc       CHAR(20)
        )