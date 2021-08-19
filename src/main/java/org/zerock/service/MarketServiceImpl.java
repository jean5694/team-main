package org.zerock.service;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.Criteria;
import org.zerock.domain.MarketVO;
import org.zerock.domain.Market_fileVO;
import org.zerock.mapper.MarketMapper;
import org.zerock.mapper.Market_fileMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.profiles.ProfileFile;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;


@Service
@Log4j
public class MarketServiceImpl implements MarketService {
	   private String bucketName;
	   private String profileName;
	   private S3Client s3;

	   @Setter (onMethod_ = @Autowired)
	   private MarketMapper mapper;

	   @Setter (onMethod_ = @Autowired)
	   private Market_fileMapper fileMapper;

	   // 댓글 추가 필요함	   
	   
	   public MarketServiceImpl() {
		   this.bucketName = "choongang-gohome01";
		   this.profileName = "gohome1";

		   Path contentLocation = new File(System.getProperty("user.home") + "/.aws/credentials").toPath();
		      ProfileFile pf = ProfileFile.builder()
		            .content(contentLocation)
		            .type(ProfileFile.Type.CREDENTIALS)
		            .build();
		      ProfileCredentialsProvider pcp = ProfileCredentialsProvider.builder()
		            .profileFile(pf)
		            .profileName(profileName)
		            .build();

		      this.s3 = S3Client.builder()
		            .credentialsProvider(pcp)
		            .build();
	   }

	   @Override
		public void write(MarketVO mvo) {
			mapper.insertSelectKey(mvo);
		}
	   
	   
	   @Override  
	   @Transactional // 트랜잭션 작동 여부 확인
	   public void write(MarketVO mvo, MultipartFile[] mfile) {
	      write(mvo);
	      
	      for (MultipartFile market_file : mfile) { 

	         if (market_file != null && market_file.getSize() > 0) {
	            Market_fileVO mfvo = new Market_fileVO();
	            mfvo.setMno(mvo.getMno());
	            mfvo.setFileName(market_file.getOriginalFilename());

	            fileMapper.insert(mfvo);
				upload(mvo, market_file);
	         }
	      }
	     }

	   // s3에 파일 업로드 
	   private void upload(MarketVO mvo, MultipartFile mfile) {
		   log.info("####################################3");
		   log.info(mvo.getMno() + "/" + mfile.getOriginalFilename());
		   log.info("####################################3");

		      try (InputStream is = mfile.getInputStream()) {
			       PutObjectRequest objectRequest = PutObjectRequest.builder()
			        	   .bucket(bucketName)
			               .key("market/" +mvo.getMno() + "/" + mfile.getOriginalFilename())
			               .contentType(mfile.getContentType())
			               .acl(ObjectCannedACL.PUBLIC_READ)
			               .build();		   
			         
			       s3.putObject(objectRequest,
			    		   RequestBody.fromInputStream(is, mfile.getSize()));
			         
		      } catch (Exception e) {
			      throw new RuntimeException(e);
			  }

	   	}
		
	  
	   
			         
	   // 은비 읽어오기 수정함
	   //mno값으로 받아온 파일명을 list에 넣어서 불러옴
	    @Override
	    public MarketVO read(int mno) {
	    	
	 	   MarketVO mvo = mapper.read(mno);
	 	   
	 	   List<String> market_file = fileMapper.getByMno(mno);
	 	      mvo.setFileName(market_file);
	 	      return mvo;
	    }

		@Override
		public boolean modify(MarketVO mvo) {
			return mapper.update(mvo) == 1;
		}	    
	    
		
		
		@Override
		@Transactional
		public boolean modify(MarketVO mvo, MultipartFile[] market_file) {
			// 은비 s3 삭제
			MarketVO oldimage = mapper.read(mvo.getMno());
			removeFile(oldimage);
			// 은비 db delete
			fileMapper.deleteByMno(mvo.getMno());

			for (MultipartFile file : market_file) {
				log.info("테스트:" + file.toString());

				if (file != null & file.getSize() > 0) {

					Market_fileVO mfvo = new Market_fileVO();
					mfvo.setMno(mvo.getMno());
					mfvo.setFileName(file.getOriginalFilename());
					fileMapper.insert(mfvo);
					upload(mvo, file);
				}
			}
			return modify(mvo);
		}
	    

		
		
		
		@Override
		@Transactional
		public boolean remove(int mno) {
			// 댓글 삭제
			// replyMapper.deleteByBno(bno);
			
			// 파일 삭제 (s3)
			MarketVO vo = mapper.read(mno);
			removeFile(vo);
			
			// 파일 삭제 (db)
			fileMapper.deleteByMno(mno);
			
			
			// 게시물 삭제
			int cnt = mapper.delete(mno);
			
			return cnt == 1;
		}
 
		
		private void removeFile(MarketVO mvo) {
			for (String fileName : mvo.getFileName()) {
				String key = "market/" + mvo.getMno() + "/" + fileName;
			
			DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
					.bucket(bucketName)
					.key(key)
					.build();
			
			s3.deleteObject(deleteObjectRequest);
		}
		}
		
		
		
	    

	 // 수정해야함
	    @Override
	    public List<MarketVO> getList(Criteria cri) {
	       return mapper.getListWithPaging(cri);
	    }

	   @Override
	   public int getTotal(Criteria cri) {
	      return mapper.getTotalCount(cri); 
	   }
	   
	   @Override
		public List<MarketVO> getmkList(String writer) {
			return mapper.getmkList(writer);

		}

	//메인중고마켓 게시글조회
	@Override
	public List<MarketVO> getMarketMainList() {
		
		return mapper.getMarketMainList();
	}

	}