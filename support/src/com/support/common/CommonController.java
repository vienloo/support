package com.support.common;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;


/**
 *  获取下拉框数据的通用接口
 * @author 程文龙
 *
 */
@Controller
@RequestMapping("/common")
public class CommonController {

	private static Logger log = Logger.getLogger(CommonController.class);
	
	@Resource
	CommonService service;
	
	
	/**
	 * 获取区域下拉框
	 */
	@RequestMapping("/getArea")
	@ResponseBody
	public JSON getArea(Common Common){
		log.info("访问getArea接口");
		return (JSON) JSON.toJSON(service.getArea(Common));
	}
	
	/**
	 * 获取公司下拉框
	 */
	@RequestMapping("/getCompany")
	@ResponseBody
	public JSON getCompany(Common Common){
		log.info("访问getCompany接口");
		return (JSON) JSON.toJSON(service.getCompany(Common));
	}
	
	/**
	 * 获取部门下拉框
	 */
	@RequestMapping("/getDept")
	@ResponseBody
	public JSON getDept(Common Common){
		log.info("访问getDept接口");
		return (JSON) JSON.toJSON(service.getDept(Common));
	}
	
	/**
	 * 获取角色下拉框
	 */
	@RequestMapping("/getRole")
	@ResponseBody
	public JSON getRole(Common Common){
		log.info("访问getRole接口");
		return (JSON) JSON.toJSON(service.getRole(Common));
	}
	
	/**
	 * 获取省份下拉框
	 */
	@RequestMapping("/getProv")
	@ResponseBody
	public JSON getProv(){
		log.info("访问getProv接口");
		return (JSON) JSON.toJSON(service.getProv());
	}
	
	
	/**
	 * 获取城市下拉框
	 */
	@RequestMapping("/getCity")
	@ResponseBody
	public JSON getCity(Common Common){
		log.info("访问getCity接口");
		return (JSON) JSON.toJSON(service.getCity(Common));
	}
	
	/**
	 * 获取字典类型下拉框
	 */
	@RequestMapping("/getDictType")
	@ResponseBody
	public JSON getDictType(Common Common){
		log.info("访问getDictType接口");
		return (JSON) JSON.toJSON(service.getDictType(Common));
	}
	
	/**
	 * 获取字典表数据
	 * code=？
	 */
	@RequestMapping("/getDict")
	@ResponseBody
	public JSON getDict(Common Common){
		log.info("访问getDict接口");
		return (JSON) JSON.toJSON(service.getDict(Common));
	}
}
