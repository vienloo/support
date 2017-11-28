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
import com.support.model.Menu;
import com.support.service.MenuService;
import com.support.utils.PageValue;


@Controller
@RequestMapping("/system")
public class MenuController {
	private static Logger log = Logger.getLogger(MenuController.class);  
	
	@Resource
	private MenuService menuService;
	
	@RequestMapping("/menu")
	public ModelAndView view_menu(){
		return new ModelAndView("menu");
	}
	
	@RequestMapping("/getMenu")
	@ResponseBody
	public JSON getMenu(String keywords,PageValue page){
		log.info("访问getMenu接口");
		//String keywords = request.getParameter("keywords");
		System.out.println("keywords="+keywords);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		int records = menuService.getAllMenuRecords(keywords);
		System.out.println("records="+records);
		list = menuService.getAllMenu(keywords,page);
		page.setDataList(list);
		page.setRecords(records);
		return (JSON) JSON.toJSON(page);
	}
	
	@RequestMapping("/selectAllMulu")
	@ResponseBody
	public JSON selectAllMulu(){
		log.info("访问selectAllMulu接口");
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = menuService.selectAllMulu();
		log.info((JSON) JSON.toJSON(list));
		return (JSON) JSON.toJSON(list);
	}
	
	@RequestMapping("/addMenu")
	@ResponseBody
	public JSON addMenu(Menu menu){
		log.info("访问addMenu接口");
		Map<String,Object> map = menuService.addMenu(menu);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/updateMenu")
	@ResponseBody
	public JSON updateMenu(Menu menu){
		log.info("访问updateMenu接口");
		Map<String,Object> map = menuService.updateMenu(menu);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/removeMenu")
	@ResponseBody
	public JSON removeMenu(Menu menu){
		log.info("访问removeMenu接口");
		log.info(menu.getIds());
		Map<String,Object> map = menuService.removeMenu(menu);
		return (JSON) JSON.toJSON(map);
	}
}
