package org.zerock.mapper;

import org.zerock.domain.UserVO;

public interface UserMapper {

	//데이터추가하기 
	public int insert(UserVO vo);
	
	
	//데이터조회하기 
	public UserVO read(String userid);
	
}