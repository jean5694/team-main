package org.zerock.service;

import org.zerock.domain.UserVO;

public interface UserService {
	
	boolean insert(UserVO vo);
	boolean insert2(UserVO vo);
	UserVO read(String name);

}