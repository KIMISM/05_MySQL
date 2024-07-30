-- 사용자별 구매 이력 출력 
SELECT * FROM buytbl;

-- 모든 칼럼을 출력 
select * from buytbl
Inner join usertbl
on buytbl.userID = usertbl.userID;

-- 구매이력이 없는 정보는 출력하지 않는다
select DISTINCT U.userID, U.name, U.addr
from usertbl U
INNER JOIN buytbl B
ON U.userID = B.userID
order by U.userID;

-- userID가 'JYP'인 데이터만 출력하세요.
select * from buytbl
inner join usertbl
on buytbl.userID = usertbl.userID
where buytbl.userID = 'JYP';

-- 각 사용자별로 구매 이력 출력
-- 연결 컬름은 userID
-- 결과를 userID를 기준으로 오름차순 정렬
-- 구매이력이 없는 사용자도 출력
-- userID, name, prodName, addr, 연락처를 출력
select U.userID, U.name, B.prodName, U.addr, concat(U.mobile1, U.mobile2) AS '연락처'
from usertbl U
INNER join buytbl B
ON U.userID = B.userID
order by U.userID; 

-- sqldb의 사용자를 모두 조회하되 전화가 없는 사람은 제외하고 출력
SELECT name, concat(mobile1, mobile2) as '전화번호' from usertbl
WHERE name not in (SELECT name FROM usertbl where mobile1 is null);

-- sqldb의 사용자를 모두 조회하되 전화가 없는 사람만 출력
select name, concat(mobile1, mobile2) as '전화번호' from usertbl
WHERE name in(select name from usertbl where mobile1 is null);