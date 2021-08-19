package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.OtoAnswerVO;
import org.zerock.domain.OtoVO;
import org.zerock.domain.SProductVO;
import org.zerock.domain.UserVO;

public interface AdminMapper {
	
	// 일반회원 관련
	public List<UserVO> getUserlist();	
	public int getUserinsert(UserVO user);
	public int getUserinsertAuth(AuthVO userauth);
	public void Userupdate(UserVO vo);
	public void Userdelete(UserVO vo);
	
	// 업체회원 관련
	public List<UserVO> getComplist();
	public int getCompinsert(UserVO comp);
	public int getCompinsertAuth(AuthVO compauth);
	public void Compupdate(UserVO vo);
	public void Compdelete(UserVO vo);
	
	// 상품목록 관련 
	public List<SProductVO> getProductlist();
	public int getProductinsert(SProductVO vo);
	public void Productupdate(SProductVO vo);
	public void Productdelete(SProductVO vo);

	// 문의내역 관련
	public List<OtoVO> getOtolist();
	public void Otoanswer(OtoAnswerVO vo);
		
	// 관리자 관련
	public List<UserVO> getAdminlist();
	public int getAdmininsert(UserVO admin);
	public int getAdmininsertAuth(AuthVO adminauth);
	public void Adminupdate(UserVO vo);
	public void Admindelete(UserVO vo);
	
	
}