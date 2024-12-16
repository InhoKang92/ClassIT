package com.classIT.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.ScheduleVO;

public interface ScheduleMapper {

	public ScheduleVO get(@Param("product_no") Long product_no, @Param("schedule") String schedule);
	public void insertSelectKey(ScheduleVO schedule);
	public List<ScheduleVO> getList(Long product_no);
	public int delete(Long product_no);
	
}
