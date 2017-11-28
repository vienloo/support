package com.support.utils;

import java.io.Serializable;
import java.util.List;


public class PageValue implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 和jqGrid组件相关的参数属性
	private List dataList = null;
	private int rows = 10; // 每页条数
	private int page = 1; // 第几页
	private int total; // 总页数
	private int records; // 总条数
	private int startNumber; // 查询开始点 limit startNumber，rows

	/**
	 * 无参构造器
	 *
	 */
	public PageValue() {
		this.page = 1;
		this.rows = 10;
		this.startNumber = (this.page - 1) * this.rows;
	}

	/**
	 * 有参构造器 根据当前显示页与每页显示记录数设置查询信息初始对象
	 *
	 * @param page
	 *            当前显示页号
	 * @param rows
	 *            当前页显示记录条数
	 */
	public PageValue(int page, int rows) {
		this.page = (page <= 0) ? 1 : page;
		this.rows = (rows <= 0) ? 10 : rows;
		this.startNumber = (this.page - 1) * this.rows;
	}

	public int getStartNumber() {
		return startNumber;
	}

	public void setStartNumber(int startNumber) {
		this.startNumber = startNumber;
	}

	public List getDataList() {
		return dataList;
	}

	public void setDataList(List dataList) {
		this.dataList = dataList;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
		this.startNumber = (this.page - 1) * this.rows;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		this.startNumber = (this.page - 1) * this.rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRecords() {
		return records;
	}

	public void setRecords(int records) {
		this.records = records;
		// 在设置总页数的时候计算出对应的总页数，在下面的三目运算中加法拥有更高的优先级，所以最后可以不加括号。
		int total = records % rows == 0 ? records / rows : records / rows + 1;
		this.setTotal(total);
	}
}
