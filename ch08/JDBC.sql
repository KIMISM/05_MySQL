-- 데이터베이스 생성 
create database jdbc_ex;

-- create user : jdbc_ex라는 이름의 사용자 생성
--  identified by : 비밀번호를 jdbc_ex로 설정
create user 'jdbc_ex'@'%' identified by 'jdbc_ex';
-- grant ~ on : 권한 부여하는 명령어
-- all privileges : ahems rnjsgks qndu
--  jdbc_ex라는 사용자에게 jdbc_ex 데이터베이스
grant all privileges on jdbc_ex.* to 'jdbc_ex'@'%';
flush privileges;