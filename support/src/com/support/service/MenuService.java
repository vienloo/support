package com.support.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.support.dao.MenuDao;
import com.support.model.Menu;
import com.support.utils.PageValue;



@Service
public class MenuService {

	@Resource
	MenuDao dao;
	
	
	public List<Menu> queryTopMenuList() {
		return dao.queryTopMenuList();
	}
	
	public List<Map<String,Object>> queryMenuList(Integer id) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("id",id);
		return dao.queryMenuList(map);
	}

	public int getAllMenuRecords(String keywords) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		return (int)dao.getAllMenuRecords(map);
	}
	
	public List<Map<String, Object>> getAllMenu(String keywords, PageValue page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		map.put("startNumber",page.getStartNumber());
		map.put("rows", page.getRows());
		return dao.getAllMenu(map);
	}

	public List<Map<String, Object>> selectAllMulu() {
		return dao.selectAllMulu();
	}

	@Transactional
	public Map<String, Object> addMenu(Menu menu) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.addMenu(menu);
			if(count>0){
				map.put("code",0);
				map.put("msg", "操作成功");
			}else{
				map.put("code",1);
				map.put("msg", "操作失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("code",1);
			map.put("msg", "操作异常");
			throw new RuntimeException(e);
		}
		return map;
	}

	@Transactional
	public Map<String, Object> updateMenu(Menu menu) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.updateMenu(menu);
			if(count>0){
				map.put("code",0);
				map.put("msg", "操作成功");
			}else{
				map.put("code",1);
				map.put("msg", "操作失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("code",1);
			map.put("msg", "操作异常");
			throw new RuntimeException(e);
		}
		return map;
	}

	@Transactional
	public Map<String, Object> removeMenu(Menu menu) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.removeMenu(menu);
			if(count>0){
				map.put("code",0);
				map.put("msg", "操作成功");
			}else{
				map.put("code",1);
				map.put("msg", "操作失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("code",1);
			map.put("msg", "操作异常");
			throw new RuntimeException(e);
		}
		return map;
	}

}
