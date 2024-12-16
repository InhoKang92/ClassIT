package com.classIT.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classIT.domain.ReserveDTO;
import com.classIT.domain.ReserveVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReserveMapperTests {

	@Autowired
	private ReserveMapper reserveMapper;
	
	@Test
	public void getTest() {
		Long reserve_no = 1L;
		ReserveVO test = reserveMapper.get(reserve_no);
	}
	
	@Test
	public void getListTest() {
		String user_id = "user20";
		List<ReserveVO> test = reserveMapper.getList(user_id);
		test.forEach(reserve -> log.info(reserve));
	}
	
	@Test
	public void testinsert() {	    
		ReserveVO reserve = new ReserveVO();
		reserve.setOwner_id("user1");
		reserve.setUser_id("user20");
		reserve.setProduct_no(1L);
		reserve.setSchedule_no(1L);
		reserve.setReserve_number(2);
		reserve.setReserve_amount(50000L);
		reserve.setReserve_approval(1);
		
		int test = reserveMapper.insert(reserve);
		log.info("[insert test] °á°ú : " + test);
	}
	
	
	@Test
	public void getOwnerListState() {
		String user_id = "user1";
		String reserve_approval = "0";
		List<ReserveDTO> test = reserveMapper.getOwnerListState(user_id,reserve_approval);
		test.forEach(reserve -> log.info(reserve));
	}
	

}
