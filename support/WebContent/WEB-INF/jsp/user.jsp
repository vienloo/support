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
			url : '<%=path%>/system/getUser.do',
			mtype : 'post',
			datatype : "json",
			autowidth : false,
			regional : 'cn',
			altRows : true,//设置表格 zebra-striped 值 
			altclass : "zebra-striped",//用来指定行显示的css，可以编辑自己的css文件，只有当altRows设为 ture时起作用 
			hidegrid:false, //启用或者禁用控制表格显示、隐藏的按钮，只有当caption 属性不为空时起效 
			caption:"用户列表",//表格的标题名字,
			rownumbers : true,//如果为ture则会在表格左边新增一列，显示行顺序号，从1开始递增。此列名为'rn'. 
			multiselect: true, //定义是否可以多选
			colNames : ['id','登录帐号','用户姓名','性别','电话','company','公司','dept','部门','工号','role','角色','操作'],
			colModel : [{
				name : 'user_id',
				hidden:true
			},{
				name : 'login_id',
				align : 'center',
				width :80
			},{
				name : 'user_name',
				align : 'center',
				width :80
			},{
				name : 'user_sex',
				align : 'center',
				width :40,
				formatter:function(cellvalue,options,rowObject){
					if(cellvalue==1){
						return "男";
					}else {
						return "女";
					}
				},
				unformat:function(cellvalue,options,rowObject){
					if(cellvalue=="男"){
						return 1;
					}else {
						return 2;
					}
				}
			},{
				name : 'user_phone',
				align : 'center',
				width :80
			},{
				name : 'user_company',
				align : 'center',
				hidden:true
			},{
				name : 'user_companyName',
				align : 'center'
			},{
				name : 'user_dept',
				align : 'center',
				hidden:true
			},{
				name : 'user_deptName',
				align : 'center'
			},{
				name : 'user_worknum',
				align : 'center',
				width :40
			},{
				name : 'user_role',
				align : 'center',
				hidden:true
			},{
				name : 'user_roleName',
				align : 'center',
				width :80
			},{
				name : 'process',
				align : 'center',
				width :60
			}],
			gridComplete : function() {
				var ids = $("#gridTable").jqGrid('getDataIDs');
				for ( var i = 0; i < ids.length; i++) {
					var cl = ids[i];
					var button = "<input type='button' value='密码初始化' onclick='initPassWord("+ cl + ")'/>";
					$("#gridTable").jqGrid('setRowData',ids[i],{process : button});
				}
			},
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
    			<td align="right" width="25%"><label>登录帐号：</label></td>
    			<td><input style="width: 99%;" id="login_id" class="css-input"></td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>用户姓名：</label></td>
    			<td><input style="width: 99%;" id="user_name" class="css-input"></td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>性别：</label></td>
    			<td><select style="width: 100%;" id="user_sex" class="css-select">
						<option value="1">男</option>
						<option value="2">女</option>
					</select>
				</td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>手机号：</label></td>
    			<td><input style="width: 99%;" id="user_phone" class="css-input"></td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>公司：</label></td>
    			<td><select style="width: 100%;" id="user_company" class="css-select">
					</select>
				</td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>部门：</label></td>
    			<td><select style="width: 100%;" id="user_dept" class="css-select">
					</select>
				</td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>工号：</label></td>
    			<td><input style="width: 99%;" id="user_worknum" class="css-input"></td>
    		</tr>
    		<tr>
    			<td align="right" width="25%"><label>系统角色：</label></td>
    			<td><select style="width: 100%;" id="user_role" class="css-select">
					</select>
				</td>
    		</tr>
    	</table>
    </div>
</body>
<script type="text/javascript">
function initTable(){
	$("#login_id").val("");
	$("#user_name").val("");
	$("#user_sex").val(1);
	$("#user_phone").val("");
	$("#user_company").val(0);
	$("#user_dept").val(0);
	$("#user_worknum").val("");
	$("#user_role").val(0);
}
function getCompany(){
	$.ajax({
		url:"<%=path%>/common/getCompany.do",
		type:"post",
		timeout: 3000,
		async: false,
		dataType:"json",
		success:function(data, textStatus){
			$("#user_company").empty();
			$("#user_company").append("<option value='0'>请选择</option>");
			for(var i=0;i<data.data.items.length;i++){
				$("#user_company").append("<option value='"+data.data.items[i].id+"'>"+data.data.items[i].name+"</option>");
			}
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
            //XMLHttpRequest对象、错误信息、捕获的错误对象(可选)。
            alert("error="+textStatus);
        }
	});
}
function getDept(){
	$.ajax({
		url:"<%=path%>/common/getDept.do",
		type:"post",
		timeout: 3000,
		async: false,
		dataType:"json",
		success:function(data, textStatus){
			$("#user_dept").empty();
			$("#user_dept").append("<option value='0'>请选择</option>");
			for(var i=0;i<data.data.items.length;i++){
				$("#user_dept").append("<option value='"+data.data.items[i].id+"'>"+data.data.items[i].name+"</option>");
			}
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
            //XMLHttpRequest对象、错误信息、捕获的错误对象(可选)。
            alert("error="+textStatus);
        }
	});
}
function getRole(){
	$.ajax({
		url:"<%=path%>/common/getRole.do",
		type:"post",
		timeout: 3000,
		async: false,
		dataType:"json",
		success:function(data, textStatus){
			$("#user_role").empty();
			$("#user_role").append("<option value='0'>请选择</option>");
			for(var i=0;i<data.data.items.length;i++){
				$("#user_role").append("<option value='"+data.data.items[i].id+"'>"+data.data.items[i].name+"</option>");
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
	var url = '<%=path%>/system/getUser.do?keywords='+keywords;
	$("#gridTable").jqGrid('setGridParam',{url:url}).trigger('reloadGrid');
}
function add(){
	initTable();
	getCompany();
	getDept();
	getRole();
	layer.open({
		type:1,
		resize:false,
		scrollbar:false,
		title:'新增',
		closeBtn:0,
		area:['400px', '335px'],
		content:$("#editor"),
		btn:['保存', '关闭'],
		yes:function(index, layero){
			var loginId = $("#login_id").val();
			var userName = $("#user_name").val();
			var sex = $("#user_sex").val();
			var phone = $("#user_phone").val();
			var company = $("#user_company").val();
			var department = $("#user_dept").val();
			var worknum = $("#user_worknum").val();
			var role = $("#user_role").val();
		    $.ajax({
		    	url:"<%=path%>/system/addUser.do",
				type:"post",
				timeout: 3000,
				async: false,
				data:{loginId:loginId,userName:userName,sex:sex,phone:phone,
					company:company,department:department,worknum:worknum,role:role
				},
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
	getCompany();
	getDept();
	getRole();
	//装载数据
	var rowData = $("#gridTable").jqGrid('getRowData',rowid);
	var id = rowData.user_id;
	
	$("#login_id").val(rowData.login_id);
	$("#user_name").val(rowData.user_name);
	$("#user_sex").val(rowData.user_sex);
	$("#user_phone").val(rowData.user_phone);
	$("#user_company").val(rowData.user_company);
	$("#user_dept").val(rowData.user_dept);
	$("#user_worknum").val(rowData.user_worknum);
	$("#user_role").val(rowData.user_role);
	layer.open({
		type:1,
		resize:false,
		scrollbar:false,
		title:'修改',
		closeBtn:0,
		area:['400px', '335px'],
		content:$("#editor"),
		btn:['保存', '关闭'],
		yes:function(index, layero){
			var loginId = $("#login_id").val();
			var userName = $("#user_name").val();
			var sex = $("#user_sex").val();
			var phone = $("#user_phone").val();
			var company = $("#user_company").val();
			var department = $("#user_dept").val();
			var worknum = $("#user_worknum").val();
			var role = $("#user_role").val();
		    $.ajax({
		    	url:"<%=path%>/system/updateUser.do",
				type:"post",
				timeout: 3000,
				async: false,
				data:{id:id,loginId:loginId,userName:userName,sex:sex,phone:phone,
					company:company,department:department,worknum:worknum,role:role
				},
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
			var id = row.user_id;
			ids.push(id);
		}
	}
	
	layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index){
		$.ajax({
	    	url:"<%=path%>/system/removeUser.do",
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
function initPassWord(id){
	$.ajax({
		url:"<%=path%>/system/initPassWord.do",
		type:"post",
		timeout: 3000,
		async: false,
		data:{id:id},
		dataType:"json",
		success:function(data, textStatus){
			if(data==1){
				layer.msg("初始化完成");
			}else if(data==2){
				layer.msg("初始化失败");
			}else{
				layer.msg("未知错误");
			}
				
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
            //XMLHttpRequest对象、错误信息、捕获的错误对象(可选)。
            alert("error="+textStatus);
        }
	});
}
</script>
</html>