package com.classIT.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionVO {
	private Long question_no;
	private Long product_no;
	private String question_title;
	private String question_text;
	private Date question_date;
	private String user_id;
	private int answercnt;
	private int answer_status;
	
	
	
    
}
