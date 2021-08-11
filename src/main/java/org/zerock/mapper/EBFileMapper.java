package org.zerock.mapper;

import org.zerock.domain.EBFileVO;

public interface EBFileMapper {

	
	public int ebfinsert(EBFileVO vo);
	public int ebfdeleteBybno(Long eno);
}