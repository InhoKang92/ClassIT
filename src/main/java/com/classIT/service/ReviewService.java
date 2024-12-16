package com.classIT.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.Criteria;
import com.classIT.domain.ReviewPageDTO;
import com.classIT.domain.ReviewVO;


public interface ReviewService {
	public ReviewVO getOne(Long review_no);
	public List<ReviewVO> getList(Long product_no);
	public List<ReviewVO> getListForUser(String user_id);
	
	public int register(ReviewVO rVo);
	public int modify(ReviewVO rVo);
	public int remove(@Param("review_no") Long review_no, @Param("user_id") String user_id);

	public List<ReviewVO> getPagingList(@Param("product_no") Long product_no, @Param("cri") Criteria cri);
	
	// 게시물을 페이지별로 나누어 반환
	public ReviewPageDTO getListPage(Long product_no,Criteria cri);
	
}
