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

import com.classIT.domain.AnswerVO;
import com.classIT.service.AnswerService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/api/answer")
@AllArgsConstructor
@NoArgsConstructor
@Log4j
public class AnswerController {
	
	@Autowired
	private AnswerService service;
	
	//¹®ÀÇ»çÇ×º°  ´ñ±Û ¸®½ºÆ®									// Ãâ·Â JSON
	@GetMapping(value = "/getList/{question_no}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<AnswerVO>> getList(@PathVariable("question_no") Long question_no) {
	    
		log.info("////////////////////////////////getList : " + question_no);
		return new ResponseEntity<List<AnswerVO>>(service.getList(question_no), HttpStatus.OK);
	}
	
	// ´ñ±Û »ý¼º
	@PostMapping(value="/register", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody AnswerVO aVo){
		
		log.info("////////////////////////////////register : " + aVo);
		return service.register(aVo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
	// ´ñ±Û ¾÷µ¥ÀÌÆ®
	@PutMapping(value="/modify", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody AnswerVO aVo){
		
		log.info("////////////////////////////////modify : " + aVo);
		return service.modify(aVo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// ´ñ±Û »èÁ¦
	@DeleteMapping(value="/remove/{answer_no}/{user_id}/{question_no}",  produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable Long answer_no,@PathVariable String user_id,@PathVariable Long question_no){
		log.info("////////////////////////////////remove : " + answer_no + ", " + user_id + ", " +question_no);
		return service.remove(answer_no, user_id,question_no) == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// ownerÀÇ ´ñ±Û »èÁ¦
	@DeleteMapping(value="/removeOwner/{answer_no}/{user_id}/{question_no}",  produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> removeOwner(@PathVariable Long answer_no,@PathVariable String user_id, @PathVariable Long question_no){
		log.info("////////////////////////////////removeOwner : " + answer_no + ", " + user_id + ", " +question_no);
		

		return service.removeOwner(answer_no, user_id,question_no) == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	
	
	//owner id								// Ãâ·Â JSON
	@GetMapping(value = "/getOwnerId/{product_no}" ,  produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> getOwnerId(@PathVariable("product_no") Long product_no) {
	    
		log.info("////////////////////////////////getOwnerId : " + product_no);
		return new ResponseEntity<String>(service.getOwnerId(product_no), HttpStatus.OK);
	}
	
	
	
	
}
