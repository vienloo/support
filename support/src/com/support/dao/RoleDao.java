package com.support.dao;

import java.util.List;
import java.util.Map;

import com.support.model.Role;



public interface RoleDao {

	int getAllRecords(Map<String, Object> map);

	List<Map<String, Object>> getAll(Map<String, Object> map);

	int addRole(Role role);

	int updateRole(Role role);

	int removeRole(Role role);

}
