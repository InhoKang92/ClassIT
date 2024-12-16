package com.classIT.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.ProductVO;

public interface ProductService {
	
   public ProductVO get(Long product_no);
   public ProductVO get2(String product_title);
   public List<ProductVO> getList1();
   public List<ProductVO> getList2(@Param("class_category") String class_category, @Param("keyword") String keyword);
   public List<ProductVO> getList3(String class_category);
   public List<ProductVO> getList4(String keyword);
   public void register(ProductVO product);
   public boolean remove(Long product_no);
   public boolean modify(ProductVO product);
   
}
