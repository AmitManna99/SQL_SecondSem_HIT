-- SET 1

-- 1. Display all records from EMP,DEPT and PROJECTS table

SELECT * FROM EMP;

SELECT * FROM DEPT;

SELECT * FROM PROJECTS;

-- 2. Display records of Employees who have salary more than 25000 or working in department D2.

SELECT * FROM EMP
WHERE SAL > 25000
OR DEPTNO = 'D2';

-- 3. Delete employee records working on project P2 and confirm the result. 
--    Type ROLLBACK to restore records back if records are deleted.

COMMIT;

DELETE FROM EMP
WHERE PRJ_ID = 'P2';

SELECT * FROM EMP;

ROLLBACK;

-- 4. Delete department Marketing from DEPT table, confirm the result with reason. 
--    Type ROLLBACK to restore records back if records are deleted.

DELETE FROM DEPT
WHERE DNAME = 'Marketing'; -- It has some child records, so it can be deleted only after deleting 
--                            it's child records

-- 5. Delete records of employees working under Manger with ID 100 and in project P1.

DELETE FROM EMP
WHERE MGR_ID = 100
AND PRJ_ID = 'P1'; -- It has some child records, so it can be deleted only after deleting 
--                    it's child records

-- 6. Update the DNO of first record in PROJECTS to D5, confirm the result with reason.

UPDATE DEPT
SET DNO = 'D5'
WHERE ROWNUM = 1; -- It violates Primary Key Constraints

-- 7. Update the Job of employee with EmpNo 123 to MGR, salary to 35000 and his manager as 111.

UPDATE EMP
SET EJOB = 'MGR', SAL = 35000, MGR_ID = 111
WHERE EMPNO = 123;

-- 8. List all employee names and their salaries, whose salary lies between 25200/- and 35200/- both inclusive.

SELECT ENAME,SAL FROM EMP
WHERE SAL BETWEEN 25200 AND 35200;

-- 9. List all employee names reporting to employees 100,125,150

SELECT ENAME FROM EMP
WHERE MGR_ID IN(100,125,150);

-- 10. List all employees whose name starts with either M or R.

SELECT * FROM EMP
WHERE ENAME LIKE 'M%'
OR ENAME LIKE 'R%';

-- 11. List the name of employees whose name do not starts with M.

SELECT ENAME FROM EMP
WHERE ENAME NOT LIKE 'M%';

-- 12. List all kind jobs available in employee table, avoid displaying duplicates.

SELECT DISTINCT EJOB FROM EMP;

-- 13. List minimum, maximum, average salaries in company.

SELECT MAX(SAL) MAX_SAL, MIN(SAL) MIN_SAL, AVG(SAL) AVG_SAL
FROM EMP;

-- 14. Display the number of employees working in each project.

SELECT PRJ_ID,COUNT(*) FROM EMP
GROUP BY PRJ_ID;

-- 15. List the Employees name and their manager’s names

SELECT E1.ENAME EMP_NAME, E2.ENAME MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR_ID = E2.EMPNO;

-- 16. List Employees Name, their department name and Projects Name in which they are working.

SELECT DISTINCT E.ENAME,D.DNAME,P.PRJ_NAME
FROM EMP E, DEPT D, PROJECTS P
WHERE E.DEPTNO = D.DNO
AND E.PRJ_ID = P.PRJ_NO;

-- 17. List the employee names, salary of employees whose first character of name is R, 2nd and 3rd characters
-- are ‘v’,’i’ and remaining characters are unknown.

SELECT ENAME, SAL FROM EMP
WHERE UPPER(ENAME) LIKE 'RVI%';