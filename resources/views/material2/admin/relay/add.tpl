{include file='admin-head.tpl'}

<div class="layui-body admin-relay admin-relay-add">
<div class="layadmin-tabsbody-item layui-show">
<div class="layui-container">

	<!--title-->
	<h1 class="site-h1">添加中转规则</h1>

	<!--content-->
	<div class="layui-row layui-col-space20">

		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">添加中转规则</div>
				<div class="layui-card-body">

					<form id="add_form">
					
					<div class="layui-form layui-form-pane">
					  <div class="layui-form-item">
					    <label class="layui-form-label">起源节点</label>
					    <div class="layui-input-block">
						    <select id="source_node" name="source_node" class="layui-select">
								<option value="0">请选择起源节点</option>
								{foreach $source_nodes as $source_node}
									<option value="{$source_node->id}">{$source_node->name}</option>
								{/foreach}
							</select>
					    </div>
					  </div>
					  <div class="layui-form-item">
					    <label class="layui-form-label">目标节点</label>
					    <div class="layui-input-block">
					      <select id="dist_node" name="dist_node" class="layui-select">
							<option value="-1">不进行中转</option>
							{foreach $dist_nodes as $dist_node}
								<option value="{$dist_node->id}">{$dist_node->name}</option>
							{/foreach}
						  </select>
					    </div>
					  </div>
					  <div class="layui-form-item">
					    <label class="layui-form-label">端口</label>
					    <div class="layui-input-inline">
					      <input id="port" name="port" type="text" value="0" class="layui-input" required>
					    </div>
					  </div>
					  <div class="layui-form-item">
					    <label class="layui-form-label">优先级</label>
					    <div class="layui-input-inline">
					      <input id="priority" name="priority" type="text" value="0" class="layui-input" required>
					    </div>
					  </div>
					  <div class="layui-form-item">
					    <label class="layui-form-label">用户ID</label>
					    <div class="layui-input-inline">
					      <input id="user_id" name="user_id" type="text" value="0" class="layui-input" required>
					    </div>
					  </div>
					  <div class="layui-form-item">
					    <div class="layui-input-block">
					      <button id="submit" type="submit" class="layui-btn"><i class="icon ptfont pticon-addnewbuttonpl"></i> 立即添加</button>
					      <a class="layui-btn layui-btn-primary" href="javascript:history.go(-1);">返回</a>
					    </div>
					  </div>
					</div>

					</form>

				</div>
			</div>
		</div>

    </div>
	<!--content:end-->

</div>
</div>
</div>

{include file='admin-foot.tpl'}

{literal}
<script>
require(['jquery','validate'], function($,validate){
	jQuery.extend(jQuery.validator.messages, {  
        required: "必填内容"
	});
	$('#add_form').validate({
		rules: {
			priority: {required: true},
			port: {required: true},
			user_id: {required: true}
		},

		submitHandler: function() {
			$.ajax({

				type: "POST",
				url: "/admin/relay",
				dataType: "json",
				{/literal}
				data: {
						source_node: $("#source_node").val(),
						dist_node: $("#dist_node").val(),
						port: $("#port").val(),
						user_id: $("#user_id").val(),
						priority: $("#priority").val()
				{literal}
					},
					success: function (data) {
						if (data.ret) {
						layer.msg(data.msg, {icon: 6});
									{/literal}
						window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
									{literal}
						} else {
						layer.msg(data.msg); 
						}
					},
					error: function (jqXHR) {
						layer.msg(data.msg+"  发生错误了。"); 
					}
					});
				}
		});
})
</script>
{/literal}