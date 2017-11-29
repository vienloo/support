package com.support.common;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.support.utils.Utils;


@Service
public class CommonService {

	@Resource
	CommonDao dao;

	public Object getArea(Common common) {
		List<Map<String, Object>> list = dao.getArea(common);
		return Utils.result(0, "", list);
	}    
	

	public Object getCompany(Common common) {
		// 判断version号 1是海南版 2是公司版
		List<Map<String, Object>> list = dao.getCompany(common);
		return Utils.result(0, "", list);
	}

	public Object getDept(Common common) {
		List<Map<String, Object>> list = dao.getDept(common);
		return Utils.result(0, "", list);
	}

	public Object getRole(Common common) {
		List<Map<String, Object>> list = dao.getRole(common);
		return Utils.result(0, "", list);
	}

	public Object getProv() {
		List<Map<String, Object>> list = dao.getProv();
		return Utils.result(0, "", list);
	}

	public Object getCity(Common common) {
		List<Map<String, Object>> list = dao.getCity(common);
		return Utils.result(0, "", list);
	}

	public Object getDict(Common common) {
		List<Map<String, Object>> list = dao.getDict(common);
		return Utils.result(0, "", list);
	}
	
	public Object getDictType(Common common) {
		List<Map<String, Object>> list = dao.getDictType(common);
		return Utils.result(0, "", list);
	}

}
