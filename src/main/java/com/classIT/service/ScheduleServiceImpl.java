package com.classIT.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.classIT.domain.ProductVO;
import com.classIT.domain.ScheduleVO;
import com.classIT.mapper.ProductMapper;
import com.classIT.mapper.ScheduleMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleMapper mapper;
	
	@Override
	public ScheduleVO getOne(Long product_no, String schedule) {
		return mapper.get(product_no, schedule);
	}
	
	@Override
	public void register(ScheduleVO schedule) {
		log.info("register....." + schedule);
		mapper.insertSelectKey(schedule);
	}
	
	@Override
	public List<ScheduleVO> getList(Long product_no) {
		log.info("getList.....");
		return mapper.getList(product_no);
	}
	
	@Override
	public boolean remove(Long product_no) {
		log.info("remove...." + product_no);
	     return mapper.delete(product_no)==1;
	}
	
}
