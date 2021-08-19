package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.OtofileVO;

public interface OtofileMapper {

	public int insert(OtofileVO ofvo);
	
	public List<String> getByQono(int qono);
	
}