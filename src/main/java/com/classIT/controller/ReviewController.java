package com.classIT.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.classIT.domain.Criteria;
import com.classIT.domain.ReviewPageDTO;
import com.classIT.domain.ReviewVO;
import com.classIT.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RestController
@RequestMapping("/api/review")
@AllArgsConstructor
@NoArgsConstructor
@Log4j
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	// 파일이 저장될 위치 (수정필요)
	private String uploadFolder = "C:\\\\git\\\\project\\\\ClassIT_won1\\\\src\\\\main\\\\webapp\\\\resources\\\\uploadIMG\\review";
	
	
	//클래스 별 리뷰 리스트(페이징)									// 출력 JSON
	@GetMapping(value = "/getPagingList/{product_no}/{pageNum}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReviewPageDTO> getList(@PathVariable("product_no") Long product_no, @PathVariable("pageNum") int pageNum) {
		
		log.info("////////////////////////////////getPagingList : " + product_no);
		Criteria cri = new Criteria(pageNum,5); // 1페이지당 5개씩 출력
	    
		return new ResponseEntity<ReviewPageDTO>(service.getListPage(product_no,cri), HttpStatus.OK);	// 댓글갯수, 댓글목록 같이 반환
		
	}
	
	
	// 작성자 별 리뷰 리스트
	@GetMapping(value = "/getListForUser/{user_id}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ReviewVO>> getListForUser(@PathVariable("user_id") String user_id) {

		log.info("////////////////////////////////getListForUser : " + user_id);
		return new ResponseEntity<List<ReviewVO>>(service.getListForUser(user_id), HttpStatus.OK);
		
	}
	
	// 리뷰 1개 반환
	@GetMapping(value = "/getOne/{review_no}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReviewVO> getOne(@PathVariable("review_no") Long review_no) {

		log.info("////////////////////////////////getOne : " + review_no);
		
		return new ResponseEntity<>(service.getOne(review_no), HttpStatus.OK);
	}
	
	// 리뷰 등록
	@PostMapping(value="/register1", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody ReviewVO rVo){

		log.info("////////////////////////////////register : " + rVo);
		return service.register(rVo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	// 리뷰 업데이트
	@PutMapping("/modify")
	public ResponseEntity<String> modify(@ModelAttribute ReviewVO rVo) throws IllegalStateException, IOException {
		
		MultipartFile uploadFile = rVo.getUploadFile();
		log.info("uploadFile : " +uploadFile.isEmpty());
		
			if(!uploadFile.isEmpty()) {
				

				log.info("uploadFolder : " +uploadFolder);
		
				// 업로드 폴더 생성
				File uploadPath = new File(uploadFolder);
				log.info("uploadPath : " +uploadPath);
		
				// 경로가 존재하지 않으면 디렉토리 생성
		        if (!uploadPath.exists()) {
		            uploadPath.mkdirs();
		        }
		        
		
		    	// 원본 파일명
		    	String originalFilename = uploadFile.getOriginalFilename();
		    	log.info("originalFilename : " +originalFilename);
		
		    	// 저장경로
		    	File saveFile = new File(uploadPath,originalFilename);
		    	log.info("saveFile : " +saveFile);
		
		    	// 파일 저장(transferTo)
		    	uploadFile.transferTo(saveFile);
		
		    	// 파일 이름만 DB저장
		    	rVo.setReview_img(originalFilename);
			}
		
		
		log.info("////////////////////////////////modify : " + rVo);
		return service.modify(rVo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 리뷰 삭제
	@DeleteMapping("/remove/{review_no}/{user_id}")
	public ResponseEntity<String> remove(@PathVariable Long review_no,@PathVariable String user_id){
		log.info("////////////////////////////////remove : " + review_no + ", " + user_id);
		return service.remove(review_no, user_id) == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
	// 업로드된 파일을 처리하는 POST 요청을 처리하는 핸들러	// MultipartFile은 json으로 처리 불가 @RequestBody 사용 안됨
	@PostMapping("/register")
	public ResponseEntity<String> uploadFile(@ModelAttribute ReviewVO rVo) throws IllegalStateException, IOException {
        								
		
		MultipartFile uploadFile = rVo.getUploadFile();
		
		if(uploadFile != null) {
			
			// 업로드 폴더 경로(프로젝트 내부에 저장하려고 정적 주소 사용)//////////////////////////////////////////  프로젝트 실행전 변경 필요
			
			log.info("uploadFolder : " +uploadFolder);
	
			// 업로드 폴더 생성
			File uploadPath = new File(uploadFolder);
			log.info("uploadPath : " +uploadPath);

	
			// 경로가 존재하지 않으면 디렉토리 생성
	        if (!uploadPath.exists()) {
	            uploadPath.mkdirs();
	        }

	        
	
	    	// 원본 파일명
	    	String originalFilename = uploadFile.getOriginalFilename();
	    	log.info("originalFilename : " +originalFilename);
	
	    	// 저장경로
	    	File saveFile = new File(uploadPath,originalFilename);
	    	log.info("saveFile : " +saveFile);
	
	    	// 파일 저장(transferTo)
	    	uploadFile.transferTo(saveFile);
	
	    	// 파일 이름만 DB저장
	    	rVo.setReview_img(originalFilename);
		}
		log.info("////////////////////////////////register : "+rVo );
		return service.register(rVo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	


}
