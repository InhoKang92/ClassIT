package com.classIT.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.MemberVO;

public interface MemberMapper {
    int userCheck(Map<String, String> params);
    MemberVO getMember(String user_id);
    int confirmID(String user_id);
    int insertMember(MemberVO mVo);
    int updateMember(MemberVO mVo);
    MemberVO searchMemberId(@Param("user_name") String userName, 
            @Param("user_birth") String userBirth, 
            @Param("user_number") String userNumber);
    int resetPw(MemberVO member);
}
