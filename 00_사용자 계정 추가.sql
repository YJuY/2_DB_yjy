-- 한 줄 주석

/* 
  범위주석 
 */

-- SQL 하나 수행 : CTRL + CNTER
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 실습용 사용자 계성 생성
CREATE USER kh_YJY IDENTIFIED BY oracle;

-- 사용자 계정 권한 부여
GRANT RESOURCE, CONNECT TO kh_yjy;

-- 객체 생성(테이블 등) 공간 할당량 지정
ALTER USER kh_yjy DEFAULT TABLESPACE SYSTEM
QUOTA UNLIMITED ON SYSTEM;

