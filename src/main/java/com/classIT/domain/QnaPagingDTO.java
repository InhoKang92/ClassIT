package com.classIT.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class QnaPagingDTO {
	private int questionCnt;		// 페이징 전 전체 질문갯수
	private int status;				// 답변상태
	private List<UserQnaDTO> list;	// 질문 목록 저장
}
