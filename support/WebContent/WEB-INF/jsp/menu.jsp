<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + request.getContextPath();
%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.css-select{
	height: 24px;
}
.css-input{
	height: 18px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#gridTable").jqGrid({
			url : '<%=path%>/system/getMenu.do',
			mtype : 'post',
			datatype : "json",
			autowidth : false,
			regional : 'cn',
			altRows : true,//设置表格 zebra-striped 值 
			altclass : "zebra-striped",//用来指定行显示的css，可以编辑自己的css文件，只有当altRows设为 ture时起作用 
			hidegrid:false, //启用或者禁用控制表格显示、隐藏的按钮，只有当caption 属性不为空时起效 
			caption:"菜单列表",//表格的标题名字,
			rownumbers : true,//如果为ture则会在表格左边新增一列，显示行顺序号，从1开始递增。此列名为'rn'. 
			multiselect: true, //定义是否可以多选
			colNames : ['id','parentId','type','名称','访问地址','类型','显示顺序'],
			colModel : [{
				name : 'mainId',
				hidden:true
			},{
				name : 'parentId',
				hidden:true
				/*  */
			},{
				name : 'type',
				hidden:true
				/*  */
			}, {
				name : 'menuName',
				width : 190,
				align : 'center'
			}, {
				name : 'url',
				width : 190,
				align : 'center'
			}, {
				name : 'typeName',
				width : 50,
				align : 'center',
				formatter:function(cellvalue, options, rowObject){
					if(cellvalue==0){
						return "目录";
					}else {
						return "菜单";
					}
				}
			}, {
				name : 'orderBy',
				width : 190,
				align : 'center'
			}],
			//sortname : 'id',//排序列的名称，此参数会被传到后台 
			//sortorder : 'asc',//排序顺序，升序或者降序（asc or desc）
			toolbar : [ true, "top" ],//在顶部显示工具栏
			pager : "#gridPager",//翻页
			pagerpos : "center",//指定分页栏的位置 
			pgbuttons : true,//决定在Pager Bar里是否显示用于翻页的按键，默认为true
			pginput : true, //决定在Pager Bar里是否显示用于输入目标页码的输入框，默认为true
			rowNum : 10,//
			rowList : [10,20,50,100,500],//一个数组用来调整表格显示的记录数，此参数值会替代rowNum参数值传给服务器端
			viewrecords : true,//是否要显示总记录数 
			emptyrecords:"暂无查询信息",//查询数据行数为0时显示的信息，viewrecords必须设置为true生效	
			jsonReader: {  
				 root: "dataList",   // json中代表实际模型数据的入口  
				 page: "page",   // json中代表当前页码的数据  
				 total: "total", // json中代表页码总数的数据  
				 records: "records", // json中代表数据行总数的数据  
				 repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定
			}
		}).navGrid('#gridPager', {
			edit : false,
			add : false,
			del : false,
			refresh : false,
			search : false
		});
		doResize();
		$("#t_gridTable").append($("#toolbar").html());
		$("#gridTable").closest(".ui-jqgrid-bdiv").css({ 'overflow-y' : 'scroll','overflow-x':'hidden' });
	});
</script>
</head>
<body style="margin: 5px 5px">
    <div id="editor" style="display: none;width: 100%;height: 100%">
   		<table align="center" style="padding-top: 5px;">
    		<tr>
    			<td align="right" width="25%"><label>目录\菜单：</label></td>
    			<td><select style="width: 100%;" id="menu_type" class="css-select">
    				<option value="0">目录</option>
    				<option value="1">菜单</option>
    			</select></td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>所属上级：</label></td>
    			<td><select style="width: 100%;" id="parent" class="css-select">
					</select>
    			</td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>使用名称：</label></td>
    			<td><input style="width: 99%;" id="menu_name" class="css-input"></td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>使用地址：</label></td>
    			<td><input style="width: 99%;" id="menu_url" class="css-input"></td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>排序位置：</label></td>
    			<td><input style="width: 99%;" id="order_by" class="css-input" type="number"></td>
    		</tr>
    	</table>
    </div>
</body>
<script type="text/javascript">
function selectAllMulu(){
	$.ajax({
		url:"<%=path%>/system/selectAllMulu.do",
		type:"post",
		timeout: 3000,
		async: false,
		dataType:"json",
		success:function(data, textStatus){
			$("#parent").empty();
			for(var i=0;i<data.length;i++){
				$("#parent").append("<option value='"+data[i].menu_id+"'>"+data[i].menu_name+"</option>");
			}
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
            //XMLHttpRequest对象、错误信息、捕获的错误对象(可选)。
            alert("error="+textStatus);
        }
	});
}
function initTable(){
	$("#menu_name").val("");
	$("#menu_url").val("");
    $("#order_by").val("");
}
function select(){
	var keywords = $("#keywords").val();
	var url = '<%=path%>/system/getMenu.do?keywords='+keywords;
	$("#gridTable").jqGrid('setGridParam',{url:url}).trigger('reloadGrid');
}
function add(){
	initTable();
	selectAllMulu();
	layer.open({
		type:1,
		resize:false,
		scrollbar:false,
		title:'新增',
		closeBtn:0,
		area:['400px', '250px'],
		content:$("#editor"),
		btn:['保存', '关闭'],
		yes:function(index, layero){
		    var menu_type=$("#menu_type").val();
		    var parent=$("#parent").val();
		    var menu_name=$("#menu_name").val();
		    var menu_url=$("#menu_url").val();
		    var order_by=$("#order_by").val();
		    $.ajax({
		    	url:"<%=path%>/system/addMenu.do",
				type:"post",
				timeout: 3000,
				async: false,
				data:{type:menu_type,parentId:parent,name:menu_name,url:menu_url,orderBy:order_by},
				dataType:"json",
				success:function(data, textStatus){
					if(data.code==0){
						$("#gridTable").trigger("reloadGrid");
						layer.close(index);
						layer.msg(data.msg);
					}else{
						layer.msg(data.msg);
					}	
		        },
		        error:function(XMLHttpRequest, textStatus, errorThrown){
		            //XMLHttpRequest对象、错误信息、捕获的错误对象(可选)。
		            alert("error="+textStatus);
		        }
		    });
		},
		btn2: function(index, layero){
		    //按钮【按钮二】的回调
		    //return false 开启该代码可禁止点击该按钮关闭
		}
	});
   
}
function edit(){
	//得到行信息 单选时
	//var rowid=$("#gridTable").jqGrid("getGridParam",'selrow');
	//if(rowid !=null){
	//	alert(rowid.length)
	//	layer.msg("修改前请选择一行数据");
	//	return false;
	//}
	//得到行信息 多选时
	var rowid = $("#gridTable").jqGrid('getGridParam','selarrrow');//获取我选中的Id
	if(rowid.length != 1){
		layer.msg("修改前请选择一行数据");
		return false;
	}
	
	//初始化数据
	initTable();
	selectAllMulu();
	//装载数据
	var rowData = $("#gridTable").jqGrid('getRowData',rowid);
	var id = rowData.mainId;
	
	$("#menu_type").val(rowData.type); //移除属性selected
	$("#parent").val(rowData.parentId);
	$("#menu_name").val(rowData.menuName);
	$("#menu_url").val(rowData.url);
	$("#order_by").val(rowData.orderBy);
	layer.open({
		type:1,
		resize:false,
		scrollbar:false,
		title:'修改',
		closeBtn:0,
		area:['400px', '250px'],
		content:$("#editor"),
		btn:['保存', '关闭'],
		yes:function(index, layero){
		    var menu_type=$("#menu_type").val();
		    var parent=$("#parent").val();
		    var menu_name=$("#menu_name").val();
		    var menu_url=$("#menu_url").val();
		    var order_by=$("#order_by").val();
		    $.ajax({
		    	url:"<%=path%>/system/updateMenu.do",
				type:"post",
				timeout: 3000,
				async: false,
				data:{id:id,type:menu_type,parentId:parent,name:menu_name,url:menu_url,orderBy:order_by},
				dataType:"json",
				success:function(data, textStatus){
					if(data.code==0){
						$("#gridTable").trigger("reloadGrid");
						layer.close(index);
						layer.msg(data.msg);
					}else{
						layer.msg(data.msg);
					}	
		        },
		        error:function(XMLHttpRequest, textStatus, errorThrown){
		            //XMLHttpRequest对象、错误信息、捕获的错误对象(可选)。
		            alert("error="+textStatus);
		        }
		    });
		},
		btn2: function(index, layero){
		    //按钮【按钮二】的回调
		    //return false 开启该代码可禁止点击该按钮关闭
		}
	});
	

}
function remove(){
	var rowid = $("#gridTable").jqGrid('getGridParam','selarrrow');//获取我选中的Id
	var ids = [];
	if(rowid.length<1){
		layer.msg("删除前请选择需要删除的行数据");
		return false;
	}else{
		//装载数据
		//遍历访问这个集合  
		for(var i=0;i<rowid.length;i++){
			var row = $("#gridTable").jqGrid('getRowData', rowid[i]);
			var id = row.mainId;
			ids.push(id);
		}
	}
	
	layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index){
		$.ajax({
	    	url:"<%=path%>/system/removeMenu.do",
			type:"post",
			timeout: 3000,
			async: false,
			data:{ids:ids.join(",")},
			dataType:"json",
			success:function(data, textStatus){
				if(data.code==0){
					$("#gridTable").trigger("reloadGrid");
					layer.close(index);
					layer.msg(data.msg);
				}else{
					layer.msg(data.msg);
				}	
	        },
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	            //XMLHttpRequest对象、错误信息、捕获的错误对象(可选)。
	            alert("error="+textStatus);
	        }
	    });
	  layer.close(index);
	});
}
<%-- function select(){
	var keywords = $("#keywords").val();
	alert(keywords)
	$.ajax({
		url:"<%=path%>/system/getMenu.do",
		type:"post",
		async:true,
		dataType:"json",
		data:{keywords:keywords},
		success:function(data, textStatus){
            alert("sccuess="+data);
            $("#gridTable").jqGrid('clearGridData');  //清空表格
            $("#gridTable").jqGrid('setGridParam',{  // 重新加载数据
                  data : data   //data 是符合格式要求的需要重新加载的数据 
            }).trigger("reloadGrid");
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
            //XMLHttpRequest对象、错误信息、捕获的错误对象(可选)。
            alert("error="+textStatus);
        }
	});
} --%>
</script>
</html>