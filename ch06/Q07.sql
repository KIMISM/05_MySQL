use sqldb;

-- 사용자별 구매 이력 출력 ->buytbl과 usertbl 둘다 필요
-- 모든 칼럼을 출력 ->SELECT *
-- 구매이력이 없는 정보는 출력하지 않는다 -> INNER JOIN(JOIN)은 두 테이블에 모두 정보가 존재해야 출력된다
-- JOIN 시 보통 테이블의 별칭을 정해준다
-- ON 뒤에는 어떤 컬럼을 기준으로 함쳐줄지를 적어준다  
SELECT * FROM buytbl b 
INNER JOIN usertbl u
ON b.userID = u.userID;

-- userID가 'JYP'인 데이터만 출력하세요.
-- 앞의 쿼리에서 WHERE절만 추가
-- 없던 테이블의 userID여도 동일한 결과가  출력된다
select * from buytbl b
inner join usertbl u
on b.userID = u.userID
where b.userID = 'JYP';

-- 각 사용자별로 구매 이력 출력 ->buytbl과 usertbl 둘다 필요
-- 연결 컬름은 userID -> on b.userID = u.userID
-- 결과를 userID를 기준으로 오름차순 정렬 ->order by userID
-- 구매이력이 없는 사용자도 출력 -> outer join(usertbl 기준)
-- userID, name, prodName, addr, 연락처를 출력 ->select문에 해당 컬럼 넣기
-- 연락처는 mobile1과 modile2를 합쳐서 만듦-> concat(u.mobile1, u.mobile2) as '연락처' 
select U.userID, U.name, B.prodName, U.addr, concat(U.mobile1, U.mobile2) AS '연락처'
from usertbl U left outer join buytbl B
ON U.userID = B.userID
order by U.userID; 

-- sqldb의 사용자를 모두 조회하되 전화가 없는 사람은 제외하고 출력
-- 1) 서브쿼리 생성: IS NULL을 이용하여 전화가 없는 사람을 가져오기 (성시경, 윤종신)
SELECT name FROM usertbl where mobile1 is null;
-- 2) NOT IN을 사용하여 해당 범위에 없는 데이터를 가져온다
SELECT * FROM usertbl 
WHERE name NOT IN (SELECT name FROM usertbl where mobile1 is null);

-- sqldb의 사용자를 모두 조회하되 전화가 없는 사람만 출력
-- 1) 서브쿼리 생성: IS NULL을 이용하여 전화가 없는 사람을 가져오기 (성시경, 윤종신)
SELECT name FROM usertbl where mobile1 is null;
-- 2) IN을 사용하여 해당 범위에 없는 데이터를 가져온다
select * from usertbl
WHERE name in(select name from usertbl where mobile1 is null);