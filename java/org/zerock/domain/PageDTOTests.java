package org.zerock.domain;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class PageDTOTests {

	@Test
	public void test() {
		Criteria cri = new Criteria(1, 10);
		
		PageDTO p1 = new PageDTO(cri);
		
		assertEquals(10, p1.getEndPage());
		
		assertEquals(10, new PageDTO(new Criteria(2,10)).getEndPage());
		assertEquals(10, new PageDTO(new Criteria(3,10)).getEndPage());
		assertEquals(10, new PageDTO(new Criteria(4,10)).getEndPage());
		assertEquals(10, new PageDTO(new Criteria(5,10)).getEndPage());
		assertEquals(10, new PageDTO(new Criteria(6,10)).getEndPage());
		assertEquals(10, new PageDTO(new Criteria(7,10)).getEndPage());
		assertEquals(10, new PageDTO(new Criteria(8,10)).getEndPage());
		assertEquals(10, new PageDTO(new Criteria(9,10)).getEndPage());
		assertEquals(10, new PageDTO(new Criteria(10,10)).getEndPage());
		
		assertEquals(20, new PageDTO(new Criteria(11, 10)).getEndPage());
		assertEquals(20, new PageDTO(new Criteria(12, 10)).getEndPage());
		assertEquals(20, new PageDTO(new Criteria(13, 10)).getEndPage());
		assertEquals(20, new PageDTO(new Criteria(14, 10)).getEndPage());
		assertEquals(20, new PageDTO(new Criteria(15, 10)).getEndPage());
		assertEquals(20, new PageDTO(new Criteria(16, 10)).getEndPage());
		assertEquals(20, new PageDTO(new Criteria(17, 10)).getEndPage());
		assertEquals(20, new PageDTO(new Criteria(18, 10)).getEndPage());
		assertEquals(20, new PageDTO(new Criteria(19, 10)).getEndPage());
		assertEquals(20, new PageDTO(new Criteria(20, 10)).getEndPage());
		
	}

}









