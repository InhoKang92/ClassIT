package com.classIT.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classIT.domain.Criteria;
import com.classIT.domain.QuestionVO;
import com.classIT.domain.UserQnaDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QuestionServiceTests {
	
	@Autowired
	private QuestionService service; 
	
	@Test
	public void getOneTest() {
		Long question_no = 3L;
		
		QuestionVO test = service.getOne(question_no);
		
		log.info(test);
	}
	
	@Test
	public void getListTest() {
		Long product_no = 1L;
		
		List<QuestionVO> test = service.getList(product_no);
		
		test.forEach(question -> log.info(question));
	}
//	
//	@Test
//	public void getListForUser() {
//		String user_id = "user17";
//		
//		List<QuestionVO> test = service.getListForUser(user_id);
//		
//		test.forEach(question -> log.info(question));
//	}

	
//	@Test
//	public void getListForOwnerPaging() {
//		String user_id = "user17";
//		
//		List<UserQnaDTO> test = service.getListForOwnerPaging(user_id,new Criteria(2, 10));
//		
//		test.forEach(question -> log.info(question));
//	}	
//	
	
	
	
	
	
}
