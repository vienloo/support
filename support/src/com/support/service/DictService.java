package com.support.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.support.dao.DictDao;
import com.support.model.Dict;
import com.support.utils.PageValue;



@Service
public class DictService {

	
	@Resource
	DictDao dao;
	
	public int getAllRecords_dictType(String keywords) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		return (int)dao.getAllRecords_dictType(map);
	}

	public List<Map<String, Object>> getAll_dictType(String keywords, PageValue page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		map.put("startNumber",page.getStartNumber());
		map.put("rows", page.getRows());
		return dao.getAll_dictType(map);
	}

	@Transactional
	public Map<String, Object> addDictType(Dict dict) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.addDictType(dict);
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
	public Map<String, Object> updateDictType(Dict dict) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.updateDictType(dict);
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
	public Map<String, Object> removeDictType(Dict dict) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.removeDictType(dict);
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

	public int getAllRecords_dictItem(String keywords) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		return (int)dao.getAllRecords_dictItem(map);
	}

	public List<Map<String, Object>> getAll_dictItem(String keywords, PageValue page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		map.put("startNumber",page.getStartNumber());
		map.put("rows", page.getRows());
		return dao.getAll_dictItem(map);
	}

	@Transactional
	public Map<String, Object> addDictItem(Dict dict) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.addDictItem(dict);
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
	public Map<String, Object> updateDictItem(Dict dict) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.updateDictItem(dict);
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
	public Map<String, Object> removeDictItem(Dict dict) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int count = dao.removeDictItem(dict);
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
