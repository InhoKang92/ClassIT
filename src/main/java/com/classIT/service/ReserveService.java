package com.classIT.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.ReserveDTO;
import com.classIT.domain.ReserveVO;

public interface ReserveService {
	public ReserveVO get(Long reserve_no);
	public List<ReserveVO> getList(String user_id);
	public int reserveClass(ReserveVO reserve);
	
	
	public List<ReserveVO> getOwnerList(String user_id);
	public List<ReserveDTO> getOwnerListState(String user_id, String reserve_approval);
	public int updateApproval(ReserveVO rVo);
	public int delete(@Param("reserve_no") Long reserve_no, @Param("user_id") String user_id);
	
}
