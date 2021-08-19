package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Store_fileVO;
import org.zerock.domain.UserVO;

public interface Store_fileMapper {

	public int insert(Store_fileVO sfvo);

	public List<String> getByPno(Long pno);

	public void deleteByPno(Long pno);

	public void removeByUserid(UserVO vo);

}