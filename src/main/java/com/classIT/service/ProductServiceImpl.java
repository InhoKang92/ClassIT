package com.classIT.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.classIT.domain.ProductVO;
import com.classIT.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;

	@Override
	public ProductVO get(Long product_no) {
		 log.info("get....." + product_no);
	     return mapper.read(product_no);
	}
	
	@Override
	public ProductVO get2(String product_title) {
		 log.info("get....." + product_title);
	     return mapper.read2(product_title);
	}
	
	@Override
	public List<ProductVO> getList1() {
		log.info("getList.....");
		return mapper.getList1();
	}
	
	@Override
	public List<ProductVO> getList2(@Param("class_category") String class_category, @Param("keyword") String keyword) {
		log.info("getList.....");
		return mapper.getList2(class_category, keyword);
	}
	
	@Override
	public List<ProductVO> getList3(String class_category) {
		log.info("getList.....");
		return mapper.getList3(class_category);
	}
	
	@Override
	public List<ProductVO> getList4(String keyword) {
		log.info("getList.....");
		return mapper.getList4(keyword);
	}
	
	@Override
	public void register(ProductVO product) {
		log.info("register....." + product);
		mapper.insertSelectKey(product);
	}

	@Override
	public boolean remove(Long product_no) {
		log.info("remove...." + product_no);
	     return mapper.delete(product_no)==1;
	}

	@Override
	public boolean modify(ProductVO product) {
		 log.info("modify.... " + product);
	     return mapper.update(product)==1;
	}
	
}
