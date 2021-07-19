package org.zerock.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        {"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
            "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class UserTests {


    @Setter(onMethod_ = @Autowired)
    private UserMapper mapper;

    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder encoder;

    @Test
    public void test() {
        assertNotNull(mapper);

        assertNotNull(encoder);
    }


    //데이터 추가 
    // expected = Exception.class ?????
    //실패해도 초록불? 
    //@Test(expected = Exception.class)
    @Test
    public void testInsert2() {
        UserVO vo1 = new UserVO();
        vo1.setUserid("admin33");
        vo1.setUserpw(encoder.encode("admin")); // encode
        vo1.setUserName("어드민33");
//        vo1.setUserphone("01022223333");
//        vo1.setUserem("so12@abc.com");

        mapper.insert(vo1);
    }

    //데이터조회  된건가요~?ㅎㅎ네 감사합니다 합너확인해볼꼐
    @Test
    public void testread() {
        UserVO vo = mapper.read("admin");
        assertEquals("어드민", vo.getUserName());
    }

}