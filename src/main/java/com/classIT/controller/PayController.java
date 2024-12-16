package com.classIT.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.classIT.domain.MemberVO;
import com.classIT.domain.ProductVO;
import com.classIT.domain.ReserveVO;
import com.classIT.domain.ScheduleVO;
import com.classIT.service.ProductService;
import com.classIT.service.ReserveService;
import com.classIT.service.ScheduleService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class PayController {
	
	private final ProductService productservice;
	private final ScheduleService scheduleservice;
	private final ReserveService reserveservice;

	@PostMapping("/paySuccess")
	public String pay(@RequestParam("product_title") String product_title, @RequestParam("selected_schedule") String selected_schedule, @RequestParam("reserve_number") int reserve_number, String msg, Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		log.info(member);
		ProductVO product = productservice.get2(product_title);
		log.info(product);
		ScheduleVO schedule = scheduleservice.getOne(product.getProduct_no(), selected_schedule);
		log.info(schedule);
		
		ReserveVO reserve =  new ReserveVO();
		reserve.setOwner_id(product.getOwner_id());
		reserve.setUser_id(member.getUserid());
		reserve.setProduct_no(product.getProduct_no());
		reserve.setSchedule_no(schedule.getSchedule_no());
		reserve.setReserve_number(reserve_number);
		reserve.setReserve_amount(product.getPrice_per_person()*reserve_number);
		reserve.setReserve_approval(0);
		log.info(reserve);
		
		reserveservice.reserveClass(reserve);
		
		model.addAttribute("product", product);
		model.addAttribute("reserve_number", reserve_number);
		model.addAttribute("selected_schedule", selected_schedule);
		
		return "/pay/paySuccess";
	}
	
}
