package com.classIT.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
	Long review_no;
	Long reserve_no;
	String review_title;
	String review_text;
	Date review_date;
	int review_rate;
	String review_img;
	String user_id;
	
	MultipartFile uploadFile;	// form에서 VO객체로 데이터를 받아오기 위해 추가함(실제 사용x)
}
