SELECT EMP_NAME, 	
		NVL(DEPT_TITLE, '부서없음') AS DEPT_TITLE,SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)--ID없어도 모두 조회(LEFT)
WHERE NVL(DEPT_TITLE, '부서없음') = '부서없음';--그냥 DEPT_TITLE을 하면 부서없음이 검색 X
+

SELECT EMP_NAME, JOB_NAME, SALARY, SALARY*12
FROM EMPLOYEE
--JOIN JOB USING (JOB_CODE)
NATURAL JOIN JOB
WHERE JOB_NAME = '부사장'
AND SALARY>3000000;

--입사일을 입력("2022-09-06") 받아
-- 입력 받은 값 보다 먼저 입사한 사람의
-- 이름, 입사일(1990년 01월 01일), 성별(M,F) 조회 

SELECT EMP_NAME 이름, 
		TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일"') 입사일, 
		DECODE(SUBSTR(EMP_NO, 8, 1) , '1', 'M', '2', 'F') 성별
		-- 990508-1234567
FROM EMPLOYEE
WHERE HIRE_DATE < TO_DATE('2022-09-06');
					--> TO_DATE 생략 가능




SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, 
	   NVL( DEPT_TITLE, '부서없음' ) DEPT_TITLE,
	   JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN JOB USING(JOB_CODE);


SELECT * FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE = ''


SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE,
   NVL( DEPT_TITLE, '부서없음' ) DEPT_TITLE,
 JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN JOB USING(JOB_CODE)
WHERE SALARY >= 3700000;
 

SELECT DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
GROUP BY DEPT_TITLE;




SELECT JOB_NAME, ROUND(AVG(SALARY),1) AVERAGE
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
GROUP BY JOB_NAME, JOB_NAME
ORDER BY JOB_NAME;

































