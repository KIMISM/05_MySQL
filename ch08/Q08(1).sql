-- tabledb 생성,  만약 존재한다면 삭제
drop database if exists tabledb;
create database tabledb;

-- usertbl 테이블 생성
drop table if exists usertbl;
create table usertbl(
-- char : 고정문자, NOT NULL : 필수, primary key : 기본 키
userID char(8) not null primary key,
-- varchar : 가변문자
name varchar(10) not null,
-- int : 정수형
birthYear int not null,
addr char(2) not null,
-- null : 옵션
mobile1 char(3) null,
mobile2 char(8) null,
-- smallint : 작은정수형usertbl
height smallint null,
-- date : 날짜형
mDate date null
);

-- buytbl 테이블 생성
drop table if exists buytbl;
create table buytbl(
-- auto_increment : 인덱스 자동 증가
num int auto_increment not null primary key,
userid char(8) not null,
prodName char(6) not null,
groupName char(4) null,
price int not null,
amount smallint not null,
-- foreign key (해당 키) references 참조할 테이블 (참조할 키)
-- 다른 테이브르이 기본키를 참조하는 외래키
foreign key(userid) references usertbl(userID)
);

-- 회원 테이블 데이터 입력
-- insert into 테이블명 values(실제 값들...) : 각 칼럼명에 맞는 실제 데이터 추가 (행 추가)
insert into usertbl values('LSG','이승기','1987','서울','011','1111111',182,'2008-8-8');
insert into usertbl values('KBS','김범수','1979','경남','011','2222222',173,'2012-4-4');
insert into usertbl values('KKH','김경호','1971','전남','019','3333333',177,'2007-7-7');

-- 구매 테이블 데이터 입력  
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
insert into buytbl values(null,'KBS','운동화',null, 30,2);
insert into buytbl values(null,'KBS','노트북','전자', 1000,1);
-- 외래키 제약 조건 에러 발생 : 참조하고 있는 usertbl의 userID에 'JYP'라는 데이터가 없으므로 발생
insert into buytbl values(null,'JYP','모니터','전자', 200,1);

-- 기존 usertbl 삭제 
-- usertbl의 기본 키인 userID열은 buytbl에 외래 키로 연결되어 있기 때문에 외래 키를 제거한 후에 다시 기본 키를 제거해야함
alter table buytbl drop foreign key buytbl_ibfk_1;
drop table if exists usertbl;
create table usertbl(
userID char(8) not null,
name varchar(10) not null,
birthYear int not null,
--  constraint primary key : 기본키 제약조건 
constraint primary key PK_userTBL_userID(userID)
);

-- 기존 prodtbl 삭제
drop table if exists prodtbl; 
create table prodtbl(
prodCode char(3) not null,
prodID char(4) not null,
prodDate DATETIME not null,
prodCur char(10) null,
-- 제약조건명은 생략 가능
-- prodCode와 prodID 칼럼을 합쳐서 복합키로 기본키를 만들었다.  
constraint PK_prodTbl_procode_prodID primary key (prodCode, prodID)
);










