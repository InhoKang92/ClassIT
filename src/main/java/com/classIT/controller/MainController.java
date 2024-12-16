package com.classIT.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.classIT.service.ProductService;
import com.classIT.service.ScheduleService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class MainController {

	@GetMapping("/")
    public String register() {
  		return "index";
    }
	
	@GetMapping("/index")
    public void index() {
  		
    }
	
	@GetMapping("/classRecomm")
    public void select() {
  		
    }
	
}
