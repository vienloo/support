package com.support.utils;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import org.springframework.stereotype.Component;

@Component
public class Utils {

	private static Utils utils;

	@PostConstruct
	public void init() {
		utils = this;
	}

	/**
	 * 判断字符串是否为空
	 */
	public static boolean isNull(String str) {

		if (str != null) {
			if (str.trim() == null || str.trim().equals("") || str.trim() == "") {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}

	}

	/***
	 * MD5加码 生成32位md5码
	 */
	public static String string2MD5(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			/* SrvLogger.error("MD5加密发送错误：", e); */
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];
		for (int i = 0; i < charArray.length; i++)
			byteArray[i] = (byte) charArray[i];
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16)
				hexValue.append("0");
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}

	/**
	 * 返回结果
	 * 
	 * @param code
	 *            0成功 1失败
	 * @param msg
	 *            返回提示信息内容
	 * @param data
	 *            返回的数据
	 */
	public static Map<String, Object> result(int code, String msg, Object items) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("extra", null);
		data.put("items", items);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", code);
		result.put("msg", msg);
		result.put("data", data);
		// result.put("version",utils.Config.getVersion());
		return result;
	}

	/**
	 * 返回结果 带token
	 * 
	 * @param code
	 *            0成功 1失败
	 * @param msg
	 *            返回提示信息内容
	 * @param data
	 *            返回的数据
	 */
	public static Map<String, Object> result(int code, String msg, String app_token, Object items) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("extra", null);
		data.put("items", items);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", code);
		result.put("msg", msg);
		result.put("app_token", app_token);
		result.put("data", data);
		// result.put("version",utils.Config.getVersion());
		return result;
	}

	/**
	 * 返回结果 带token
	 * 
	 * @param code
	 *            0成功 1失败
	 * @param msg
	 *            返回提示信息内容
	 * @param data
	 *            返回的数据
	 */
	public static Map<String, Object> result(int code, String msg, String app_token, Object items, Object extra) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("extra", extra);
		data.put("items", items);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", code);
		result.put("msg", msg);
		result.put("app_token", app_token);
		result.put("data", data);
		// result.put("version",utils.Config.getVersion());
		return result;
	}
}
