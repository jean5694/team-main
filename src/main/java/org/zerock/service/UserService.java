package org.zerock.service;

import org.zerock.domain.UserVO;

public interface UserService {

	boolean insert(UserVO vo);
	boolean insertB(UserVO vo);
	
	

	UserVO read(String name);
	

	boolean modify(UserVO vo);
	


	
}