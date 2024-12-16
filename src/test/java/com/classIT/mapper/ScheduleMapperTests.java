package com.classIT.mapper;

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
public class ScheduleMapperTests {

	@Autowired
    private ScheduleMapper mapper;
	
	@Test
	public void testInsertSelectKey() {
		ScheduleVO schedule = new ScheduleVO();
		schedule.setProduct_no(1L);
		schedule.setSchedule("");
		

	    mapper.insertSelectKey(schedule);
	    log.info(schedule);

	    log.info("생성된 스케줄 ID(Schedule_no): " + schedule.getSchedule_no());
	  
	}
	
	@Test
	public void testGetList() {
        mapper.getList(1L).forEach(schedule->log.info(schedule));
	}

}
