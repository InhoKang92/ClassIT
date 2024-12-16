package com.classIT.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.ScheduleVO;

public interface ScheduleService {

	public ScheduleVO getOne(@Param("product_no") Long product_no, @Param("schedule") String schedule);
	public void register(ScheduleVO schedule);
	public List<ScheduleVO> getList(Long product_no);
	public boolean remove(Long product_no);
	
}
