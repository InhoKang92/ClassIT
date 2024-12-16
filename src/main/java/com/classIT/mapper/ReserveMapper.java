package com.classIT.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.ReserveDTO;
import com.classIT.domain.ReserveVO;

public interface ReserveMapper {
	public ReserveVO get(Long reserve_no);
	public List<ReserveVO> getList(String user_id);
	public int insert(ReserveVO reserve);
	public int update(ReserveVO reserve);
	public int delete(@Param("reserve_no") Long reserve_no, @Param("user_id") String user_id);
	
	
	
	
	public List<ReserveVO> getOwnerList(String user_id);
	public List<ReserveDTO> getOwnerListState(@Param("user_id") String user_id, @Param("reserve_approval") String reserve_approval);
	public int updateApproval(ReserveVO rVo);
	
	
	
}
