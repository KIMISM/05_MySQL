-- usertbl과 buytbl을 바탕으로 다음 결과가 나오는 뷰를 정의
--  create view : view 생성
--   concat(문자열1,문자열2) : 문자열 두개 합치기
-- view는 테이블에서 필요한 내용만 뽑아낸 작은 가상의 테이블이다 
 create view v_userbuytbl
 as
 select U.userid, U.name, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
 from usertbl U inner join buytbl B
 on U.userid = B.userid;
 
 -- 정의한 뷰에서 userid가 김범수 인 데이터만 출력 
 select * from v_userbuytbl where name='김범수';