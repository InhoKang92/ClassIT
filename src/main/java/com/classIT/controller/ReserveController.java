package com.classIT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.classIT.domain.ReserveDTO;
import com.classIT.domain.ReserveVO;
import com.classIT.domain.ReviewVO;
import com.classIT.service.ReserveService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/api/reserve")
@AllArgsConstructor
@NoArgsConstructor
@Log4j
public class ReserveController {
	
	@Autowired
	private ReserveService service;

	@GetMapping(value = "/getOwnerList/{user_id}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ReserveVO>> getListForUser(@PathVariable("user_id") String user_id) {

		log.info("////////////////////////////////getListForUser : " + user_id);
		return new ResponseEntity<List<ReserveVO>>(service.getOwnerList(user_id), HttpStatus.OK);
		
	}
	
	@GetMapping(value = "/getOwnerListState/{user_id}/{approval}" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ReserveDTO>> getOwnerListState(@PathVariable("user_id") String user_id, @PathVariable("approval") String reserve_approval) {

		log.info("////////////////////////////////getOwnerListState : " + user_id +" "+ reserve_approval);
		return new ResponseEntity<List<ReserveDTO>>(service.getOwnerListState(user_id, reserve_approval), HttpStatus.OK);
		
	}
	
	@PutMapping("/updateApproval")
	public ResponseEntity<String> updateApproval(@RequestBody ReserveVO rVo){

		log.info("////////////////////////////////register : " + rVo);
		return service.updateApproval(rVo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@DeleteMapping("/remove/{reserve_no}/{user_id}")
	public ResponseEntity<String> delete(@PathVariable Long reserve_no, @PathVariable String user_id){

		log.info("////////////////////////////////register : " + reserve_no + "¹ø " + user_id);
		return service.delete(reserve_no,user_id) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}


}
