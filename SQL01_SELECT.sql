-- [ Basic SELECT ] --
-- 1.
SELECT DEPARTMENT_NAME 학과명, CATEGORY 계열
FROM TB_DEPARTMENT;

--2. <참고>--------------------------------------------------------------------------------------
SELECT DEPARTMENT_NAME || '의 정원은 '
		|| CAPACITY || '명 입니다.' "학과별 정원"
FROM TB_DEPARTMENT;



--3.--------------------------------------------------------------------------------------
SELECT STUDENT_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '국어국문학과'
AND SUBSTR(STUDENT_SSN, 8, 1) = '2'
AND ABSENCE_YN = 'Y';



--4. --------------------------------------------------------------------------------------
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN('A513079' , 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NO DESC;



--5.--------------------------------------------------------------------------------------
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;




--6. --------------------------------------------------------------------------------------
SELECT PROFESSOR_NAME 
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;



--7.--------------------------------------------------------------------------------------
SELECT STUDENT_NAME 학과지정X
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;



--8.--------------------------------------------------------------------------------------
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;



--9.--------------------------------------------------------------------------------------
SELECT CATEGORY FROM TB_DEPARTMENT
UNION
SELECT CATEGORY FROM TB_DEPARTMENT;



--10. --------------------------------------------------------------------------------------
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN, ENTRANCE_DATE,ABSENCE_YN 
FROM TB_STUDENT
WHERE SUBSTR(ENTRANCE_DATE, 2, 1)='2'
AND STUDENT_ADDRESS LIKE '%전주%'
AND ABSENCE_YN ='N';




--================================================================================================

-- [ Additional SELECT - 함수 ] --
-- 1. --------------------------------------------------------------------------------------
SELECT STUDENT_NO 학번, STUDENT_NAME 이름, 
		TO_CHAR(ENTRANCE_DATE,'YYYY-MM-DD') 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY 1;



--2. --------------------------------------------------------------------------------------
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';
-- 세글자가 아닌 교수는 2명이다 (강혁(2글자), 박강아름(4글자)) 세글자가 아닌 모든 교수를 축력하기 때문에 2글자와 4글자를 가진 교수 모두 출력된다.



-- 3.--------------------------------------------------------------------------------------
--SELECT PROFESSOR_NAME 교수이름, 
--		TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-(SUBSTR(PROFESSOR_SSN,1,2)+1900) 나이
--FROM TB_PROFESSOR
--WHERE SUBSTR( PROFESSOR_SSN,8,1) ='1'
--ORDER BY 2;

SELECT PROFESSOR_NAME 교수이름,
		FLOOR( MONTHS_BETWEEN(SYSDATE, TO_DATE(19 || SUBSTR(PROFESSOR_SSN, 1, 6))) /12) 나이
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN ,8,1) = '1'
ORDER BY 나이;

--4.--------------------------------------------------------------------------------------
SELECT SUBSTR(PROFESSOR_NAME, 2, 2) 이름
FROM TB_PROFESSOR;



--5.--------------------------------------------------------------------------------------
--SELECT STUDENT_NO , STUDENT_NAME 이름
--FROM TB_STUDENT
--WHERE SUBSTR(STUDENT_SSN,1,2)+1919 < TO_NUMBER(TO_CHAR(ENTRANCE_DATE,'YYYY'));

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE)
	- EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,6)) ) > 19;

-- (입학일자 - 생년월일)



--6.--------------------------------------------------------------------------------------
SELECT TO_CHAR(TO_DATE(20201225), 'DAY') "2020년 크리스마스" 
FROM DUAL;



--7. --------------------------------------------------------------------------------------
SELECT TO_DATE('99/10/11', 'YY/MM/DD'), TO_DATE('49/10/11', 'YY,MM,DD'),
	   TO_DATE('99/10/11', 'RR/MM/DD'), TO_DATE('49/10/11', 'RR,MM/DD')
FROM DUAL;
-- 2099년 10월 11일 / 2099년 10월 11일
-- 1999년 10월 11일 / 2049년 10월 11일



--8.--------------------------------------------------------------------------------------
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_NO, 1,1)<>'A';



--9.--------------------------------------------------------------------------------------
SELECT ROUND(AVG(POINT),1) 평점
FROM TB_STUDENT
JOIN TB_GRADE USING (STUDENT_NO)
WHERE STUDENT_NO = 'A517178';



--10. <참고>--------------------------------------------------------------------------------------
SELECT DEPARTMENT_NO 학과번호, COUNT(*) "학생수(명)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO 
ORDER BY 1;



--11. --------------------------------------------------------------------------------------
SELECT COUNT(*)
FROM TB_STUDENT
WHERE  COACH_PROFESSOR_NO IS NULL;



--12. <참고>--------------------------------------------------------------------------------------
SELECT SUBSTR(TERM_NO,1,4) 년도, ROUND(AVG(POINT),1) "년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4)
ORDER BY 년도;



--13. <참고>--------------------------------------------------------------------------------------
SELECT DEPARTMENT_NO 학과코드명, 
COUNT(DECODE(ABSENCE_YN,'Y',1)) "휴학생 수"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;



--14. --------------------------------------------------------------------------------------
SELECT STUDENT_NAME, COUNT(*) "동명인 수"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*)>1
ORDER BY 1;



--15.<참고>--------------------------------------------------------------------------------------
SELECT NVL(SUBSTR(TERM_NO ,1,4), ' ') 년도, 
	   NVL(SUBSTR(TERM_NO ,5,2), ' ') 학기 , ROUND(AVG(POINT),1)  평점
FROM TB_GRADE
WHERE STUDENT_NO ='A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO ,1,4), SUBSTR(TERM_NO ,5,2) )
ORDER BY SUBSTR(TERM_NO ,1,4),SUBSTR(TERM_NO ,5,2) ;











