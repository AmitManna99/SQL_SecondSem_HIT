-- INSERTING DATA INTO DEPT

-- 1
INSERT INTO DEPT(DNO,DNAME,LOCATIONS)
    VALUES('D1','Marketing','CHN');

-- 2  
INSERT INTO DEPT(DNO,DNAME,LOCATIONS)
    VALUES('D2','Research','MNG');

-- 3 
INSERT INTO DEPT(DNO,DNAME)
    VALUES('D3','Administrator'); -- Can't take the value because department length is VARCHAR2(9)
    
INSERT INTO DEPT(DNO,DNAME)
    VALUES('D3','Admin');

-- 4
INSERT INTO DEPT(DNO,DNAME,LOCATIONS)
    VALUES('D4','HR','BGG'); -- Can't take the value because of BGG violates LOC_CHK constraint

INSERT INTO DEPT(DNO,DNAME,LOCATIONS)
    VALUES('D4','HR','BNG');

-- 5  
INSERT INTO DEPT(DNO,DNAME) -- Will take default value for LOCATIONS
    VALUES('D5','IT');

-- 6
INSERT INTO DEPT(DNO,DNAME,LOCATIONS)
    VALUES(Null,'Corporate','HYD'); -- Primary key can't be NULL
    
INSERT INTO DEPT(DNO,DNAME,LOCATIONS)
    VALUES('D6','Corporate','HYD');

-- -------------------------

SELECT * FROM DEPT;

DELETE FROM DEPT;

DELETE FROM DEPT
WHERE DNO = '';