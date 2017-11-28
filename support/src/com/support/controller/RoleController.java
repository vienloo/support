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
import com.support.model.Role;
import com.support.service.RoleService;
import com.support.utils.PageValue;


@Controller
@RequestMapping("/system")
public class RoleController {

	private static Logger log = Logger.getLogger(RoleController.class);  
	
	@Resource
	private RoleService roleService;

	
	@RequestMapping("/role")
	public ModelAndView view_role(){
		return new ModelAndView("role");
	}
	
	@RequestMapping("/getRole")
	@ResponseBody
	public JSON getRole(String keywords,PageValue page){
		log.info("访问getRole接口");
		System.out.println("keywords="+keywords);
		
		int records = roleService.getAllRecords(keywords);
		System.out.println("records="+records);
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = roleService.getAll(keywords,page);
		page.setDataList(list);
		page.setRecords(records);
		return (JSON) JSON.toJSON(page);
	}
	
	@RequestMapping("/addRole")
	@ResponseBody
	public JSON addRole(Role role){
		log.info("访问addRole接口");
		Map<String,Object> map = roleService.addRole(role);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/updateRole")
	@ResponseBody
	public JSON updateRole(Role role){
		log.info("访问updateRole接口");
		Map<String,Object> map = roleService.updateRole(role);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/removeRole")
	@ResponseBody
	public JSON removeRole(Role role){
		log.info("访问removeRole接口");
		Map<String,Object> map = roleService.removeRole(role);
		return (JSON) JSON.toJSON(map);
	}
}
