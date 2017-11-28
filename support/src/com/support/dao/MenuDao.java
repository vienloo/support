package com.support.dao;

import java.util.List;
import java.util.Map;

import com.support.model.Menu;



public interface MenuDao {

	List<Menu> queryTopMenuList();

	List<Map<String, Object>> queryMenuList(Map<String, Integer> map);
	
	Integer getAllMenuRecords(Map<String, Object> map);

	List<Map<String, Object>> getAllMenu(Map<String, Object> map);

	List<Map<String, Object>> selectAllMulu();

	int addMenu(Menu menu);

	int updateMenu(Menu menu);

	int removeMenu(Menu menu);

}
