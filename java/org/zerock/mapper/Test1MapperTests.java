package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Test1VO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Test1MapperTests {

	private Test1Mapper mapper;
	
	@Autowired
	public void setMapper(Test1Mapper mapper) {
		this.mapper = mapper;
	}
	
	@Test
	public void testMapper() {
		assertNotNull(mapper);
	}
	
	@Test
	public void testGetList() {
		List<Test1VO> list = mapper.getList();
		
		assertTrue(list.size() > 0);
	}
	
	@Test
	public void testRead() {
		Test1VO vo = mapper.read(1);
		
		assertEquals("jimin", vo.getName());
		assertEquals(22, vo.getAge());
	}
	
	@Test
	public void testUpdate() {
		Test1VO vo = new Test1VO();
		vo.setId(3);
		vo.setName("korea");
		vo.setAge(999);
		
		mapper.update(vo);
		
		Test1VO vo3 = mapper.read(3);
		
		assertEquals("korea", vo3.getName());
		assertEquals(999, vo3.getAge());
	}

	
	@Test
	public void testInsert() {

		Test1VO vo = new Test1VO();
		vo.setName("seoul");
		vo.setAge(888);
		
		int before = mapper.getList().size();
		
		mapper.insert(vo);
		
		int after = mapper.getList().size();
		
		assertEquals(before + 1, after);
	}
	
	@Test
	public void testDelete() {
		mapper.delete(2);
		
		Test1VO vo = mapper.read(2);
		
		assertNull(vo);
	}
	
	@Test
	public void testInsertSelectKey() {
		Test1VO vo = new Test1VO();
		vo.setName("jeju");
		vo.setAge(777);
		
		mapper.insertSelectKey(vo);
		
		assertNotEquals(0, vo.getId());
		
	}
}














