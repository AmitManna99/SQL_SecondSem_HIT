SET-3

-- 1. List Job category and total salary paid for the each jobs category by the company.

SELECT EJOB,SUM(SAL)FROM EMP
GROUP BY EJOB;

-- 2. Display name of the department from which maximum number of employees are working on project P1

SELECT DNAME FROM DEPT
WHERE DNO = (SELECT T.DEPTNO FROM (SELECT DEPTNO,COUNT(*) NO_OF_EMP FROM EMP
                                   WHERE PRJ_ID = 'P1'
                                   GROUP BY DEPTNO
                                   ORDER BY NO_OF_EMP DESC) T
              WHERE ROWNUM = 1);

-- 3. Display department names and number of CLRK working in the departments.

SELECT D.DNAME, COUNT(E.EJOB) NO_OF_CLRK
FROM DEPT D,EMP E
WHERE E.DEPTNO = D.DNO 
AND E.EJOB = 'CLRK'
GROUP BY D.DNAME;

-- 4. Display Employee names who are not working in any of the projects.

SELECT ENAME FROM EMP
WHERE PRJ_ID IS NULL; 

-- 5. Create a View EMP_PRJ_VW to display records of employees of ‘marketing’ department and project in which they are working. 

CREATE VIEW EMP_PRJ_VW
AS SELECT E.EMPNO, E.ENAME, P.PRJ_NO, P.PRJ_NAME 
FROM EMP E, PROJECTS P, DEPT D
WHERE E.PRJ_ID = P.PRJ_NO 
AND E.DEPTNO = D.DNO 
AND DNAME = 'Marketing';

-- 6. Display employee names and projects in which they are working using View EMP_PRJ_VW.

SELECT * FROM EMP_PRJ_VW;

-- 7. Insert a record into View EMP_PRJ_VW and check the underlying tables for result and 
--    confirm result with reason.

INSERT INTO EMP_PRJ_VW(EMPNO, ENAME, PRJ_NO, PRJ_NAME)
    VALUES(201,'Rohan','P1','Prj005'); -- Can't insert because View doesn't have any existance, it is retriving data from table
                                       -- table and showing us. when we trying to insert in view, we just input the attributes that
                                       -- are on the view. But becuase of other table constrains, it can't modify in original table.

-- 8. Create an unique index on the column name DNAME on DEPT table.

CREATE UNIQUE INDEX INDEX_DEPT
ON DEPT(DNAME); -- t can't be index because it is already indexed while creation of table

-- 9. Create an index on the columns (name and job) on EMP table.

CREATE INDEX INDEX_EMP
ON EMP(ENAME,EJOB);

-- 10. Create a Sequence STUD_SEQ which starts from 100 to 999 with increments of 3.

CREATE SEQUENCE STUD_SEQ
START WITH 100
INCREMENT BY 3
MAXVALUE 999;

-- 11. Create a table STUD with columns ROLLNO and Name. Insert ROLLNO values by 
--     taking values from STUD_SEQ.

CREATE TABLE STUD
(
 ROLLNO NUMBER(3),
 SNAME VARCHAR2(15)
);

--INSERT VALUE
 
INSERT INTO STUD(ROLLNO,SNAME)
    VALUES(STUD_SEQ.NEXTVAL,'SHUVAM');

SELECT * FROM STUD;

-- 12. Display Location of department and Employees name working in Marketing department or 
--     Research (using set operator).

(
 SELECT D.LOCATIONS, E.ENAME 
 FROM DEPT D, EMP E
 WHERE E.DEPTNO = D.DNO 
 AND D.DNAME = 'Marketing'
)
UNION
(
 SELECT D.LOCATIONS, E.ENAME
 FROM DEPT D, EMP E
 WHERE E.DEPTNO = D.DNO 
 AND D.DNAME = 'Research'
);

-- 13. Display the names of the Departments undertaking both projects P1 and P3 (using set operator).

(
 SELECT D.DNAME
 FROM DEPT D, PROJECTS P
 WHERE D.DNO = P.DNO 
 AND P.PRJ_NO = 'P1'
)
INTERSECT
(
 SELECT D.DNAME
 FROM DEPT D, PROJECTS P
 WHERE D.DNO = P.DNO 
 AND P.PRJ_NO = 'P3'
);

COMMIT;
