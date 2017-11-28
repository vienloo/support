<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>首页</title>
<link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
<script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
<style>
body {
	margin: 10px;
}
.carousel{
	height: 600px; 
	line-height: 200px; 
	text-align: center;
}
</style>
</head>
<body>

	<div class="layui-tab layui-tab-brief">
		<ul class="layui-tab-title">
			<li class="layui-this">最新活动</li>
			<li>注册</li>
			<li>帮助</li>
			<li style="float: right;" onclick="jump()">运营方入口</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">

				<div class="layui-carousel" id="banner">
					<div carousel-item>
						<div>
							<p class="layui-bg-green carousel">图片一</p>
						</div>
						<div>
							<p class="layui-bg-red carousel">图片二</p>
						</div>
						<div>
							<p class="layui-bg-blue carousel">图片三</p>
						</div>
						<div>
							<p class="layui-bg-orange carousel">图片四</p>
						</div>
						<div>
							<p class="layui-bg-cyan carousel">图片五</p>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-tab-item">
				<!-- <div id="laydateDemo"></div> -->
			</div>
			<div class="layui-tab-item">
				<!-- <div id="pageDemo"></div> -->
			</div>
		</div>
	</div>

	<script>
		layui.use(['layer','table','carousel','element' ], function() {
			var layer = layui.layer //弹层
			, table = layui.table //表格
			, carousel = layui.carousel //轮播
			, element = layui.element; //元素操作

			//监听Tab切换
			element.on('tab(demo)', function(data) {
			});

			//监听工具条
			table.on('tool(demo)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
				, layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'detail') {
					layer.msg('查看操作');
				} else if (layEvent === 'del') {
					layer.confirm('真的删除行么', function(index) {
						obj.del(); //删除对应行（tr）的DOM结构
						layer.close(index);
						//向服务端发送删除指令
					});
				} else if (layEvent === 'edit') {
					layer.msg('编辑操作');
				}
			});

			//执行一个轮播实例
			carousel.render({
				elem : '#banner',
				width : '100%' //设置容器宽度
				,
				height : 570,
				anim : 'fade' //切换动画方式
			});
		});
		function jump(){
			window.location = "/support/sys/redirect.do";
		}
	</script>
</body>
</html>