package com.classIT.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private Long reserve_no;
	private String owner_id;
	private String user_id;
	private Long product_no;
	private Long schedule_no;
	private int reserve_number;
	private Long reserve_amount;
	private int reserve_approval;
	private Date reserve_date;
}
