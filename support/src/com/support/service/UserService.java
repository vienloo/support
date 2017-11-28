package com.support.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.support.dao.UserDao;
import com.support.model.User;
import com.support.utils.PageValue;
import com.support.utils.Utils;

@Service
public class UserService {

	@Resource
	UserDao dao;

	public User getUserByLoginId(User user) {
		return dao.getUserByLoginId(user);
	}

	public int getAllRecords(String keywords) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		return (int) dao.getAllRecords(map);
	}

	public List<Map<String, Object>> getAll(String keywords, PageValue page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keywords", keywords);
		map.put("startNumber", page.getStartNumber());
		map.put("rows", page.getRows());
		return dao.getAll(map);
	}

	@Transactional
	public Map<String, Object> addUser(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int count = dao.addUser(user);
			if (count > 0) {
				map.put("code", 0);
				map.put("msg", "操作成功");
			} else {
				map.put("code", 1);
				map.put("msg", "操作失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 1);
			map.put("msg", "操作异常");
			throw new RuntimeException(e);
		}
		return map;
	}

	@Transactional
	public Map<String, Object> updateUser(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int count = dao.updateUser(user);
			if (count > 0) {
				map.put("code", 0);
				map.put("msg", "操作成功");
			} else {
				map.put("code", 1);
				map.put("msg", "操作失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 1);
			map.put("msg", "操作异常");
			throw new RuntimeException(e);
		}
		return map;
	}

	@Transactional
	public Map<String, Object> removeUser(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int count = dao.removeUser(user);
			if (count > 0) {
				map.put("code", 0);
				map.put("msg", "操作成功");
			} else {
				map.put("code", 1);
				map.put("msg", "操作失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 1);
			map.put("msg", "操作异常");
			throw new RuntimeException(e);
		}
		return map;
	}

	@Transactional
	public String initPassWord(User user) {
		String msg = null;
		try {
			dao.initPassWord(user);
			msg = "1";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "2";
			throw new RuntimeException(e);
		}
		return msg;
	}

	@Transactional
	public Map<String, Object> setPassword(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int count = dao.setPassword(user);
			if (count > 0) {
				map.put("code", 0);
				map.put("msg", "操作成功");
			} else {
				map.put("code", 1);
				map.put("msg", "操作失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 1);
			map.put("msg", "操作异常");
			throw new RuntimeException(e);
		}
		return map;
	}

	public Map<String, Object> register(User user) {
		try {
			// 密码明文加密
			String password = user.getPassword_1();
			user.setPassword(Utils.string2MD5(password));
			// 统计用户数是否等于1，等于1说明此用户为第一个用户，自动升级成超级管理员
			int count = dao.getUserCount();
			if (count<2) {
				user.setRole(1);
			} else {
				user.setRole(0);
			}
			// 生成流水式序列号
			int maxnum = dao.getSeq_user();
			String p_code = String.format("%010d", maxnum);
			user.setP_code(p_code);
			int result = dao.register(user);
			return Utils.result(0, "操作成功", result);
		} catch (Exception e) {
			e.printStackTrace();
			return Utils.result(1, "程序异常,请联系技术中心支持", null);
		}
	}
}
