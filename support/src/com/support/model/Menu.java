package com.support.model;

import java.util.List;
import java.util.Map;


public class Menu {

	private Integer id;
	private Integer[] ids;
	private String name;
	private Integer parentId;
	private String url;
	private String icon;
	private Integer orderBy;
	private Integer isHeader;
	private Integer type;
	private List<Map<String,Object>> childMenus;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer[] getIds() {
		return ids;
	}
	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public Integer getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(Integer orderBy) {
		this.orderBy = orderBy;
	}
	public Integer getIsHeader() {
		return isHeader;
	}
	public void setIsHeader(Integer isHeader) {
		this.isHeader = isHeader;
	}
	public List<Map<String, Object>> getChildMenus() {
		return childMenus;
	}
	public void setChildMenus(List<Map<String, Object>> childMenus) {
		this.childMenus = childMenus;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
}
