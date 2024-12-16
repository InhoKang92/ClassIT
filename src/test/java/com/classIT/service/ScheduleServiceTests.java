package com.classIT.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classIT.domain.ProductVO;
import com.classIT.domain.ScheduleVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ScheduleServiceTests {

	@Autowired
    private ScheduleService service;
	
	@Test
	public void testRegister() {
		ScheduleVO schedule = new ScheduleVO();
		schedule.setProduct_no(1L);
		schedule.setSchedule("1111");
		
		service.register(schedule);		
		log.info("생성된 스케줄의 번호: " +  schedule.getSchedule_no());
	}
	
	@Test
	public void testGetList() {
	   service.getList(1L).forEach(schedule ->log.info(schedule));
	}

}
