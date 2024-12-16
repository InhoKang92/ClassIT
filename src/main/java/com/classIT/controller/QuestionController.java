package com.classIT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.classIT.domain.Criteria;
import com.classIT.domain.QnaPagingDTO;
import com.classIT.domain.QuestionPageDTO;
import com.classIT.domain.QuestionVO;
import com.classIT.domain.UserQnaDTO;
import com.classIT.service.QuestionService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/api/question")
@AllArgsConstructor
@NoArgsConstructor
@Log4j
public class QuestionController {
	
	@Autowired
	private QuestionService service;
	
	
//	//클래스 별 리뷰 리스트									// 출력 JSON
//	@GetMapping(value = "/getList/{product_no}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity<List<QuestionVO>> getList(@PathVariable("product_no") Long product_no) {
//		
//	    if (service == null) {
//	        log.error("ReviewService is null!");
//	    } else {
//	        log.info("ReviewService is injected");
//	    }
//	    
//		log.info("////////////////////////////////getList : " + product_no);
//		return new ResponseEntity<List<QuestionVO>>(service.getList(product_no), HttpStatus.OK);
//		
//	}
	
	//클래스 별 질문 리스트(페이징)									// 출력 JSON
	@GetMapping(value = "/getPagingList/{product_no}/{pageNum}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<QuestionPageDTO> getList(@PathVariable("product_no") Long product_no, @PathVariable("pageNum") int pageNum) {
		
		log.info("////////////////////////////////getPagingList : " + product_no);
		Criteria cri = new Criteria(pageNum,5); // 1페이지당 5개씩 출력
	    
		return new ResponseEntity<QuestionPageDTO>(service.getListPage(product_no,cri), HttpStatus.OK);	// 댓글갯수, 댓글목록 같이 반환
		
	}
	
	
	
	
	// 작성자 별 질문 리스트
	@GetMapping(value = "/getListForUser/{user_id}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<UserQnaDTO>> getListForUser(@PathVariable("user_id") String user_id) {

		log.info("////////////////////////////////getListForUser : " + user_id);
		return new ResponseEntity<List<UserQnaDTO>>(service.getListForUser(user_id), HttpStatus.OK);
		
	}
	
	// 질문 1개 반환
	@GetMapping(value = "/getOne/{question_no}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<QuestionVO> getOne(@PathVariable("question_no") Long question_no) {

		log.info("////////////////////////////////getOne : " + question_no);
		
		return new ResponseEntity<>(service.getOne(question_no), HttpStatus.OK);
	}
	
	// 질문 등록
	@PostMapping(value="/register", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody QuestionVO qVo){
		
		log.info("////////////////////////////////register : " + qVo);
		return service.register(qVo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	// 질문 업데이트
	@PutMapping(value="/modify", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody QuestionVO qVo){
		
		log.info("////////////////////////////////modify : " + qVo);
		return service.modify(qVo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 질문 삭제
	@DeleteMapping(value="/remove/{question_no}/{user_id}",  produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable Long question_no,@PathVariable String user_id){
		log.info("////////////////////////////////remove : " + question_no + ", " + user_id);
		return service.remove(question_no, user_id) == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	// 관리자 별 질문리스트(답변완료)
	@GetMapping(value = "/getListForOwner/{user_id}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<UserQnaDTO>> getListForOwner(@PathVariable("user_id") String user_id) {

		log.info("////////////////////////////////getListForOwner : " + user_id);
		return new ResponseEntity<List<UserQnaDTO>>(service.getListForOwner(user_id), HttpStatus.OK);
		
	}
	
	// 관리자 별 질문리스트(미답변)
	@GetMapping(value = "/getListForOwnerNon/{user_id}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<UserQnaDTO>> getListForOwnerNon(@PathVariable("user_id") String user_id) {
		
		log.info("////////////////////////////////getListForOwnerNon : " + user_id);
		return new ResponseEntity<List<UserQnaDTO>>(service.getListForOwnerNon(user_id), HttpStatus.OK);
		
	}
	
	// 관리자 별 질문리스트
	@GetMapping(value = "/getListForOwnerPaging/{user_id}/{status}/{page}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<QnaPagingDTO> getListForOwnerPaging(@PathVariable("user_id") String user_id,
																	@PathVariable("status") int status, @PathVariable("page") int page) {
		Criteria cri =  new Criteria(page, 5);
		
		
		log.info("////////////////////////////////getListForOwnerPaging : " + user_id + status + page );
		return new ResponseEntity<QnaPagingDTO>(service.getListForOwnerPaging(user_id, status, cri), HttpStatus.OK);
		
	}
	

	// 유저 별 질문리스트
	@GetMapping(value = "/getListForUserPaging/{user_id}/{status}/{page}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<QnaPagingDTO> getListForUserPaging(@PathVariable("user_id") String user_id,
																	@PathVariable("status") int status, @PathVariable("page") int page) {
		Criteria cri =  new Criteria(page, 5);
		
		
		log.info("////////////////////////////////getListForUserPaging : " + user_id + status + page );
		return new ResponseEntity<QnaPagingDTO>(service.getListForUserPaging(user_id, status, cri), HttpStatus.OK);
		
	}	
	
	
	
	
	
	
	
	
	
	
	
}
