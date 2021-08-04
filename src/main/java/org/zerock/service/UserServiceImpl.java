package org.zerock.service;


import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MessageVO;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	//UserMapper타입으로 만들어진 객체를 mapper주입 !
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Override
	@Transactional
	public boolean insert(UserVO vo) {
		
		// 패스워드 암호화
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.insert(vo);

		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setUserid(vo.getUserid());
		avo.setAuth("ROLE_USER");
		mapper.insertAuth(avo);

		return cnt == 1;
	}
	
	
	//기업정보 추가 
	@Override
	public boolean insertB(UserVO vo) {
		
		
		// 패스워드 암호화
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.insertB(vo);

		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setUserid(vo.getUserid());
		avo.setAuth("ROLE_BUSINESS");
		mapper.insertAuth(avo);

		return cnt == 1;
	}
	


	@Override
	public UserVO read(String name) {
		
		return mapper.read(name);
	}
	
	
	
	
	
	@Override
	public boolean modify(UserVO vo) {
		
		int cnt = mapper.update(vo);
		return cnt == 1;
		
	}


	@Override
	public boolean modifyPassword(UserVO vo, String oldPassword) {
		
		UserVO userinfo = mapper.read(vo.getUserid());
		
		if (encoder.matches(oldPassword, userinfo.getUserpw())) {
			
			return modifyPassword(vo);
		}
		
		
		return false;
	}
	
	
	@Override
	public boolean modifyPassword(UserVO vo) {
		
		
		vo.setUserpw(encoder.encode(vo.getUserpw()));

		int cnt = mapper.modifyPassword(vo);

		return cnt == 1;
	}
	
	
	
	
	@Override
	public boolean remove(UserVO vo, String inputPassword) {
		
		UserVO userinfo = mapper.read(vo.getUserid());
		
		log.info(inputPassword);
		log.info(vo);
		if (encoder.matches(inputPassword, userinfo.getUserpw())) {
			return remove(vo);
		}

		return false;
	}

	
	//나중에 추가해야될내용 -> 게시글 삭제,댓글삭제 
	@Override
	public boolean remove(UserVO vo) {
		
		
		//권한 삭제 
		mapper.removeAuth(vo);
		//회원 삭제 
		int cnt = mapper.remove(vo);
		return cnt ==1;
	}



	

	//아이디 찾기
	@Override
	public UserVO findId(UserVO vo) {
		return mapper.findId(vo);
		}


	//비밀번호 찾기
	@Override
	public UserVO findPw(UserVO vo) {	
		return mapper.findPw(vo);
	}


	//비밀번호 변경
	@Override
	public boolean updatePw(UserVO vo) {
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.updatePw(vo);
		return cnt == 1;
	}

	//임시 비밀번호 메일 발송
	@Override
	public void sendEmail(UserVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "wwwcozytest1@gmail.com"; //서버 이메일 주소(보내는 사람 이메일 주소)
		String hostSMTPpwd = "WWWtest12!!"; //서버 이메일 비번(보내는 사람 이메일 비번)

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "GoHome@official.com"; //보내는 사람 이메일주소(받는 사람 이메일에 표시됨)
		String fromName = "Gohome"; //프로젝트이름 또는 보내는 사람 이름
		String subject = "";
		String msg = "";

		if(div.equals("findpassword")) {
			subject = "고집 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUserid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getUserpw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getUserEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}


	
	

}
