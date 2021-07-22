package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.AuthVO;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;

	@Override
	public boolean insert(UserVO vo) {
		// 보드 타입으로도 할 수 있음
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
	
	@Override
	public boolean insert2(UserVO vo) {
		// 보드 타입으로도 할 수 있음
		// 패스워드 암호화
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.insert(vo);

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

}