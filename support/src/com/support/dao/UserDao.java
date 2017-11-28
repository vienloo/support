package com.support.dao;

import java.util.List;
import java.util.Map;

import com.support.model.User;



public interface UserDao {

	User getUserByLoginId(User user);

	int getAllRecords(Map<String, Object> map);

	List<Map<String, Object>> getAll(Map<String, Object> map);

	int addUser(User user);

	int updateUser(User user);

	int removeUser(User user);

	int initPassWord(User user);

	int setPassword(User user);

	

	int getUserCount();

	int getSeq_user();
	
	int register(User user);

}
