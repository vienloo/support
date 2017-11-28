package com.support.common;

import java.util.List;
import java.util.Map;


public interface CommonDao {

	List<Map<String, Object>> getArea(Common common);

	List<Map<String, Object>> getCompany(Common common);

	List<Map<String, Object>> getDept(Common common);

	List<Map<String, Object>> getRole(Common common);

	List<Map<String, Object>> getProv();

	List<Map<String, Object>> getCity(Common common);

	List<Map<String, Object>> getCity1(Common common);
	
	List<Map<String, Object>> getDictType(Common common);

	List<Map<String, Object>> getDict(Common common);

}
