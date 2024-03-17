-- 실습용 데이터베이스 생성
drop database file;
create database file;
use file;


-- 파일 업로드 테이블 생성
create table file(
   fileName varchar(200),
   fileRealName varchar(200)
);