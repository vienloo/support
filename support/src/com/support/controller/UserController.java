package com.support.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.support.model.User;
import com.support.service.UserService;
import com.support.utils.PageValue;


@Controller
@RequestMapping("/system")
public class UserController {

	private static Logger log = Logger.getLogger(UserController.class);  
	
	@Resource
	private UserService userService;

	
	@RequestMapping("/user")
	public ModelAndView view_user(){
		return new ModelAndView("user");
	}
	
	@RequestMapping("/getUser")
	@ResponseBody
	public JSON getUser(String keywords,PageValue page){
		log.info("访问getUser接口");
		System.out.println("keywords="+keywords);
		
		int records = userService.getAllRecords(keywords);
		System.out.println("records="+records);
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = userService.getAll(keywords,page);
		page.setDataList(list);
		page.setRecords(records);
		return (JSON) JSON.toJSON(page);
	}
	
	@RequestMapping("/addUser")
	@ResponseBody
	public JSON addUser(User user){
		log.info("访问addUser接口");
		Map<String,Object> map = userService.addUser(user);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/updateUser")
	@ResponseBody
	public JSON updateUser(User user){
		log.info("访问updateUser接口");
		Map<String,Object> map = userService.updateUser(user);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/removeUser")
	@ResponseBody
	public JSON removeUser(User user){
		log.info("访问removeUser接口");
		Map<String,Object> map = userService.removeUser(user);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/initPassWord")
	@ResponseBody
	public String initPassWord(User user){
		log.info("访问initPassWord接口");
		return userService.initPassWord(user);
	}
}
