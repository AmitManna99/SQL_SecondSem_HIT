-- SET 2

-- 1. List the Projects name undertaken by Marketing Department.

SELECT PRJ_NAME FROM PROJECTS P,DEPT D
WHERE P.DNO = D.DNO
AND DNAME = 'Marketing';

-- 2. Display current date, 53, absolute value of -45 and current date as date with format MONTH-YY.

SELECT SYSDATE CURR_DATE, 53, ABS(-45), TO_CHAR(SYSDATE,'MONTH-YY') CURR_MONNTH
FROM DUAL;

-- 3. Display the employees name and salary in descending order by salary.

SELECT ENAME,SAL FROM EMP
ORDER BY SAL DESC;

-- 4.  List the name of departments which are working with more than 1 projects.

SELECT D.DNAME, P_TEMP.NO_OF_PRJ 
FROM DEPT D, (SELECT DNO,COUNT(*) NO_OF_PRJ FROM PROJECTS
              GROUP BY DNO) P_TEMP
WHERE D.DNO = P_TEMP.DNO
AND P_TEMP.NO_OF_PRJ > 1;

-- 5. Display department name, Max salary and Min salary in each department.

SELECT DNAME, MAX(SAL) MAX_SAL, MIN(SAL) MIN_SAL
FROM (SELECT DNAME,SAL FROM DEPT,EMP
      WHERE DEPT.DNO = EMP.DEPTNO)
GROUP BY DNAME;

-- 6. List the employees whose experience is more than 5 years.

SELECT EMPNO,ENAME FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE,DATE_OF_JOIN)/12 > 5;


-- 7. List the Employees number, Name and their Age and retirement date(assume 60 years retirement age).

SELECT EMPNO, ENAME, FLOOR(MONTHS_BETWEEN(SYSDATE,BIRTH_DATE)/12) AGE, ADD_MONTHS(BIRTH_DATE,60*12) RETIREMENT_DATE
FROM EMP;

-- 8. List the Employees who born on December month.

SELECT EMPNO, ENAME FROM EMP
WHERE TO_CHAR(BIRTH_DATE,'MM') = '12';

-- 9. List the Employees names who born on a given year.

SELECT EMPNO, ENAME FROM EMP
WHERE &YEAR = TO_CHAR(BIRTH_DATE,'YYYY');

-- 10. List the Employees names who joined on day 12.

SELECT EMPNO, ENAME FROM EMP
WHERE TO_CHAR(DATE_OF_JOIN,'DD') = '12';

-- 11. List the Employees names having service experience more than 10 years.

SELECT EMPNO,ENAME FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE,DATE_OF_JOIN)/12 > 10;

-- 12. List the projects which have duration more than 1 year.

SELECT PRJ_NO,PRJ_NAME FROM PROJECTS
WHERE MONTHS_BETWEEN(END_DATE,START_DATE)/12 > 1
OR MONTHS_BETWEEN(SYSDATE,START_DATE)/12 > 1;


-- 13. List the Employees Name who is working at Locations (BNG,MUB,HYD)

SELECT EMPNO,ENAME FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DNO
AND D.LOCATIONS IN('BNG','MUB','HYD');

-- 14. Update the COMM column of EMP table based on the SAL. Use COMM=CMM+SAL*10/100

UPDATE EMP
SET COMM = COMM + SAL*0.1;

-- 15. List employee names, padded to right with a series of three periods and space up to a width of 30, 
--     and project credits of projects in which they are working.(Use RPAD,LPAD)

SELECT RPAD('12',20,'*') FROM DUAL;

SELECT LPAD(ENAME,30,'...') ENAME, RPAD(PRJ_CREDITS,30,' ') PRJ_CREDITS
FROM EMP E, PROJECTS P
WHERE E.PRJ_ID = P.PRJ_NO;

-- 16. List the name of employees who are working in project with credit more than7 and 
--     display name with only first letter capital and replace the character ‘a’(if present) 
--     in the name by ‘$’.

SELECT * FROM PROJECTS;

SELECT REPLACE(INITCAP(ENAME),'a','$')
FROM EMP E, PROJECTS P
WHERE E.PRJ_ID = P.PRJ_NO
AND PRJ_CREDITS >= 7;

-- 17. Display department Name and Total amount spent on each department by the company as Salary.

SELECT D.DNAME, TEMP.SALARY
FROM DEPT D, (SELECT DEPTNO,SUM(SAL) SALARY FROM EMP
              GROUP BY DEPTNO) TEMP
WHERE D.DNO=TEMP.DEPTNO;

-- 18. List Employee numbers, SAL *12 (rename as ANNUAL_SAL), SAL*12 *0.1 (as TAX) , 
--     display ANNUAL_SAL and TAX in the format of $12,34,456.90.

SELECT EMPNO, TO_CHAR(SAL*12,'$99,99,999.99') ANNUAL_SAL, TO_CHAR(SAL*12*0.1,'$99,99,999.99') TAX
FROM EMP;
