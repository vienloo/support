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
			url : '<%=path%>/dict/getDictItem.do',
			mtype : 'post',
			datatype : "json",
			autowidth : false,
			regional : 'cn',
			altRows : true,//设置表格 zebra-striped 值 
			altclass : "zebra-striped",//用来指定行显示的css，可以编辑自己的css文件，只有当altRows设为 ture时起作用 
			hidegrid:false, //启用或者禁用控制表格显示、隐藏的按钮，只有当caption 属性不为空时起效 
			caption:"字典列表",//表格的标题名字,
			rownumbers : true,//如果为ture则会在表格左边新增一列，显示行顺序号，从1开始递增。此列名为'rn'. 
			multiselect: true, //定义是否可以多选
			colNames : ['id','code值','类型名称','字典名称','value值'],
			colModel : [{
				name : 'dictItem_id',
				hidden:true
			},{
				name : 'dictItem_code',
				align : 'center'
			},{
				name : 'dictItem_typeName',
				align : 'center'
			},{
				name : 'dictItem_name',
				align : 'center'
			},{
				name : 'dictItem_value',
				align : 'center'
			}],
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
		$("#t_gridTable").append($("#toolbar").html());
		$("#gridTable").closest(".ui-jqgrid-bdiv").css({ 'overflow-y' : 'scroll','overflow-x':'hidden' });
		doResize();
	});
</script>
</head>
<body style="margin: 5px 5px">
    <div id="editor" style="display: none;width: 100%;height: 100%">
   		<table align="center" style="padding-top: 5px;">
    		<tr>
    			<td align="right" width="25%"><label>字典类型：</label></td>
    			<td><select style="width: 100%;" id="dictItem_type" class="css-select">
					</select>
				</td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>字典名称：</label></td>
    			<td><input style="width: 99%;" id="dictItem_name" class="css-input"></td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>value值：</label></td>
    			<td><input style="width: 99%;" id="dictItem_value" class="css-input"></td>
    		</tr>
    	</table>
    </div>
</body>
<script type="text/javascript">
function initTable(){
	$("#dictItem_type").val(0);
	$("#dictItem_name").val("");
	$("#dictItem_value").val("");
}
function getDictType(){
	$.ajax({
		url:"<%=path%>/common/getDictType.do",
		type:"post",
		timeout: 3000,
		async: false,
		dataType:"json",
		success:function(data, textStatus){
			$("#dictItem_type").empty();
			$("#dictItem_type").append("<option value='0'>请选择</option>");
			for(var i=0;i<data.data.items.length;i++){
				$("#dictItem_type").append("<option value='"+data.data.items[i].id+"'>"+data.data.items[i].name+"</option>");
			}
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
            //XMLHttpRequest对象、错误信息、捕获的错误对象(可选)。
            alert("error="+textStatus);
        }
	});
}
function select(){
	var keywords = $("#keywords").val();
	var url = '<%=path%>/dict/getDictItem.do?keywords='+keywords;
	$("#gridTable").jqGrid('setGridParam',{url:url}).trigger('reloadGrid');
}
function add(){
	initTable();
	getDictType();
	layer.open({
		type:1,
		resize:false,
		scrollbar:false,
		title:'新增',
		closeBtn:0,
		area:['400px', '200px'],
		content:$("#editor"),
		btn:['保存', '关闭'],
		yes:function(index, layero){
			var code = $("#dictItem_type").val();
			var name = $("#dictItem_name").val();
			var value = $("#dictItem_value").val();
		    $.ajax({
		    	url:"<%=path%>/dict/addDictItem.do",
				type:"post",
				timeout: 3000,
				async: false,
				data:{code:code,name:name,value:value},
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
	var rowid = $("#gridTable").jqGrid('getGridParam','selarrrow');//获取我选中的Id
	if(rowid.length != 1){
		layer.msg("修改前请选择一行数据");
		return false;
	}
	
	//初始化数据
	initTable();
	getDictType();
	//装载数据
	var rowData = $("#gridTable").jqGrid('getRowData',rowid);
	var id = rowData.dictItem_id;
	
	$("#dictItem_type").val(rowData.dictItem_code);
	$("#dictItem_name").val(rowData.dictItem_name);
	$("#dictItem_value").val(rowData.dictItem_value);
	layer.open({
		type:1,
		resize:false,
		scrollbar:false,
		title:'修改',
		closeBtn:0,
		area:['400px', '200px'],
		content:$("#editor"),
		btn:['保存', '关闭'],
		yes:function(index, layero){
			var code = $("#dictItem_type").val();
			var name = $("#dictItem_name").val();
			var value = $("#dictItem_value").val();
		    $.ajax({
		    	url:"<%=path%>/dict/updateDictItem.do",
				type:"post",
				timeout: 3000,
				async: false,
				data:{id:id,code:code,name:name,value:value},
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
			var id = row.dictItem_id;
			ids.push(id);
		}
	}
	
	layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index){
		$.ajax({
	    	url:"<%=path%>/dict/removeDictItem.do",
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
</script>
</html>