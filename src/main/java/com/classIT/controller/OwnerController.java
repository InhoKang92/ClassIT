package com.classIT.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/owner")
public class OwnerController {
	
	@GetMapping("/index")
	public void getindex() {
	
	}
	
	@GetMapping("/qna")
	public void getqna() {
	
	}

	@GetMapping("/reserve")
	public void getreserve() {
	
	}
	
}
