<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basepath = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<!-- jqGrid组件基础样式包-必要 -->
<link rel="stylesheet" href="<%=basepath%>/ui_datagrid/css/ui.jqgrid.css" />
<link rel="stylesheet" href="<%=basepath%>/ui_datagrid/css/jquery-ui.theme.min.css" />
<!-- 这个是所有jquery插件的基础，首先第一个引入 -->
<script type="text/javascript" src="<%=basepath%>/ui_datagrid/js/jquery-1.11.0.min.js"></script>
<!-- jqGrid插件包-必要 -->
<script type="text/javascript" src="<%=basepath%>/ui_datagrid/js/jquery.jqGrid.min.js"></script>
<!-- jqGrid插件包-必要 引入国际化 -->
<script type="text/javascript" src="<%=basepath%>/ui_datagrid/js/i18n/grid.locale-cn.js"></script>
<!-- 自己写的，初始化调整页面自动宽高的js -->
<script type="text/javascript" src="<%=basepath%>/ui_datagrid/public.js"></script>
<!-- layer 弹出框js引用 -->
<script type="text/javascript" src="<%=basepath%>/ui_layer/layer.js"></script>
</head>
</head>
<body style="margin: 5px 5px">
	<table id="gridTable"></table>
	<div id="gridPager"></div>
	<div id="toolbar" style="display: none;">
      <ul style="list-style: none;">      
	      <li style="padding-left: 10px;display:inline;">
          <input type="text" placeholder="请输入搜索名称关键字" id="keywords" name="keywords" style="width:200px;display:inline-block" />
          &nbsp;&nbsp;<a href="javascript:void(0)" onclick="select()" > 搜索</a>
          &nbsp;&nbsp;<a href="javascript:void(0)" onclick="clean()" > 清空</a>
          </li>
          <li style="padding-right: 10px;display:inline;float: right;">
          <input type="button" class="commonButton" value="增加" width="50px" onclick="add()"/>
          <input type="button" class="commonButton" id="clearCommonButton" value="修改" width="50px" onclick="edit()"/>
          <input type="button" class="commonButton" value="删除" width="50px" onclick="remove()"/>
          </li>
      </ul>
    </div>
</body>
<script type="text/javascript">
function clean(){
	$("#keywords").val("");
}
</script>
</html>