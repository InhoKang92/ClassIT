package com.classIT.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.classIT.domain.AnswerVO;
import com.classIT.mapper.AnswerMapper;
import com.classIT.mapper.QuestionMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AnswerServiceImpl implements AnswerService {
	
	private AnswerMapper mapper;
	private QuestionMapper questionMapper;
	
	@Override
	public AnswerVO getOne(Long answer_no) {
		log.info("[Answer] getOne......" + answer_no);
		return mapper.getOne(answer_no);
	}

	@Override
	public List<AnswerVO> getList(Long question_no) {
		log.info("[Answer] getList......" + question_no);
		return mapper.getList(question_no);
	}
	
	@Transactional	// 데이터 일관성	예외상황 발생시 전체 롤백
	@Override
	public int register(AnswerVO aVo) {
		log.info("[Answer] register......" + aVo);

		String owner_id = questionMapper.getOwnerId(aVo.getQuestion_no());
		String user_id = aVo.getUser_id();
		
		if(owner_id.equals(user_id)) {
			questionMapper.updateAnswerStatus(aVo.getQuestion_no(), 1);
		}
		
		questionMapper.updateAnswerCnt(aVo.getQuestion_no(), 1);

		return mapper.insert(aVo);
	}

	@Override
	public int modify(AnswerVO aVo) {
		log.info("[Answer] modify......" + aVo);
		return mapper.update(aVo);
	}
	
	@Transactional
	@Override
	public int remove(Long answer_no, String user_id,Long question_no) {
		log.info("[Answer] remove......" + answer_no + "," + user_id);
		questionMapper.updateAnswerCnt(question_no, -1);
		return mapper.delete(answer_no, user_id);
	}
	
	@Transactional
	@Override
	public int removeOwner(Long answer_no, String user_id,Long question_no) {
		log.info("[Answer] removeOwner......" + answer_no + "," + user_id + "," +question_no);
		questionMapper.updateAnswerCnt(question_no, -1);
		
		if(mapper.getCount(question_no, user_id) == 1) {
			log.info("getCount >>> 1");
			questionMapper.updateAnswerStatus(question_no,0);
		}else if(mapper.getCount(question_no, user_id) > 1) {
			questionMapper.updateAnswerStatus(question_no,1);
			log.info("getCount >>> 2");
		}
		
		return mapper.delete(answer_no, user_id);
	}

	@Override
	public String getOwnerId(Long product_no) {
		log.info("[Answer] getOwnerId......" + product_no);
		return mapper.getOwnerId(product_no);
	}


}
