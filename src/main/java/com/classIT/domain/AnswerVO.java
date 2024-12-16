package com.classIT.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerVO {
	   private Long answer_no;
	   private Long question_no;
	   private String answer_text;
	   private String user_id;
	   private Date answer_date;
	   
	   private String user_role;
	   
}
