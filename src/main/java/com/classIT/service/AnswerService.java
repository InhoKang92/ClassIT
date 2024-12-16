package com.classIT.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.AnswerVO;

public interface AnswerService {
	public AnswerVO getOne(Long answer_no);
	public List<AnswerVO> getList(Long question_no);
	
	public int register(AnswerVO aVo);
	public int modify(AnswerVO aVo);
	public int remove(@Param("answer_no") Long answer_no, @Param("user_id") String user_id,@Param("question_no") Long question_no);
	public int removeOwner(@Param("answer_no") Long answer_no, @Param("user_id") String user_id,@Param("question_no") Long question_no);
	public String getOwnerId(Long product_no);
}