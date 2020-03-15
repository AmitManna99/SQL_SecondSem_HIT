-- INSERTING DATA INTO EMP

-- While inserting the data, you have to maintain the same order

-- 1
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,SAL,COMM,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(150, 'Some', 'CEO', NULL, '10-DEC-1970', 60000, 30000, NULL, NULL, '3-DEC-1990');

-- 2
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,SAL,COMM,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(111, 'Raghu', 'GM', 150, '10-DEC-1974', 45000, 15000, NULL, NULL, '3-DEC-1985');

-- 3
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(125, 'Manu', 'A.MGR', 150, '10-DEC-1980', 'D4', 'P2', '2-OCT-2002'); -- Will take the default value for SAL,COMM

-- 4
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,SAL,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(100, 'Ravi', 'MGR', 111, '10-OCT-1985', 32000, 'D1', 'P1', '2-OCT-2001'); -- Will take the default value for COMM

-- 5
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(103, 'Ankita', 'A.CLRK', 111, '10-DEC-1980', 'D1', 'P1', '2-OCT-2001'); -- Can't take value because A.CLRK is not
                                                                                    -- in the EJOB Check list
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(103, 'Ankita', 'A.MGR', 111, '10-DEC-1980', 'D1', 'P1', '2-OCT-2001'); -- Will take the default value for SAL,COMM
    
-- 6
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,COMM,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(103, 'Amit', 'CLRK', 111, '2-OCT-1980', NULL, 'D1', 'P3', '2-OCT-2002'); -- Can't take the value because EMPNO already exist

INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,COMM,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(109, 'Amit', 'CLRK', 111, '2-OCT-1980', NULL, 'D1', 'P3', '2-OCT-2002'); -- Changed the EMPNO, Will take the default value for SAL 
    
-- 7
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,COMM,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(103, 'Arun', 'CLRK', 111, '10-DEC-1980', NULL, 'D1', 'P3', '2-OCT-2001'); -- Can't take the value because EMPNO already exist
    
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,COMM,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(107, 'Arun', 'CLRK', 111, '10-DEC-1980', NULL, 'D1', 'P3', '2-OCT-2001'); -- Changed the EMPNO, Will take the default value for SAL

-- 8
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,DEPTNO,DATE_OF_JOIN)
    VALUES(108, 'Tisa', 'CLRK', '125', '10-DEC-1970', 'D9', '2-OCT-1985'); -- Can't take the value without any PRJ_ID and a non-existing DEPTNO

INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(108, 'Tisa', 'CLRK', '125', '10-DEC-1970', 'D3', 'P2', '2-OCT-1985'); -- Will take the default value for SAL,COMM
    
-- 9
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,SAL,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(102, 'Raviraj', 'CLRK', 100, '10-DEC-1980', 24000, 'D1', 'P3', '12-NOV-2000'); -- Will take the default value for COMM

-- 10
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(104, 'Akas', 'CLERK', 100, '2-OCT-1980', 'D2', 'P1', '2-OCT-2005'); -- Can't take value because CLERK is not
                                                                            -- in the EJOB Check list
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(104, 'Akas', 'CLRK', 100, '2-OCT-1980', 'D2', 'P1', '2-OCT-2005'); -- Will take the default value for SAL,COMM
    
-- 11
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,COMM,DEPTNO,DATE_OF_JOIN)
    VALUES(106, 'Varsa', 'MGR', 100, '2-OCT-1986', NULL, 'D2', '2-OCT-1985'); -- Can't take the value without any PRJ_ID and
                                                                                -- BIRTH_DATE > DATE_OF_JOIN
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,COMM,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(106, 'Varsa', 'MGR', 100, '2-OCT-1986', NULL, 'D2', 'P1', '2-OCT-2003'); 
    
-- 12
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,SAL,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(123, 'Mahesh', 'CLRK', 106, '10-DEC-1974', 25000, 'D3', 'P2', '2-OCT-2002'); -- Will take the default value for COMM

-- 13
INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,SAL,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(NULL, 'Rick', 'CLRK', 106, '10-DEC-1980', 18000, 'D3', 'P2', '10-DEC-1980'); -- Can't take NULL value as EMPNO and 
                                                                                        -- BIRTH_DATE = DATE_OF_JOIN and SAL < 20000

INSERT INTO EMP(EMPNO,ENAME,EJOB,MGR_ID,BIRTH_DATE,SAL,DEPTNO,PRJ_ID,DATE_OF_JOIN)
    VALUES(112, 'Rick', 'CLRK', 106, '10-DEC-1980', 22000, 'D3', 'P2', '10-DEC-2001'); -- Will take the default value for COMM

-- -------------------------

SELECT * FROM EMP;

DELETE FROM EMP;

DELETE FROM EMP
WHERE EMPNO = <EMPNO>;

COMMIT;