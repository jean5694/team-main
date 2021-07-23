package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

import lombok.Setter;

@Service
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
	
	
}