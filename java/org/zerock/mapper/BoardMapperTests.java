package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		assertNotNull(mapper);
		
		List<BoardVO> list = mapper.getList();
		
//		assertEquals(5, list.size());
		assertTrue(list.size() > 0);
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		int cnt = mapper.insert(board);
		
		assertEquals(1, cnt);
	}

	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		assertEquals(0, board.getBno());
		
		int cnt = mapper.insertSelectKey(board);
		
		assertEquals(1, cnt);
		assertNotEquals(0, board.getBno());
	}
	
	@Test
	public void testRead() {
		BoardVO vo = mapper.read(1);
		
		assertNotNull(vo);
		assertEquals(1, vo.getBno());
		
		/* insert, 자동 증가 키값 확인 */
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");

		int cnt = mapper.insertSelectKey(board);
		
		long key = board.getBno();
		
		BoardVO newBoard = mapper.read(key);
		
		assertNotNull(newBoard);
		assertEquals(key, newBoard.getBno());
	}
	
	@Test
	public void testDelete() {
		int cnt = mapper.delete(0); // bno 가 0인 레코드 삭제
		
		assertEquals(0, cnt);
		
//		cnt = mapper.delete(13);
//		assertEquals(1, cnt);
		
		BoardVO board = new BoardVO();
		board.setTitle("title");
		board.setContent("content");
		board.setWriter("writer");
		
		mapper.insertSelectKey(board);
		
		cnt = mapper.delete(board.getBno());
		assertEquals(1, cnt);
	}
	
	@Test
	public void testUpdate() {
		long bno = 1;
		
		BoardVO board = new BoardVO();
		board.setBno(bno);
		board.setTitle("new title");
		board.setContent("new content");
		board.setWriter("user00");
		
		int cnt = mapper.update(board);
		
		assertEquals(1, cnt);
		
		BoardVO board5 = mapper.read(bno);
		assertEquals(board.getTitle(), board5.getTitle());
		assertEquals(board.getContent(), board5.getContent());
		assertEquals(board.getWriter(), board5.getWriter());
	}
	
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		assertEquals(10, list.size());
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
//		cri.setType("TWC");
//		cri.setType("TC");
		cri.setType("");
		cri.setKeyword("테스트");
		
		mapper.getListWithPaging(cri);
	}
}














