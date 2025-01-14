package org.example.jdbc_ex.dao;

import org.example.jdbc_ex.common.JDBCUtil;
import org.example.jdbc_ex.domain.UserVO;
import org.junit.jupiter.api.*;

import java.sql.SQLException;
import java.util.List;
import java.util.NoSuchElementException;

import static org.junit.jupiter.api.Assertions.*;

//UserDao 구현체의 CRUD 작업을 테스트하는 클래스
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class UserDaoTest {

//    업캐스팅 -> 다른 클래스로 갈아끼우기 쉽다
    UserDao dao = new UserDaoImpl();

    @AfterAll
    static void tearDown() {
        JDBCUtil.close();
    }

    @Test
    @DisplayName("user를 등록합니다.")
    @Order(1)
    void create() throws SQLException {
//        새로운 사용자를 생성해서 데이터베이스를 등록
        UserVO user = new UserVO("ssamz3","ssamz123","쌤즈", "ADMIN");
        int count = dao.create(user);
//        삽입된 행의 수가 1인지 확인
        Assertions.assertEquals(1, count);
    }

    @Test
    @DisplayName("UserDao User 목록을 추출합니다.")
    @Order(2)
    void getList() throws SQLException {
//        모든 사용자 목록을 조회
        List<UserVO> list = dao.getList();
//        조회된 사용자 목록을 출력(향상된 for문)
        for (UserVO vo : list) {
            System.out.println(vo);
        }
    }

    @Test
    @DisplayName("특정 user 1건을 추출합니다.")
    @Order(3)
    void get() throws SQLException {
//        특정 사용자 정보 조회
//        해당 값이 없으면 nosuchElementException 예외 던지기
        UserVO user = dao.get("ssamz3").orElseThrow(NoSuchElementException::new);
//        조회된 사용자 값이 null이 아닌지 확인하는 테스트
        Assertions.assertNotNull(user);
    }

    @Test
    @DisplayName("user의 정보를 수정합니다.")
    @Order(4)
    void update() throws SQLException {
//        특정 사용자 정보를 조회하여 수정
//        :: new -> 생성자 참조
        UserVO user = dao.get("ssamz3").orElseThrow(NoSuchElementException::new);
        user.setName("쌤즈3");
        int count = dao.update(user);
        Assertions.assertEquals(1, count);
    }

    @Test
    @DisplayName("user를 삭제합니다.")
    @Order(5)
    void delete() throws SQLException {
//        특정 사용자 삭제
        int count = dao.delete("ssamz3");
        Assertions.assertEquals(1, count);
    }
}