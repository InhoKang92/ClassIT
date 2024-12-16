package com.classIT.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
	private int pageNum;	// 페이지 번호
	private int amount;		// 페이지당 보여줄 개수
	private static int defualtViewPage = 5;
	
	public Criteria() {
		this(1,defualtViewPage);			// 한페이지당 디폴트설정(5)페이지 만큼 보여주도록 설정
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}


}
