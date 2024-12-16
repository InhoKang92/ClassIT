package com.classIT.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.classIT.domain.ProductVO;

public interface ProductMapper {

	public ProductVO read(Long product_no);
	public ProductVO read2(String product_title);
	public List<ProductVO> getList1();
	public List<ProductVO> getList2(@Param("class_category") String class_category, @Param("keyword") String keyword);
	public List<ProductVO> getList3(String class_category);
	public List<ProductVO> getList4(String keyword);
	public void insert(ProductVO product);
	public void insertSelectKey(ProductVO product);
	public int delete(Long product_no);
	public int update(ProductVO product);
	
}
