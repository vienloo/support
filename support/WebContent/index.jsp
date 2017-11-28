<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn" />
    <meta http-equiv="X-UA-Compatible" content="chrome=1" />
	<meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="author" content="martin" />
    <meta name="Copyright" content="qq:249189520" />
	<link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
	<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
	<script type="text/javascript" src="<%=path%>/res/jquery-1.11.0.min.js"></script>
    <title>后台管理</title>

    <style type="text/css">
        .layui-nav-tree .layui-nav-child a:hover { color: #fff; background: #4E5465; }
        /*sidebar mini*/
        .layui-layout-admin .sidebar-mini { width: 70px; }
        .layui-layout-admin .sidebar-mini .layui-side-scroll { width: 100px; }
        .layui-layout-admin .sidebar-mini #sidebar { width: 70px; }
        .layui-layout-admin .sidebar-mini .layui-nav-tree { width: 70px; }
        .layui-layout-admin .sidebar-mini .layui-nav .layui-nav-item a { padding: 0 15px; }
        .layui-layout-admin .sidebar-mini .layui-nav-item a cite { display: none; }
        #sidebar { height: 40px;  background: #4A5064; text-align: center; line-height: 40px !important; font-size: 18px; user-select: none; cursor: pointer; -webkit-user-select: none; -moz-user-select: none; }
    
	
		@font-face {
		  font-family: 'iconfont';  /* project id 58108 */
		  src: url('//at.alicdn.com/t/font_5ilczeunl4cdte29.eot');
		  src: url('//at.alicdn.com/t/font_5ilczeunl4cdte29.eot?#iefix') format('embedded-opentype'),
		  url('//at.alicdn.com/t/font_5ilczeunl4cdte29.woff') format('woff'),
		  url('//at.alicdn.com/t/font_5ilczeunl4cdte29.ttf') format('truetype'),
		  url('//at.alicdn.com/t/font_5ilczeunl4cdte29.svg#iconfont') format('svg');
		}
	</style>
	
	<style>
	.wrapper{  color: white;}
	html{background-color:#374155}
	*{
	  margin: 0;
	  padding: 0;
	  font-weight: 300;
	}
	body {
	  font-family: 'Source Sans Pro', sans-serif;
	
	  font-weight: 300;
	}
	body ::-webkit-input-placeholder {
	  /* WebKit browsers */
	  font-family: 'Source Sans Pro', sans-serif;
	
	  font-weight: 300;
	}
	body :-moz-placeholder {
	  /* Mozilla Firefox 4 to 18 */
	  font-family: 'Source Sans Pro', sans-serif;
	
	  opacity: 1;
	  font-weight: 300;
	}
	body :-moz-placeholder {
	  /* Mozilla Firefox 19+ */
	  font-family: 'Source Sans Pro', sans-serif;
	
	  opacity: 1;
	  font-weight: 300;
	}
	body :-ms-input-placeholder {
	  /* Internet Explorer 10+ */
	  font-family: 'Source Sans Pro', sans-serif;
	  font-weight: 300;
	}
	.wrapper {
	  background: #56627b;
	  background: -webkit-linear-gradient(top left, #56627b 0%, #5e7cba 100%);
	  background: linear-gradient(to bottom right, #56627b 0%, #5e7cba 100%);
	  opacity: 0.8;
	  position: absolute;
	  top: 50%;
	  left: 0;
	  width: 100%;
	  height: 400px;
	  margin-top: -200px;
	  overflow: hidden;
	
	}
	
	.wrapper.form-success .container h1 {
	  -webkit-transform: translateY(85px);
	      -ms-transform: translateY(85px);
	          transform: translateY(85px);
	}
	.container {
	  max-width: 600px;
	  margin: 0 auto;
	  padding: 80px 0;
	  height: 400px;
	  text-align: center;position: relative;z-index: 999;
	}
	.container h1 {
	  font-size: 40px;
	  -webkit-transition-duration: 1s;
	          transition-duration: 1s;
	  -webkit-transition-timing-function: ease-in-put;
	          transition-timing-function: ease-in-put;
	  font-weight: 200;
	}
	form {
	  padding: 20px 0;
	
	}
	form input {
	  -webkit-appearance: none;
	     -moz-appearance: none;
	          appearance: none;
	  outline: 0;
	  border: 1px solid rgba(255, 255, 255, 0.4);
	  background-color: rgba(255, 255, 255, 0.2);
	  width: 300px;
	  border-radius: 3px;
	  padding: 10px 15px;
	  margin: 0 auto 10px auto;
	  display: block;
	  text-align: center;
	  font-size: 18px;
	  color: black;
	  -webkit-transition-duration: 0.25s;
	          transition-duration: 0.25s;
	  font-weight: 300;
	}
	form input:hover {
	  background-color: rgba(255, 255, 255, 0.4);
	}
	form input:focus {
	  background-color:white;
	  width: 300px;
	  color: #5e7cba;
	}
	form button {
	
	  background-color: white;
	  border: 0;
	  padding: 10px 15px;
	  color: #5e7cba;
	  border-radius: 3px;
	  width: 160px;
	  cursor: pointer;
	  font-size: 18px;
	
	}
	form button:hover {
	  background-color: #f5f7f9;
	}
	.bg-bubbles {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 1;
	}
	.bg-bubbles li {
	  position: absolute;
	  list-style: none;
	  display: block;
	  width: 40px;
	  height: 40px;
	  background-color: rgba(255, 255, 255, 0.15);
	  bottom: -160px;
	  -webkit-animation: square 25s infinite;
	  animation: square 25s infinite;
	  -webkit-transition-timing-function: linear;
	  transition-timing-function: linear;
	}
	.bg-bubbles li:nth-child(1) {
	  left: 10%;
	}
	.bg-bubbles li:nth-child(2) {
	  left: 20%;
	  width: 80px;
	  height: 80px;
	  -webkit-animation-delay: 2s;
	          animation-delay: 2s;
	  -webkit-animation-duration: 17s;
	          animation-duration: 17s;
	}
	.bg-bubbles li:nth-child(3) {
	  left: 25%;
	  -webkit-animation-delay: 4s;
	          animation-delay: 4s;
	}
	.bg-bubbles li:nth-child(4) {
	  left: 40%;
	  width: 60px;
	  height: 60px;
	  -webkit-animation-duration: 22s;
	          animation-duration: 22s;
	  background-color: rgba(255, 255, 255, 0.25);
	}
	.bg-bubbles li:nth-child(5) {
	  left: 70%;
	}
	.bg-bubbles li:nth-child(6) {
	  left: 80%;
	  width: 120px;
	  height: 120px;
	  -webkit-animation-delay: 3s;
	          animation-delay: 3s;
	  background-color: rgba(255, 255, 255, 0.2);
	}
	.bg-bubbles li:nth-child(7) {
	  left: 32%;
	  width: 160px;
	  height: 160px;
	  -webkit-animation-delay: 7s;
	          animation-delay: 7s;
	}
	.bg-bubbles li:nth-child(8) {
	  left: 55%;
	  width: 20px;
	  height: 20px;
	  -webkit-animation-delay: 15s;
	          animation-delay: 15s;
	  -webkit-animation-duration: 40s;
	          animation-duration: 40s;
	}
	.bg-bubbles li:nth-child(9) {
	  left: 25%;
	  width: 10px;
	  height: 10px;
	  -webkit-animation-delay: 2s;
	          animation-delay: 2s;
	  -webkit-animation-duration: 40s;
	          animation-duration: 40s;
	  background-color: rgba(255, 255, 255, 0.3);
	}
	.bg-bubbles li:nth-child(10) {
	  left: 90%;
	  width: 160px;
	  height: 160px;
	  -webkit-animation-delay: 11s;
	          animation-delay: 11s;
	}
	@-webkit-keyframes square {
	  0% {
	    -webkit-transform: translateY(0);
	            transform: translateY(0);
	  }
	  100% {
	    -webkit-transform: translateY(-700px) rotate(600deg);
	            transform: translateY(-700px) rotate(600deg);
	  }
	}
	@keyframes square {
	  0% {
	    -webkit-transform: translateY(0);
	            transform: translateY(0);
	  }
	  100% {
	    -webkit-transform: translateY(-700px) rotate(600deg);
	            transform: translateY(-700px) rotate(600deg);
	  }
	}
	</style>

	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
</head>
<body>

	
<div class="wrapper">
	<div class="container">
		<h1>信息管理系统</h1>
		<form action="<%=path%>/sys/login.do" method="post" class="layui-form layui-form-pane">
			<input id="loginId" name="loginId"  required lay-verify="required"  type="text" autocomplete = "off" placeholder="此处输入帐号"/>
			<input id="password" name="password"  required lay-verify="required" type="password" autocomplete = "new-password" placeholder="此处输入密码"/>
			<div class="layui-btn layui-btn-warm layui-btn-big" onclick="register()" style="width: 150px">注册</div>&nbsp;
			<button class="layui-btn layui-btn-warm layui-btn-big " lay-submit lay-filter="login" style="width: 150px">登陆</button>
		</form>
	</div>
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
<script>
	function register(){
		layer.open({
			type: 1,
			title:"注册信息",
			content:$("#register"),
			skin: 'layui-layer-molv',
			area: ['400px','460px'],
			btn: ['确定','取消'],
			yes: function(index,layero){
		    //按钮【按钮一】的回调
		    	var name = $("#name").val();
		    	if(name==""){
		    		layer.msg("姓名不能为空")
		    		return false;
		    	}
		    	var phone = $("#phone").val();
		    	if(phone==""){
		    		layer.msg("手机号不能为空")
		    		return false;
		    	}
		    	var dept = $("#dept").val();
		    	if(dept==""){
		    		layer.msg("部门不能为空")
		    		return false;
		    	}
				var login_id = $("#login_id").val();
				if(login_id==""){
		    		layer.msg("帐号不能为空")
		    		return false;
		    	}
				var password_1 = $("#password_1").val();
				if(password_1==""){
		    		layer.msg("密码不能为空")
		    		return false;
		    	}
				var password_2 = $("#password_2").val();
				if(password_2==""){
		    		layer.msg("密码不能为空")
		    		return false;
		    	}
				if(password_1 != password_2){
					layer.msg("两次密码不一致")
		    		return false;
				}
				$.ajax({
					type:"POST", 
					url:"<%=path%>/sys/register.do", 
					data:{
						name:name,
						phone:phone,
						dept:dept,
						loginId:login_id,
						password_1:password_1,
						password_2:password_2
					}, 
					cache:false, //不缓存此页面 
					success:function(msg){
						if(msg.code==0){
							layer.msg("注册成功")
							layer.close(index);
							empty();
							$("#register").hide();
						}else{
							layer.msg("注册失败，请检查无误后再提交")
							layer.close(index);
							empty();
				  			$("#register").hide();
						}
					}
				});		   
		  	},
		  	btn2: function(index, layero){
		    //按钮【按钮二】的回调
		  		if(confirm('确定要放弃本次注册吗？')){ //只有当点击confirm框的确定时，该层才会关闭
		  			layer.close(index);
		  			empty();	
		  			$("#register").hide();
		  		}
		  		return false;
		    //return false 开启该代码可禁止点击该按钮关闭
		  	},
		  	cancel: function(index, layero){ 
		    //右上角关闭回调
		  		if(confirm('确定要放弃本次注册吗？')){ //只有当点击confirm框的确定时，该层才会关闭
		  			layer.close(index);
		  			empty();
		  			$("#register").hide();
		  		}
		  		return false;
		    //return false 开启该代码可禁止点击该按钮关闭
		  	},
		  	closeBtn: 2,
		  	shade:1,
		  	shadeClose:false,
		  	anim:2,
		  	maxmin: false,
		  	resize:false,
		  	move: false
		}); 
	}
	function empty(){
		$("#name").val("");
		$("#phone").val("");
		$("#dept").val("");
		$("#loginId").val("");
		$("#password_1").val("");
		$("#password_2").val("");
		$("#login_id").val("");
		$("#password").val("");	
	}
</script>
</body>

<div id="register" style="display:none;">
	<form class="layui-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label">姓名:</label>
			<div class="layui-input-block">
      			<input type="text" id="name" required  lay-verify="required" placeholder="请输入姓名" class="layui-input" style="width:90%">
   			</div>
   		</div>
   		<div class="layui-form-item">
			<label class="layui-form-label">手机号:</label>
			<div class="layui-input-block">
      			<input type="text" id="phone" required  lay-verify="required|phone|number" placeholder="请输入手机号" class="layui-input" style="width:90%">
   			</div>
   		</div>
   		<div class="layui-form-item">
			<label class="layui-form-label">部门:</label>
			<div class="layui-input-block">
      			<input type="text" id="dept" required  lay-verify="required" placeholder="请输入所在部门" class="layui-input" style="width:90%">
   			</div>
   		</div>
   		<div class="layui-form-item">
   			<label class="layui-form-label">帐号:</label>
			<div class="layui-input-block">
      			<input type="text" id="login_id" required  lay-verify="required" placeholder="请设置登录系统帐号" class="layui-input" style="width:90%">
   			</div>
   		</div>
   		<div class="layui-form-item">
   			<label class="layui-form-label">密码:</label>
			<div class="layui-input-block">
     	 		<input type="password" id="password_1" required lay-verify="required" placeholder="请设置登录系统密码" class="layui-input" style="width:90%">
   			</div>
   		</div>
   		<div class="layui-form-item">
   			<label class="layui-form-label">确认密码:</label>
    		<div class="layui-input-block">
     	 		<input type="password" id="password_2" required lay-verify="required" placeholder="再次确认密码" class="layui-input" style="width:90%">
    		</div>
   		</div>
   	</form>	
</div>
</html>