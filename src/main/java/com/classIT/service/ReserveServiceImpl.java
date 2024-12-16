package com.classIT.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.classIT.domain.ReserveDTO;
import com.classIT.domain.ReserveVO;
import com.classIT.mapper.ReserveMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class ReserveServiceImpl implements ReserveService {

	private ReserveMapper mapper;
	
	@Override
	public ReserveVO get(Long reserve_no) {
		log.info("[reserce] get......" + reserve_no);
		return mapper.get(reserve_no);
	}

	@Override
	public List<ReserveVO> getList(String user_id) {
		log.info("[reserce] getList......" + user_id);
		return mapper.getList(user_id);
	}
	
	@Override
	public int reserveClass(ReserveVO reserve) {
		log.info("[reserve] reserveClass......" + reserve);
		return mapper.insert(reserve);
	}

	
	
	
	
	
	
	@Override
	public List<ReserveVO> getOwnerList(String user_id) {
		log.info("[reserve] getOwnerList......" + user_id);
		return mapper.getOwnerList(user_id);
	}

	@Override
	public List<ReserveDTO> getOwnerListState(String user_id, String reserve_approval) {
		log.info("[reserve] getOwnerListState......" + user_id + reserve_approval);
		return mapper.getOwnerListState(user_id, reserve_approval);
	}

	@Override
	public int updateApproval(ReserveVO rVo) {
		log.info("[reserve] updateApproval......" + rVo);
		return mapper.updateApproval(rVo);
	}

	@Override
	public int delete(Long reserve_no, String user_id) {
		log.info("[reserve] delete......" + reserve_no + "¹ø " + user_id);
		return mapper.delete(reserve_no,user_id);
	}


}
