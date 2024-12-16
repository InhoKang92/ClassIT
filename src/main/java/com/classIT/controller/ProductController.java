package com.classIT.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classIT.domain.MemberVO;
import com.classIT.domain.ProductVO;
import com.classIT.domain.ScheduleVO;
import com.classIT.service.ProductService;
import com.classIT.service.ScheduleService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@RequiredArgsConstructor
public class ProductController {

	private final ProductService productservice;
	private final ScheduleService scheduleservice;
	
	@GetMapping("/get")
	public void testget(@RequestParam("product_no") Long product_no, Model model) {
		ProductVO vo = productservice.get(product_no);
		model.addAttribute("product", vo);
	}
	    

	@GetMapping("/list")
    public void list(Model model) {
    	List<ProductVO> list = productservice.getList1();
    	model.addAttribute("list2", list);
    }
	
    @PostMapping("/product/list")
    public String list(@RequestParam("class_category") String class_category, @RequestParam("keyword") String keyword, Model model) {
    	log.info(class_category);
    	log.info(keyword);
    	
    	if(class_category!="" && keyword!="") {
    		List<ProductVO> list = productservice.getList2(class_category, keyword);
    		if(list.size()==0) {
    			model.addAttribute("msg", "검색된 클래스가 없습니다.");
    			model.addAttribute("table_display", "none");
    			model.addAttribute("result_display", "style='display: none;'");
    		}else {
    			model.addAttribute("table_display", "table");
    		}
        	model.addAttribute("list", list);
        	model.addAttribute("search_result", list.size() + "개의 클래스가 검색되었습니다.");
        	model.addAttribute("selected_Category", class_category);
        	model.addAttribute("searched_keyword", keyword);
    	}else if(class_category!="" && keyword=="") {
    		List<ProductVO> list = productservice.getList3(class_category);
    		if(list.size()==0) {
    			model.addAttribute("msg", "검색된 클래스가 없습니다.");
    			model.addAttribute("table_display", "none");
    			model.addAttribute("result_display", "style='display: none;'");
    		}else {
    			model.addAttribute("table_display", "table");
    		}
        	model.addAttribute("list", list);
        	model.addAttribute("search_result", list.size() + "개의 클래스가 검색되었습니다.");
        	model.addAttribute("selected_Category", class_category);
    	}else if(class_category=="" && keyword!="") {
    		List<ProductVO> list = productservice.getList4(keyword);
    		if(list.size()==0) {
    			model.addAttribute("msg", "검색된 클래스가 없습니다.");
    			model.addAttribute("table_display", "none");
    			model.addAttribute("result_display", "style='display: none;'");
    		}else {
    			model.addAttribute("table_display", "table");
    		}
        	model.addAttribute("list", list);
        	model.addAttribute("search_result", list.size() + "개의 클래스가 검색되었습니다.");
        	model.addAttribute("searched_keyword", keyword);
    	}
   
    	return "product/list";
    }
    
    @GetMapping("/sub")
    public void get(@RequestParam("product_no") Long product_no, Model model) {
    	ProductVO vo = productservice.get(product_no);
    	List<ScheduleVO> list = vo.getScheduleList();
    	model.addAttribute("product", vo);
    	model.addAttribute("scheduleList", list);
    }
    
    @GetMapping("/confirm")
    public String confirm(Long product_no, String selected_schedule, Long reserve_number, String reserve_amount, Model model, HttpSession session) {
    	MemberVO member = (MemberVO) session.getAttribute("loginUser");
    	
    	
    		ProductVO vo = productservice.get(product_no);
        	model.addAttribute("selected_schedule", selected_schedule);
        	model.addAttribute("reserve_number", reserve_number);
        	model.addAttribute("reserve_amount", reserve_amount);
        	model.addAttribute("product", vo);
        	return "product/confirm";
    	
    	
    }
    
    @GetMapping("/register1")
    public void register() {
  		
    }
    
    @GetMapping("/register2")
    public void register2() {
  		
    }
    
    @PostMapping("/register2")
		public String register(@ModelAttribute ProductVO product, RedirectAttributes rttr, Model model) {
   	
    	log.info("register......." + product);
		productservice.register(product);
		Long product_no = product.getProduct_no();
		log.info(product_no);
		rttr.addFlashAttribute("result", product.getProduct_no());
		model.addAttribute("product_no", product_no);
		return "product/register2";
		
	}
    
    @PostMapping("/register3")
		public String register2(@ModelAttribute ScheduleVO schedule, RedirectAttributes rttr) {
    	log.info("register......." + schedule);
    	
    	String scheduleStr = schedule.getSchedule();
    	
    	String[] scheduleArr = scheduleStr.split(",");
    	log.info(Arrays.toString(scheduleArr));
    	
    	List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
    	
    	for(var i=0; i<scheduleArr.length; i++) {
    		ScheduleVO newSchedule = new ScheduleVO();
    		newSchedule.setProduct_no(schedule.getProduct_no());
    		newSchedule.setSchedule(scheduleArr[i]);
    		scheduleList.add(newSchedule);
    	}
    	for(var i=0; i<scheduleList.size(); i++) {
    		scheduleservice.register(scheduleList.get(i));
        	rttr.addFlashAttribute("result", schedule.getSchedule_no());
    	}
    	
    	return "redirect:/product/list";
    }
    
    @GetMapping("/modify")
    public void modify(@RequestParam("product_no") Long product_no, Model model) {
    	log.info(productservice.get(product_no));
    	model.addAttribute("product", productservice.get(product_no));
    }
   
    @PostMapping("/modify")
    public String modify(@ModelAttribute ProductVO product, RedirectAttributes rttr) {
    	log.info("modify......." + product);
    	Long pno = product.getProduct_no();
    	if(productservice.modify(product)) {
    		rttr.addFlashAttribute("result", "success");
    	}
    	return "redirect:/product/sub?product_no=" + pno;
   }
	
    @PostMapping("/remove")
  	public String remove(@RequestParam("product_no") Long product_no, RedirectAttributes rttr ) {
		log.info("remove...." +product_no);
		scheduleservice.remove(product_no);
		if(productservice.remove(product_no)) {
			rttr.addFlashAttribute("result", "success");
		}
 		return "redirect:/product/list";
    }
    
}
