package com.support.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.support.dao.RoleDao;
import com.support.model.Role;
import com.support.utils.PageValue;


@Service
public class RoleService {

	@Resource
	RoleDao dao;
	
	public int getAllRecords(String keywords) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		return (int)dao.getAllRecords(map);
	}

	public List<Map<String, Object>> getAll(String keywords, PageValue page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		map.put("startNumber",page.getStartNumber());
		map.put("rows", page.getRows());
		return dao.getAll(map);
	}

	@Transactional
	public Map<String, Object> addRole(Role role) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.addRole(role);
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
	public Map<String, Object> updateRole(Role role) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.updateRole(role);
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
	public Map<String, Object> removeRole(Role role) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.removeRole(role);
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
