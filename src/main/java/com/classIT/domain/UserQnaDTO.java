package com.classIT.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserQnaDTO {
	private QuestionVO question;
	private List<AnswerVO> answerList;
	private ProductVO product;
}
