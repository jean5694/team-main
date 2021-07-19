package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Test2MapperTests {

	private Test2Mapper mapper;
	
	@Autowired
	public void setMapper(Test2Mapper mapper) {
		this.mapper = mapper;
	}
	
	@Test
	public void test() {
		assertNotNull(mapper);
	}
	
	@Test
	public void test1() {
//		assertEquals(1, mapper.sql1("aa"));
		mapper.sql1("aa");
	}
	
	@Test
	public void test2() {
		assertEquals(1, mapper.sql2("a"));
		assertEquals(2, mapper.sql2("b"));
		
	}
	
	@Test
	public void test3() {
		mapper.sql3("a");
	}
	
	@Test
	public void test4() {
		mapper.sql4("c");
	}
	
	@Test
	public void test5() {
		mapper.sql5("c");
	}
	
	@Test
	public void test6() {
		
		List<String> list = new ArrayList<>();
		list.add("java");
		list.add("user00");
		list.add("user01");
		
		mapper.sql6(list);
	}

	@Test
	public void test7() {
		
		List<String> list = new ArrayList<>();
		list.add("java");
		list.add("user00");
		list.add("user01");
		
		mapper.sql7(list);
	}
}












