package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.NoticeVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.OtoAnswerVO;
import org.zerock.domain.OtoVO;

public interface CsService {
	public List<OtoVO> getotolist(Criteria cri);
	public List<NoticeVO> getNoticeList(Criteria cri);
	// 총 페이지
	public int getTotalO(Criteria cri);
	public int getTotalN(Criteria cri);
	
	
	public void otowriting(OtoVO ovo);
	public void otowriting(OtoVO ovo, MultipartFile[] oto_file);
	public OtoVO otoreading(int qono);
	public boolean otodelete(int qono);
	public OtoAnswerVO otoanswer(OtoAnswerVO vo);
	
	// 은비 8-16 수정
	public void noticeWriting(NoticeVO nvo);
	public void noticeWriting(NoticeVO nvo, MultipartFile[] notice_file);
	public NoticeVO noticeReading(int nno);
	public boolean noticeModify(NoticeVO nvo);
    public boolean noticeModify(NoticeVO nvo, MultipartFile[] notice_file);
	public boolean noticeDelete(int nno);
	
	//메인공지사항 글조회
	public List<NoticeVO> getNoticeMainList();

}