--1.---------------------------------------------------------------
SELECT STUDENT_NAME "학생 이름", STUDENT_ADDRESS "학생 주소"
FROM TB_STUDENT
ORDER BY "학생 이름";

--2.---------------------------------------------------------------
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN ='Y'
ORDER BY SUBSTR(STUDENT_SSN,1,6) DESC;

--3.---------------------------------------------------------------
SELECT STUDENT_NAME 학생이름, STUDENT_NO 학번, STUDENT_ADDRESS "거주지 주소"
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_ADDRESS,1,3) IN ('강원도', '경기도')
AND EXTRACT(YEAR FROM ENTRANCE_DATE)<2000
ORDER BY 학생이름;

--4.---------------------------------------------------------------
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
						FROM TB_DEPARTMENT
						WHERE DEPARTMENT_NAME = '법학과')
ORDER BY SUBSTR(PROFESSOR_SSN,1,6);

--5.---------------------------------------------------------------
SELECT STUDENT_NO, TO_CHAR(POINT,'FM9.00') 학점
FROM TB_GRADE
WHERE TERM_NO = '200402'
AND CLASS_NO = 'C3118100'
ORDER BY POINT DESC;
-- # 학점 같으면 하건이 낮은 학생부터 표시 x

--6.---------------------------------------------------------------
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
ORDER BY STUDENT_NAME;
--#확인필요

--7.---------------------------------------------------------------
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO);

--8.---------------------------------------------------------------
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS_PROFESSOR
JOIN TB_CLASS USING(CLASS_NO)
JOIN TB_PROFESSOR USING(PROFESSOR_NO);


--9.---------------------------------------------------------------
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS_PROFESSOR
JOIN TB_CLASS USING(CLASS_NO)
JOIN TB_PROFESSOR USING(PROFESSOR_NO)
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
					   FROM TB_DEPARTMENT
					   WHERE DATEGORY = '인문사회');
--#실행x

--10.---------------------------------------------------------------
SELECT STUDENT_NO , STUDENT_NAME, ROUND(AVG(POINT),1) "전체 평점"
FROM TB_STUDENT
JOIN TB_GRADE USING(STUDENT_NO)
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
					  FROM TB_DEPARTMENT
					  WHERE DEPARTMENT_NAME = '음악학과')
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY 1;

--11.---------------------------------------------------------------
SELECT DEPARTMENT_NAME 학과이름, STUDENT_NAME 학생이름, PROFESSOR_NAME 지도교수이름
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO )
WHERE STUDENT_NO = 'A313047';

--12.---------------------------------------------------------------
SELECT STUDENT_NAME, TERM_NO "TERM_NAME"
FROM TB_STUDENT
JOIN TB_GRADE USING(STUDENT_NO)
WHERE TERM_NO LIKE '2007%'
AND CLASS_NO = (SELECT CLASS_NO
				FROM TB_CLASS
				WHERE CLASS_NAME = '인간관계론');

--13.---------------------------------------------------------------
			
--14.---------------------------------------------------------------


--15.---------------------------------------------------------------
--16.---------------------------------------------------------------


--17.---------------------------------------------------------------
--18.---------------------------------------------------------------


--19.---------------------------------------------------------------


















