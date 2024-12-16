package com.classIT.mapper;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classIT.domain.Criteria;
import com.classIT.domain.ReviewVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewTests {
	@Autowired
	private ReviewMapper reviewMapper;
	
    @Test
    public void testGetOne() {		   
    	Long review_no = 3L;
    	
    	log.info(reviewMapper.getOne(review_no));
    }
	
    @Test
    public void testGetList() {		   
    	Long product_no = 1L;
    	
    	reviewMapper.getList(product_no).forEach(review->log.info(review));
    }
    
    @Test
    public void testGetListForUser() {		   
    	String user_id = "user17";
    	
    	log.info(reviewMapper.getListForUser(user_id));
    }
    
    @Test
    public void testinsert() {		   
    	String user_id = "user50";
    	
    	ReviewVO rVo = new ReviewVO();
    	rVo.setReserve_no(1L);
    	rVo.setUser_id(user_id);
    	rVo.setReview_title("테스트 리뷰 제목");
    	rVo.setReview_text("테스트 리뷰 내용");
    	rVo.setReview_rate(4);
    	reviewMapper.insert(rVo);
    	
    	log.info(reviewMapper.getOne(rVo.getReview_no()));
    }
    
    @Test
    public void testUpdate() {		   
    	Long review_no = 14L;
    	String user_id = "user50";
    	
    	ReviewVO rVo = new ReviewVO();
    	rVo.setReview_no(review_no);
    	rVo.setReview_title("테스트 리뷰 제목(수정)");
    	rVo.setReview_text("테스트 리뷰 내용(수정)");
    	rVo.setReview_rate(5);
    	rVo.setUser_id(user_id);
    	reviewMapper.update(rVo);
    	
    	log.info(reviewMapper.getOne(rVo.getReview_no()));
    }
    
    @Test
    public void testDelete() {		   
    	Long review_no = 15L;
    	String user_id = "user50";

    	log.info("testDelete 실행 결과 : " + reviewMapper.delete(review_no,user_id));
    }
    
    @Test
    public void testPageing() {		   
    	Long product_no = 1L;
    	Criteria cri = new Criteria(3,5);
    	
    	List<ReviewVO> a = reviewMapper.getListWithPaging(product_no,cri);
    	log.error(a);
    	
//    	reviewMapper.getListWithPaging(product_no,cri).forEach(review->log.info(review));
    }
    
    @Test
    public void testCount() {
    	Long product_no = 1L;
    	
    	int count =reviewMapper.getCountByProductNo(product_no);
    	log.info(product_no+"번 클래스의 리뷰 갯수 : " + count);
    	
    }
    
    
    
    
    
}
