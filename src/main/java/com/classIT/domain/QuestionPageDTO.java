package com.classIT.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class QuestionPageDTO {
	private int questionCnt;		// 클래스 별 질문갯수
	private List<QuestionVO> list;	// 클래스 별 질문 목록 저장
}
