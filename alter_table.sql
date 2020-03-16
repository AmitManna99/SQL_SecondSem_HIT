DESC EMP;
DESC DEPT;
DESC PROJECTS;

-- -----------------------

SELECT * FROM USER_CONSTRAINTS 
WHERE TABLE_NAME='EMP';

SELECT * FROM USER_CONSTRAINTS 
WHERE TABLE_NAME='DEPT';

SELECT * FROM USER_CONSTRAINTS 
WHERE TABLE_NAME='PROJECTS';

-- -----------------------

-- 1. Add EMPNO as a primary key constraint to EMP table.

ALTER TABLE EMP
ADD CONSTRAINT PK_EMP PRIMARY KEY(EMPNO);

-- 2. Add a foreign key constraint to EMP table on MGR_ID referencing EMP.

ALTER TABLE EMP
ADD CONSTRAINT RF_MGR FOREIGN KEY(MGR_ID) REFERENCES EMP;

/* 
    3.Modify the column PRJ_ID in EMP table as follows-
    i) Change the data type from VARCHAR2(9) to VARCHAR2(5) .

    ii) Drop the constraints on PRJ_ID in EMP table and add a foreign key constraint to EMP
        table on (DEPTNO, PRJ_ID) referencing PROJECTS. This foreign key indicates an
        employee from a particular department is working on which project(s).
*/

-- i

ALTER TABLE EMP
MODIFY PRJ_ID VARCHAR2(5);

-- ii

SELECT * FROM USER_CONSTRAINTS 
WHERE TABLE_NAME='EMP';

ALTER TABLE EMP
DROP CONSTRAINT SYS_C007021;

ALTER TABLE EMP
ADD CONSTRAINT FR_PRJ FOREIGN KEY(DEPTNO,PRJ_ID) REFERENCES PROJECTS;

-- 4. Add a column to DEPT table named LOCATIONS with data type VARCHAR2(9).

ALTER TABLE DEPT
ADD LOCATIONS VARCHAR2(9);

-- 5. Add CHECK constraint on LOCATIONS so that allowed values will be 
--    BNG/MNG/MUB/HYD/CHN and default value is BNG. 

ALTER TABLE DEPT
ADD CONSTRAINT LOC_CHK CHECK(LOCATIONS IN('BNG','MNG','MUB','HYD','CHN'));

ALTER TABLE DEPT
MODIFY LOCATIONS DEFAULT 'BNG';

COMMIT;