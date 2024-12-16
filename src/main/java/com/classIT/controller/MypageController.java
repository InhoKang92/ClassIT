package com.classIT.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {

	@GetMapping("/index")
	public void getReview() {
	
	}
	
	@GetMapping("/reserve")
	public void getReserve() {
	
	}
	
	@GetMapping("/qna")
	public void getQna() {
	
	}
	
	@GetMapping("/myinfo")
	public void getmypage() {
	
	}
	
	@GetMapping("/mymodify")
	public void getmymodify() {
	
	}
	
}
