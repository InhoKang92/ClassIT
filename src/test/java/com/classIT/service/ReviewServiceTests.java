package com.classIT.service;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classIT.domain.Criteria;
import com.classIT.domain.ReviewPageDTO;
import com.classIT.domain.ReviewVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewServiceTests {

	@Autowired
	private ReviewService service;	
	
	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testGetList() {		
		List<ReviewVO> list = service.getList(1L); 
		
		list.forEach(review -> log.info(review));
	}
	
	
	@Test
	public void testGetPagingList() {		
		List<ReviewVO> list = service.getPagingList(1L,new Criteria());
		
		list.forEach(review -> log.info(review));
	}
	
	
	
}
