package com.classIT.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.AnswerVO;

public interface AnswerMapper {
	public AnswerVO getOne(Long answer_no);
	public List<AnswerVO> getList(Long question_no);
	
	public int insert(AnswerVO aVo);
	public int update(AnswerVO aVo);
	public int delete(@Param("answer_no") Long answer_no, @Param("user_id") String user_id);
	
	public int getCount(@Param("question_no") Long question_no, @Param("user_id") String user_id);
	
	public String getOwnerId(Long product_no);
}
