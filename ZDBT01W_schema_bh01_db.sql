-- SCRIPT TO CREATE tablespaces for schema and the schema owner&users
-- *** Directory Layout - Examples ***
-- ${ORACLE_BASE}/oradata/${ORACLE_SID}/bh
-- UNIX = /u01/oradata/ZDBT01L/bh/bh01_tblsp.dbf
-- Windows = E:\app\oracle\oradata\ZDBT01W\bh01
CREATE TABLESPACE BH
DATAFILE 'E:\app\oracle\oradata\ZDBT01W\bh\bh01_tblsp.dbf' SIZE 5M REUSE 
AUTOEXTEND ON NEXT 300 K MAXSIZE UNLIMITED
ONLINE;

commit;

CREATE USER bhdba IDENTIFIED BY "bhdba"
DEFAULT TABLESPACE BH TEMPORARY TABLESPACE TEMP 
QUOTA UNLIMITED ON BH 
ACCOUNT UNLOCK;

GRANT CREATE SESSION TO bhdba;
GRANT RESOURCE TO bhdba;
GRANT CREATE TABLE TO bhdba;
GRANT CREATE VIEW TO bhdba;
GRANT CREATE TRIGGER TO bhdba;
GRANT CREATE PROCEDURE TO bhdba;
GRANT CREATE PUBLIC SYNONYM TO bhdba; 
GRANT DROP PUBLIC SYNONYM TO bhdba; 

commit;

CREATE USER bhrdr IDENTIFIED BY "bhrdr" 
DEFAULT TABLESPACE BH TEMPORARY TABLESPACE TEMP 
QUOTA UNLIMITED ON BH 
ACCOUNT UNLOCK;

GRANT CREATE SESSION TO bhrdr;

commit;

quit;