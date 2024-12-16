package com.classIT.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classIT.domain.AnswerVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AnswerServiceTest {

	@Autowired
	private AnswerService service; 
	
	@Test
	public void getOneTest() {
		Long answer_no = 32L;
		
		AnswerVO test = service.getOne(answer_no);
		
		log.info(test);
	}
	
	@Test
	public void getListTest() {
		Long question_no = 32L;
		
		List<AnswerVO> test = service.getList(question_no);
		
		test.forEach(answer -> log.info(answer));
	}
	
	
	@Test
	public void getregister() {
		AnswerVO aVo = new AnswerVO();
		aVo.setAnswer_text("테스트중입니다.");
		aVo.setQuestion_no(34L);
		aVo.setUser_id("user1");
		
		
		int test = service.register(aVo);
		
		log.info("서비스영역 성공여부 : " + test);

	}
	
	@Test
	public void testRemove() {
		AnswerVO aVo = new AnswerVO();
		aVo.setQuestion_no(45L);
		aVo.setUser_id("user17");
		
		
		int test = service.register(aVo);
		
		log.info("서비스영역 성공여부 : " + test);

	}
	
}
