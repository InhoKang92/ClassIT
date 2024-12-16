package com.classIT.mapper;

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
public class AnswerMapperTest {
	@Autowired
	private AnswerMapper answerMapper;
	
	@Test
	public void getTest() {
		Long answer_no = 32L;
		
		AnswerVO test = answerMapper.getOne(answer_no);
		
		log.info(test);
	}
	
	@Test
	public void getListTest() {
		Long product_no = 1L;
		
		List<AnswerVO> test = answerMapper.getList(product_no);
		
		test.forEach(question -> log.info(question));
	}
	


	@Test
	public void testinsert() {
		Long question_no = 1L;
		String user_id ="user17";
	    String answer_text = "[테스트] api mapper 테스트 텍스트";
	    
		AnswerVO aVo = new AnswerVO();
		aVo.setQuestion_no(question_no);
		aVo.setUser_id(user_id);
		aVo.setAnswer_text(answer_text);

		
		int test = answerMapper.insert(aVo);
		log.info("[insert test] 결과 : " + test);
	}
	
	@Test
	public void testUpdate() {
		Long answer_no = 40L;
		String user_id ="user17";
	    String answer_text = "[테스트] api mapper 테스트 텍스트 update";
	    
		AnswerVO aVo = new AnswerVO();
		aVo.setAnswer_no(answer_no);
		aVo.setUser_id(user_id);
		aVo.setAnswer_text(answer_text);		
		
		int test = answerMapper.update(aVo);
		log.info("[update test] 결과 : " + test);
	}
	
	@Test
	public void testDelete() {
		Long answer_no = 40L;
		String user_id ="user17";

		int test = answerMapper.delete(answer_no,user_id);
		log.info("[delete test] 결과 : " + test);
	}

}
