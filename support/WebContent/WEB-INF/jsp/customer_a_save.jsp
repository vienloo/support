<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>信息管理系统</title>
<link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
<script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/res/jquery-1.11.0.min.js"></script>
</head>
<body>
	<form class="layui-form">
		<fieldset>
			<legend>业主信息</legend>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">栋座:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">单元:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">门牌:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">楼层:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">总楼层:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">姓名:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">固话:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">手机:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">公/私:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">所属经纪人:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>楼盘信息</legend>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">楼盘名称:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 200px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">区县</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">片区</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 150px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">地址</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 200px">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">用途:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">类型:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">结构:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">产权:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">开发商:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">房源类型:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">物业费:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>房源信息</legend>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">状态:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">房型</label>
					<div class="layui-input-inline">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
					<div class="layui-form-mid layui-word-aux" style="float: left;">室</div>	
					<div class="layui-input-inline">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
					<div class="layui-form-mid layui-word-aux" style="float: left;">厅</div>	
					<div class="layui-input-inline">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
					<div class="layui-form-mid layui-word-aux" style="float: left;">卫</div>	
					<div class="layui-input-inline">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
					<div class="layui-form-mid layui-word-aux" style="float: left;">厨</div>	
					<div class="layui-input-inline">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
					<div class="layui-form-mid layui-word-aux" style="float: left;">阳台</div>	
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">用途:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">类型:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">结构:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">产权:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">开发商:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">房源类型:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">物业费:</label>
					<div class="layui-input-block">
						<input type="text" name="" placeholder="请输入" autocomplete="off"
								class="layui-input" style="width: 100px">
					</div>
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>房屋设施</legend>
			<div class="layui-form-item">
				<div class="layui-input-block">
     				<input type="checkbox" name="1" title="水" lay-skin="primary">
					<input type="checkbox" name="1" title="电" lay-skin="primary"> 
					<input type="checkbox" name="1" title="天然气" lay-skin="primary"> 
					<input type="checkbox" name="1" title="暖气" lay-skin="primary">
					<input type="checkbox" name="1" title="电视" lay-skin="primary"> 
					<input type="checkbox" name="1" title="电话" lay-skin="primary"> 
					<input type="checkbox" name="1" title="空调" lay-skin="primary">
					<input type="checkbox" name="1" title="床" lay-skin="primary"> 
					<input type="checkbox" name="1" title="电风扇" lay-skin="primary"> 
					<input type="checkbox" name="1" title="太阳能" lay-skin="primary">
					<input type="checkbox" name="1" title="洗衣机" lay-skin="primary"> 
					<input type="checkbox" name="1" title="热水器" lay-skin="primary"> 
					<input type="checkbox" name="1" title="煤气灶" lay-skin="primary">
					<input type="checkbox" name="1" title="抽油烟机" lay-skin="primary"> 
					<input type="checkbox" name="1" title="冰箱" lay-skin="primary"> 
					<input type="checkbox" name="1" title="微波炉" lay-skin="primary">
					<input type="checkbox" name="1" title="衣柜" lay-skin="primary"> 
					<input type="checkbox" name="1" title="书柜" lay-skin="primary"> 
					<input type="checkbox" name="1" title="橱柜" lay-skin="primary">
					<input type="checkbox" name="1" title="沙发" lay-skin="primary"> 
					<input type="checkbox" name="1" title="茶几" lay-skin="primary"> 
					<input type="checkbox" name="1" title="宽带" lay-skin="primary">
					<input type="checkbox" name="1" title="电梯" lay-skin="primary"> 
					<input type="checkbox" name="1" title="停车位" lay-skin="primary">
					<input type="checkbox" name="1" title="煤气" lay-skin="primary"> 
					<input type="checkbox" name="1" title="储藏室" lay-skin="primary">
					<input type="checkbox" name="1" title="地下室" lay-skin="primary"> 
					<input type="checkbox" name="1" title="车库" lay-skin="primary"> 
   				</div>
  			</div>
		</fieldset>
		<fieldset>
			<legend>图片（最多10张）</legend>
			
		</fieldset>
		<fieldset>
			<legend>周边情况</legend>
			<div class="layui-form-item">
				<div class="layui-input-block">
     				<input type="checkbox" name="1" title="法院" lay-skin="primary">
					<input type="checkbox" name="1" title="火车站" lay-skin="primary"> 
					<input type="checkbox" name="1" title="医院" lay-skin="primary"> 
					<input type="checkbox" name="1" title="银行" lay-skin="primary">
					<input type="checkbox" name="1" title="小学" lay-skin="primary"> 
					<input type="checkbox" name="1" title="中学" lay-skin="primary"> 
					<input type="checkbox" name="1" title="邮电局" lay-skin="primary">
					<input type="checkbox" name="1" title="图书馆" lay-skin="primary"> 
					<input type="checkbox" name="1" title="超市" lay-skin="primary"> 
					<input type="checkbox" name="1" title="公园" lay-skin="primary">
					<input type="checkbox" name="1" title="停车场" lay-skin="primary"> 
					<input type="checkbox" name="1" title="健身房" lay-skin="primary"> 
					<input type="checkbox" name="1" title="菜市场" lay-skin="primary">
					<input type="checkbox" name="1" title="商场" lay-skin="primary"> 
					<input type="checkbox" name="1" title="体育场" lay-skin="primary"> 
					<input type="checkbox" name="1" title="幼儿园" lay-skin="primary">
					<input type="checkbox" name="1" title="地铁" lay-skin="primary"> 
					<input type="checkbox" name="1" title="汽车站" lay-skin="primary"> 
					<input type="checkbox" name="1" title="游泳池" lay-skin="primary">
   				</div>
  			</div>
		</fieldset>
		<fieldset>
			<legend>周边交通</legend>
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">请填写描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
			    </div>
			 </div>
		</fieldset>
		<fieldset>
			<legend>公开备注</legend>
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">请填写描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
			    </div>
			 </div>
		</fieldset>
		<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	</form>
</body>
<script type="text/javascript">
	layui.use('form', function(){
		var form = layui.form;
		form.render();
	  //各种基于事件的操作，下面会有进一步介绍
	});
</script>
</html>