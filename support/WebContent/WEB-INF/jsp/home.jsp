<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>信息管理系统</title>
<link rel="stylesheet" href="<%=path %>/layui/css/layui.css">
<script src="<%=path %>/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/res/jquery-1.11.0.min.js"></script>
<style type="text/css">
.layui-tab ul.layui-tab-title li:nth-child(1) i {
    display: none;
}
</style>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header layui-bg-black"> 
			<div class="layui-logo" style="font-size: 30px;color: white;">信息管理系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul id="header1" class="layui-nav layui-layout-left" lay-filter="nav_x"></ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					<a href="javascript:;"> 
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img layui-anim-loop">admin</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="javascript:exit();">退出</a></li>
			</ul>
		</div>

		<div class="layui-side" style="background-color: #66CDAA">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul id="header2" class="layui-nav layui-nav-tree" lay-filter="nav_y" style="background-color: #66CDAA">
				</ul>
			</div>
		</div>

		<div class="layui-body">
	        <div class="layui-tab layui-tab-brief" lay-filter="tabs" lay-allowclose="true">
	          <ul class="layui-tab-title">
	            <li class="layui-this">我的桌面</li>
	          </ul>
	          <div class="layui-tab-content">
	           	<div class="layui-tab-item layui-show">
	                <img src="../res/image/timg.jpg" width="100%" height="100%">
	            </div>
	          </div>
	        </div>
    	</div>
		<div class="layui-footer layui-bg-black" align="center" style="position:fixed;">
			<!-- 底部固定区域 -->
			© DexBlue.Orange - vienloo
		</div>
	</div>
<script>
	//JavaScript代码区域
  	var menu;
  	var rootPath;
	$(function(){
		menu = ${menuList};
		rootPath = "<%=path%>";
		initMenu(menu,$("#header1"),rootPath,"init");
	});
	
	layui.use('element', function(){
		var element = layui.element;
		element.init();
		//监听导航点击
		element.on('nav(nav_x)', function(elem){
			console.log(elem); //得到当前点击的DOM对象
			var id = elem.find('a').attr('id');
			$("#header2").empty();
			for(var i=0; i<menu.length; i++){   
				var item = menu[i];
				var str = "";
				var childMenus = item.childMenus;
				if(item.id != id){
					continue;
				}else{
					for(var j=0; j<childMenus.length; j++){
						var item_j = childMenus[j];
						var str_j = "";
						str_j = "<li class='layui-nav-item'><a href='"+rootPath+item_j.url+"' target='option'><span>"+item_j.name+"</span></a></li>";
						$($("#header2")).append(str_j);
					}	
				}
			}
			element.init();
		});
	  	element.on('nav(nav_y)', function(elem){
	  		var title = elem[0].innerText;
	    	var url = elem.find('a').attr('href');
	    	var id = $('.list-iframe').length;
	    	//不重复打开tab
	    	for (var i = 0; i <id; i++) {
	    		if($('.list-iframe').eq(i).attr('src')==url){
	    			element.tabChange('tabs',i);
	    			return;
	    		}
	    	};
			//新加一个tab
	    	element.tabAdd('tabs',{
		        title: title//用于演示
		        ,content: "<iframe class='list-iframe' name='option' src='"+url+"' frameborder='0' scrolling='yes' width='100%' height='450px'></iframe>"
				,id:id+1
	    	});
			element.tabChange('tabs',id+1);
			element.init();
	  });
	  	
	});
	function singleMenu(id){
	}
	/*循环菜单*/
	function initMenu(menu,parent,rootPath,flag){
		for(var i=0; i<menu.length; i++){   
			var item = menu[i];
			var str = "";
			try{
				if(item.isHeader == "1"){
					str = "<li class='layui-nav-item'><a id='"+item.id+"'style='font-size:20px;'>"+item.name+"</a></li>";
					$(parent).append(str);
					if(item.childMenus != ""){
						if(flag=="init"){
							if(i>0){
								continue;
							}else{
								initMenu(item.childMenus,$("#header2"),rootPath);
							}
						}
					}
				}else{
					str = "<li class='layui-nav-item'><a href='"+rootPath+item.url+"' target='option'><span>"+item.name+"</span></a></li>";
					$(parent).append(str);
					/*if(item.childMenus == "" && item.type==1){
						str = "<li class='layui-nav-item'><a href='"+rootPath+item.url+"'><span>"+item.name+"</span></a></li>";
						$(parent).append(str);
					}else{
						 str = "<li class='layui-nav-item'><a href='"+item.url+"'><span>"+item.name+"</span></i></a>";
						str +="<ul class='menu-item-child' id='menu-child-"+item.id+"'></ul></li>";
						$(parent).append(str);
						var childParent = $("#menu-child-"+item.id);
						initMenu(item.childMenus,childParent,rootPath); 
					}*/
				}
			}catch(e){}
		}
	}
	
	function exit(){
		location.href="/support";
	}
</script>
</body>
</html>