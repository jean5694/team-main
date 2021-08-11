package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.MessageVO;

public interface MessageMapper {
	
    public int mesinsert(MessageVO vo);
    
    public int getTotalListSend(MessageVO vo);
    public int getTotalListReceive(MessageVO vo);
    
    public List<MessageVO> getListSend(@Param("vo") MessageVO vo, @Param("page") Integer page);
    public List<MessageVO> getListReceive(@Param("vo") MessageVO vo, @Param("page") Integer page);
    
	public void mesdelete(MessageVO vo);
	public List<MessageVO> getSearchMessageList(String receivesearchValue);

	
	

}