package com.classIT.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classIT.domain.AnswerVO;
import com.classIT.domain.ReserveVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReserveServiceTests {

	@Autowired
	private ReserveService service; 
	
	@Test
	public void getTest() {
		Long reserve_no = 1L;
		ReserveVO test = service.get(reserve_no);
	}
	
	@Test
	public void getListTest() {
		String user_id = "user20";
		List<ReserveVO> test = service.getList(user_id);
		test.forEach(reserve -> log.info(reserve));
	}
}
