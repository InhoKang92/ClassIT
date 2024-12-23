package com.classIT.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
@WebAppConfiguration
public class ProductControllerTests {

	@Autowired
    private WebApplicationContext ctx;
    
    private MockMvc mockMvc;

    @Before
    public void setup() {  
   	 this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }
	
    @Test
    public void testList() throws Exception {
   	 log.info(mockMvc.perform(MockMvcRequestBuilders.get("/product/list")).andReturn().getModelAndView().getModelMap());
    }
    
    @Test
    public void testResister() throws Exception{
   	 String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/register").param("product_title", "")
   			  																			 .param("owner_no", "")
   			  																			 .param("class_category", "")
   			  																			 .param("class_detail", "")
   			  																			 .param("price_per_person", "")
   			  																			 .param("max_capacity", "")
   			  																			 .param("location", "")
   			  																			 .param("location_code", ""))
   			  																			 .andReturn().getModelAndView().getViewName();
   			  
   	 log.info(resultPage);
    }
    
    @Test
    public void testGet() throws Exception {
   	 log.info(mockMvc.perform(MockMvcRequestBuilders.get("/product/get")
   			 										.param("product_no", "1"))
   			 										.andReturn().getModelAndView().getModelMap());
    }
    
    @Test
    public void testModify() throws Exception {
   	 
   	 String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/modify")
   			 												   .param("product_title", "")
   			 												   .param("owner_no", "")
   			 												   .param("class_category", "")
   			 												   .param("class_detail", "")
   			 												   .param("price_per_person", "")
   			 												   .param("max_capacity", "")
   			 												   .param("location", "")
   			 												   .param("location_code", ""))
   			 												   .andReturn().getModelAndView().getViewName();
   	 log.info(resultPage);	
    }
    
    @Test
    public void testRemove() throws Exception {
    	String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/remove")
    															  .param("product_no", "1"))
                                    							  .andReturn().getModelAndView().getViewName();
          	log.info(resultPage);
    }

}
