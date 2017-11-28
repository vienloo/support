package com.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	//房源信息采集
	@RequestMapping("/a/save")
	public ModelAndView showCustomer_a_save(){
		return new ModelAndView("/customer_a_save");
	} 
	//房源信息查询
	
	//业主查询
	
	//客源信息采集
	
	//客源信息查询
	
	//客户查询

}
