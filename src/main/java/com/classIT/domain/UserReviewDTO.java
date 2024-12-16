package com.classIT.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserReviewDTO {
    private ReviewVO review;
    private ReserveVO reserve;
    private ScheduleVO schedule;
    private ProductVO product;
}
