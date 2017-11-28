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
import com.support.model.Dict;
import com.support.service.DictService;
import com.support.utils.PageValue;


@Controller
@RequestMapping("/dict")
public class DictController {

	private static Logger log = Logger.getLogger(DictController.class);  
	
	@Resource
	private DictService dictService;
	
	
	/**************************字典列表部分*********************************************/
	@RequestMapping("/dictItem")
	public ModelAndView view_dictItem(){
		return new ModelAndView("dictItem");
	}
	
	@RequestMapping("/getDictItem")
	@ResponseBody
	public JSON getDictItem(String keywords,PageValue page){
		log.info("访问getDictItem接口");
		System.out.println("keywords="+keywords);
		
		int records = dictService.getAllRecords_dictItem(keywords);
		System.out.println("records="+records);
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = dictService.getAll_dictItem(keywords,page);
		page.setDataList(list);
		page.setRecords(records);
		return (JSON) JSON.toJSON(page);
	}
	
	@RequestMapping("/addDictItem")
	@ResponseBody
	public JSON addDictItem(Dict dict){
		log.info("访问addDictItem接口");
		Map<String,Object> map = dictService.addDictItem(dict);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/updateDictItem")
	@ResponseBody
	public JSON updateDictItem(Dict dict){
		log.info("访问updateDictItem接口");
		Map<String,Object> map = dictService.updateDictItem(dict);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/removeDictItem")
	@ResponseBody
	public JSON removeDictItem(Dict dict){
		log.info("访问removeDictItem接口");
		Map<String,Object> map = dictService.removeDictItem(dict);
		return (JSON) JSON.toJSON(map);
	}
	
	/**************************字典类型部分*********************************************/
	@RequestMapping("/dictType")
	public ModelAndView view_dictType(){
		return new ModelAndView("dictType");
	}
	
	@RequestMapping("/getDictType")
	@ResponseBody
	public JSON getDictType(String keywords,PageValue page){
		log.info("访问getDictType接口");
		System.out.println("keywords="+keywords);
		
		int records = dictService.getAllRecords_dictType(keywords);
		System.out.println("records="+records);
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = dictService.getAll_dictType(keywords,page);
		page.setDataList(list);
		page.setRecords(records);
		return (JSON) JSON.toJSON(page);
	}
	
	@RequestMapping("/addDictType")
	@ResponseBody
	public JSON addDictType(Dict dict){
		log.info("访问addDictType接口");
		Map<String,Object> map = dictService.addDictType(dict);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/updateDictType")
	@ResponseBody
	public JSON updateDictType(Dict dict){
		log.info("访问updateDictType接口");
		Map<String,Object> map = dictService.updateDictType(dict);
		return (JSON) JSON.toJSON(map);
	}
	
	@RequestMapping("/removeDictType")
	@ResponseBody
	public JSON removeDictType(Dict dict){
		log.info("访问removeDictType接口");
		Map<String,Object> map = dictService.removeDictType(dict);
		return (JSON) JSON.toJSON(map);
	}
}
