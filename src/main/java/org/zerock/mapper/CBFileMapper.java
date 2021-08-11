package org.zerock.mapper;

import org.zerock.domain.CBFileVO;
import org.zerock.domain.UserVO;

public interface CBFileMapper {

	
	public int cbfinsert(CBFileVO vo);
	
	
	public int cbfdeleteBybno(Long bno);
	
	//public int cbfremoveByUserid(UserVO vo);
	
	
	
}