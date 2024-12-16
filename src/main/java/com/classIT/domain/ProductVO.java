package com.classIT.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProductVO {

	private Long product_no;
	private String product_title;
	private String owner_id;
	private String class_category;
	private String main_img;
	private String class_detail_1;
	private String class_detail_2;
	private String class_detail_3;
	private String class_detail_4;
	private String class_detail_5;
	private Long price_per_person;
	private Long max_capacity;
	private String location;
	private String location_code;
	private List<ScheduleVO> scheduleList;
	
}
