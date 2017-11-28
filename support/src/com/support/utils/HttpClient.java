package com.support.utils;

import java.util.Map;
import org.apache.http.client.config.CookieSpecs;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;

public class HttpClient {

	@SuppressWarnings("rawtypes")
	public static JSON doPost(String url, Map map, String cookie, String refer) throws Exception {
		System.out.println("------------请求开始。。。");
		CloseableHttpResponse response = null;
		CloseableHttpClient httpclient = null;
		String resData = null;
		try {
			RequestConfig config = RequestConfig.custom().setCookieSpec(CookieSpecs.STANDARD_STRICT).build();
			httpclient = HttpClients.custom().setDefaultRequestConfig(config).build();
			HttpPost post = new HttpPost(url);
			if (cookie != null) {
				post.setHeader("Cookie", cookie);
			}
			if (refer != null) {
				post.setHeader("Referer", refer);
			}

			// 接收参数json列表
			String jsonParam = JSON.toJSONString(map);
			System.out.println("构造参数为Map类：" + jsonParam);
			/*
			 * jsonParam.put("name",map.get(""));// 会议预约名字
			 * jsonParam.put("startTime",map.get(""));// 开始时间
			 * jsonParam.put("endTime",map.get(""));//结束时间
			 * jsonParam.put("devices",map.get(""));//设备
			 * jsonParam.put("creatorId",map.get(""));//创建人ID
			 * jsonParam.put("groupId",map.get(""));// 群ID
			 * jsonParam.put("notice",map.get(""));//内容
			 * jsonParam.put("fileUrl",map.get(""));// 采用 url,url,url 的格式进行图片的返回
			 * UrlEncodedFormEntity entity = new
			 * UrlEncodedFormEntity(values,Consts.UTF_8);
			 */
			StringEntity entity = new StringEntity(jsonParam.toString(), "utf-8");// 解决中文乱码问题
			entity.setContentEncoding("UTF-8");
			entity.setContentType("application/json");
			post.setEntity(entity);
			response = httpclient.execute(post);
			// 请求结束，返回结果
			resData = EntityUtils.toString(response.getEntity(), "UTF-8");
			System.out.println("resData=" + resData);
			return JSON.parseObject(resData);
		} catch (Exception e) {
			System.out.println("httpclient连接异常");
			throw new Exception("httpclient连接异常");
		} finally {
			// 关闭资源
			try {
				response.close();
			} catch (Exception e) {
				System.out.println("response关闭异常");
				throw new Exception("response关闭异常");
			}
			try {
				httpclient.close();
			} catch (Exception e) {
				System.out.println("httpclient关闭异常");
				throw new Exception("httpclient关闭异常");
			}

		}

	}

	public static JSON doGet(String url) throws Exception {
		System.out.println("------------请求开始。。。");
		CloseableHttpResponse response = null;
		CloseableHttpClient httpclient = null;
		try {

			RequestConfig config = RequestConfig.custom().setCookieSpec(CookieSpecs.STANDARD_STRICT).build();
			httpclient = HttpClients.custom().setDefaultRequestConfig(config).build();

			HttpGet get = new HttpGet(url);

			response = httpclient.execute(get);

			// 请求结束，返回结果
			String resData = EntityUtils.toString(response.getEntity(), "UTF-8");
			System.out.println("resData=" + resData);
			return JSON.parseObject(resData);
		} catch (Exception e) {
			System.out.println("httpclient连接异常");
			throw new Exception("httpclient连接异常");
		} finally {
			// 关闭资源
			try {
				response.close();
			} catch (Exception e) {
				System.out.println("response关闭异常");
				throw new Exception("response关闭异常");
			}
			try {
				httpclient.close();
			} catch (Exception e) {
				System.out.println("httpclient关闭异常");
				throw new Exception("httpclient关闭异常");
			}

		}

	}

}
