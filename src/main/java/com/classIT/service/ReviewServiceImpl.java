package com.classIT.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.classIT.domain.Criteria;
import com.classIT.domain.ReviewPageDTO;
import com.classIT.domain.ReviewVO;
import com.classIT.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	

	private ReviewMapper mapper;
	
	@Override
	public ReviewVO getOne(Long review_no) {
		log.info("[review] getOne......" + review_no);
		return mapper.getOne(review_no);
	}

	@Override
	public List<ReviewVO> getList(Long product_no) {
		log.info("[review] getList......" + product_no);
		return mapper.getList(product_no);
	}

	@Override
	public List<ReviewVO> getListForUser(String user_id) {
		log.info("[review] getListForUser......" + user_id);
		return mapper.getListForUser(user_id);
	}


	@Override
	public int register(ReviewVO rVo) {
		log.info("[review] register......" + rVo);
		return mapper.insert(rVo);
	}

	@Override
	public int modify(ReviewVO rVo) {
		log.info("[review] modify......" + rVo);
		return mapper.update(rVo);
	}

	@Override
	public int remove(Long review_no, String user_id) {
		log.info("[review] remove......" + review_no + user_id);
		return mapper.delete(review_no, user_id);
	}

	@Override
	public List<ReviewVO> getPagingList(Long product_no, Criteria cri) {
		log.info("[review] getPagingList......" + product_no + cri);
		return mapper.getListWithPaging(product_no, cri);
	}
	
	@Override
	public ReviewPageDTO getListPage(Long product_no, Criteria cri) {
		log.info("[review] getPagingList......" + product_no + cri);

		return new ReviewPageDTO(mapper.getCountByProductNo(product_no), mapper.getListWithPaging(product_no, cri));
		
	}

}
