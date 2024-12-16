package com.classIT.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.Criteria;
import com.classIT.domain.QuestionVO;
import com.classIT.domain.UserQnaDTO;

public interface QuestionMapper {

	
	public QuestionVO getOne(Long question_no);
	public List<QuestionVO> getList(Long product_no);
	public List<UserQnaDTO> getListForUser(String user_id);
	public List<UserQnaDTO> getListForOwner(String user_id);
	public List<UserQnaDTO> getListForOwnerNon(String user_id);
	
	public int insert(QuestionVO rVo);
	public int update(QuestionVO rVo);
	public int delete(@Param("question_no") Long question_no, @Param("user_id") String user_id);
	
	
	// 페이징 정보를 기반으로 게시물 목록을 가져오기
	public List<QuestionVO> getListWithPaging(@Param("product_no") Long product_no, @Param("cri") Criteria cri);
	
	// Product_no별 review데이터 갯수
	public int getCountByProductNo(Long product_no);
	
	// Question 번호에 해당하는 answercnt(답변수)을 업데이트
	public int updateAnswerCnt(@Param("question_no") Long question_no, @Param("amount") int amount);
	
	// 페이징 처리된 오너 question list(답변완료)
	public List<UserQnaDTO> getListForOwnerPaging(@Param("user_id") String user_id, @Param("cri") Criteria cri,@Param("status") int status);
	
	// 페이징 처리된 오너 question list(답변완료)
	public List<UserQnaDTO> getListForUserPaging(@Param("user_id") String user_id, @Param("cri") Criteria cri,@Param("status") int status);
	
	// Owner 의 question 데이터 갯수 확인(status : 답변 상태)
	public int getCountByQuestionNo(@Param("user_id") String user_id, @Param("status") int status);
	// user의 question 데이터 갯수 확인(status : 답변 상태)
	public int getCountByUserQuestionNo(@Param("user_id") String user_id, @Param("status") int status);
	
	// (status : 답변 상태)변경 
	public int updateAnswerStatus(@Param("question_no") Long question_no, @Param("status") int status);
	
	public String getOwnerId(Long question_no);
	
}
