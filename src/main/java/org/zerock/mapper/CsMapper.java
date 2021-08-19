package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.OtoAnswerVO;
import org.zerock.domain.OtoVO;
import org.zerock.domain.NoticeVO;


public interface CsMapper {
	public List<OtoVO> getotolist(OtoVO ovo);
	
	public int otowriting(OtoVO ovo);
	
	public OtoVO otoreading(int qono);
	
	public int otodelete(int qono);
	
	public OtoAnswerVO otoanswer(OtoAnswerVO vo);
	
	
	public List<NoticeVO> getNoticeList(NoticeVO nvo);
	
	public int noticeWriting(NoticeVO nvo);
	
	public NoticeVO noticeReading(int nno);
	
	public int noticeModify(NoticeVO nvo);
	
	public int noticeDelete(int nno);
	
	//메인공지사항 글조회
	public List<NoticeVO> getNoticeMainList();

}