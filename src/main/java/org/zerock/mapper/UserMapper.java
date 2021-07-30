package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MessageVO;
import org.zerock.domain.UserVO;

public interface UserMapper {

	//데이터추가하기 
	public int insert(UserVO vo);
	public int insertAuth(AuthVO vo);
	
	//기업
	public int insertB(UserVO vo);
	
	//데이터조회하기 
	public UserVO read(String userid);
	
	//데이터 수정하기 
	public int update(UserVO vo);
	//비밀번호 수정 
	public int modifyPassword(UserVO vo);
	
	
	//테이터 삭제
	public int remove(UserVO vo);
	public int removeAuth(UserVO vo);
	
	
	// 재경 아이디 찾기
	public UserVO findId(UserVO vo);


	// 재경 비밀번호 찾기
	public UserVO findPw (UserVO vo);
	
	// 재경 비밀번호 변경
	public int updatePw(UserVO vo);
	
	public int msgsend(MessageVO vo);
}
