package com.support.utils;

import java.util.UUID;

import org.springframework.stereotype.Component;

/**
 * 
 * @author chengwenlong
 *
 */
@Component("uuidUtil")
public class UUIDUtil {

	//生成UUID
	public String createUUid() {
		return UUID.randomUUID().toString().replace("-","");
	}
	//根据字符串生成已字符串开头的UUID格式   XXX-UUID
	public String createUUIDByString(String key) {
		return key.hashCode() + "-" + UUID.randomUUID().toString().replace("-","");
	}
}
