package com.classIT.mapper;



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
public class QuestionMapperTests {
	
	@Autowired
	private QuestionMapper questionMapper;
	
	@Test
	public void getTest() {
		Long question_no = 3L;
		
		QuestionVO test = questionMapper.getOne(question_no);
		
		log.info(test);
	}
	
	@Test
	public void getListTest() {
		Long product_no = 1L;
		
		List<QuestionVO> test = questionMapper.getList(product_no);
		
		test.forEach(question -> log.info(question));
	}
//	
	@Test
	public void getListForUser() {
		String user_id = "user17";
		
		List<UserQnaDTO> test = questionMapper.getListForUser(user_id);
		
		test.forEach(question -> log.info(question));
	}
	
	@Test
	public void getListForOwner() {
		String user_id = "user1";
		
		List<UserQnaDTO> test = questionMapper.getListForOwner(user_id);
		
		test.forEach(question -> log.info(question));
	}

	@Test
	public void testinsert() {
		Long product_no = 16L;
		String user_id ="user50";
	    String question_title = "[테스트] api mapper 테스트 타이틀";
	    String question_text = "[테스트] api mapper 테스트 텍스트";
	    
		QuestionVO qVo = new QuestionVO();
		qVo.setProduct_no(product_no);
		qVo.setUser_id(user_id);
		qVo.setQuestion_title(question_title);
		qVo.setQuestion_text(question_text);
		
		
		int test = questionMapper.insert(qVo);
		log.info("[insert test] 결과 : " + test);
	}
	
	@Test
	public void testUpdate() {
		Long question_no = 50L;
		String user_id ="user50";
	    String question_title = "[테스트] api mapper 테스트 타이틀 update";
	    String question_text = "[테스트] api mapper 테스트 텍스트 update";
	    
		QuestionVO qVo = new QuestionVO();
		qVo.setQuestion_no(question_no);
		qVo.setUser_id(user_id);
		qVo.setQuestion_title(question_title);
		qVo.setQuestion_text(question_text);
		
		
		int test = questionMapper.update(qVo);
		log.info("[update test] 결과 : " + test);
	}
	
	@Test
	public void testDelete() {
		Long question_no = 50L;
		String user_id ="user50";

		int test = questionMapper.delete(question_no,user_id);
		log.info("[delete test] 결과 : " + test);
	}
	
    @Test
    public void testPageing() {		   
    	Long product_no = 1L;
    	Criteria cri = new Criteria(1,5);
    	
    	List<QuestionVO> a = questionMapper.getListWithPaging(product_no,cri);
    	log.error(a);
    	
    	a.forEach(question->log.info(question));
    }
	
    @Test
    public void testCount() {
    	Long product_no = 1L;
    	
    	int count = questionMapper.getCountByProductNo(product_no);
    	log.info(product_no+"번 클래스의 문의 갯수 : " + count);
    	
    }
    
    @Test
    public void testgetOwnerId() {
    	Long question_no = 34L;
    	
    	String owner_id = questionMapper.getOwnerId(question_no);
    	log.info("owner_id : " + owner_id);
    	
    }
    
    @Test
    public void updateAnswerStatus() {
    	Long question_no = 61L;
    	
    	int test =questionMapper.updateAnswerStatus(question_no, 1);
    	
    	log.info("test 성공여부 확인 : " + test);
    	
    }
    
    @Test
    public void updateAnswerCnt() {
    	Long question_no = 61L;
    	
    	int test = questionMapper.updateAnswerCnt(question_no, 1);
    	
    	log.info("test 성공여부 확인 : " + test);
    	
    }
    
//	@Test
//	public void getListForOwnerPaging() {
//		String user_id = "user1";
//		Criteria cri = new Criteria(1,5);
//		
//		List<UserQnaDTO> test = questionMapper.getListForOwnerPaging(user_id,cri);
//		
//		test.forEach(question -> log.info(question));
//	}
//    
	
	
}
