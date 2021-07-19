package org.zerock.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TxTest1MapperTests {

	@Setter(onMethod_ = @Autowired)
	private TxTest1Mapper mapper;
	
	@Test
	public void test() {
		assertNotNull(mapper);
	}
	
	@Test
	public void testInsertOk() {
		mapper.insert("abc");
	}
	
	
	@Test(expected = Exception.class)
	public void testInsertFail() {
		mapper.insert("abcdef");
	}

}










