package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.Notice_fileVO;


public interface Notice_fileMapper {
	
	public int insert(Notice_fileVO nfvo);
	
	public List<String> getByNno(int nno);
	
	public int deleteByNno(int nno);
}