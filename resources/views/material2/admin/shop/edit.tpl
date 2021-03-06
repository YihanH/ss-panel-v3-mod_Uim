{include file='admin-head.tpl'}

<div class="layui-body admin-shop admin-shop-edit">
<div class="layadmin-tabsbody-item layui-show">
<div class="layui-container">

	<!--title-->
	<h1 class="site-h1">编辑套餐</h1>

	<!--content-->
    <form id="edit_form">
	<div class="layui-row layui-col-space20">
		
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">套餐内容<span>（* 为必填项）</span></div>
                <div class="layui-card-body">

                    <div class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label class="layui-form-label">套餐名称*</label>
                            <div class="layui-input-inline">
                                <input type="text" id="name" class="layui-input" value="{$shop->name}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">套餐价格(元)*</label>
                            <div class="layui-input-inline">
                                <input type="number" id="price" class="layui-input" value="{$shop->price}">
                            </div>
                        </div>                        
                        <div class="layui-form-item">
                            <label class="layui-form-label">套餐流量(G)*</label>
                            <div class="layui-input-inline">
                                <input type="number" id="bandwidth" class="layui-input" value="{$shop->bandwidth()}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">自动重置</label>
                            <div class="layui-input-block layui-word-aux">
                                <input type="checkbox" lay-skin="switch" lay-text="开启|关闭" id="auto_reset_bandwidth" {if $shop->auto_reset_bandwidth==1}checked{/if}>
                                &nbsp;&nbsp;&nbsp;续费时自动重置流量为上面的值
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">自动续订(天)</label>
                            <div class="layui-input-inline">
                                <input type="number" id="auto_renew" class="layui-input" value="{$shop->auto_renew}">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                0为不允许自动续订，其他数字为那么多天之后就会自动从用户的账户上划钱抵扣
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">用户设置</div>
                <div class="layui-card-body">
                    
                    <div class="layui-form layui-form-pane">
                      <div class="layui-form-item">
                        <label class="layui-form-label">用户有效期*</label>
                        <div class="layui-input-inline">
                          <input type="number" id="expire" class="layui-input" value="{$shop->expire()}">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            保留用户多少天不被删除，0为不删除
                        </div>
                      </div>                       
                    </div>

                </div>
            </div>
        </div>

        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">用户等级设置</div>
                <div class="layui-card-body">
                    
                    <div class="layui-form layui-form-pane">
                       <div class="layui-form-item">
                        <label class="layui-form-label">用户等级*</label>
                        <div class="layui-input-inline">
                          <input type="number" id="class" class="layui-input" value="{$shop->user_class()}">
                        </div>
                         <div class="layui-form-mid layui-word-aux">
                            等级对应，可以查看节点的等级
                        </div>
                      </div>
                      <div class="layui-form-item">
                        <label class="layui-form-label">用户等级有效期*</label>
                        <div class="layui-input-inline">
                          <input type="number" id="class_expire" class="layui-input" value="{$shop->class_expire()}">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            保留用户等级多少天不过期，0为不限制
                        </div>
                      </div>                      
                    </div>

                </div>
            </div>
        </div>

         <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">使用限制</div>
                <div class="layui-card-body">
                    <div class="layui-form layui-form-pane">
                       <div class="layui-form-item">
                        <label class="layui-form-label">速度限制</label>
                        <div class="layui-input-inline">
                          <input type="number" id="speedlimit" class="layui-input" value="{$shop->speedlimit()}">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            （Mbps）0为不限制
                        </div>
                      </div>
                      <div class="layui-form-item">
                        <label class="layui-form-label">设备限制</label>
                        <div class="layui-input-inline">
                          <input type="number" id="connector" class="layui-input" value="{$shop->connector()}">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            （个）0为不限制
                        </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
        

		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">周期设置</div>
				<div class="layui-card-body">
					
					<div class="layui-form layui-form-pane">					   
					   <div class="layui-form-item">
					    <label class="layui-form-label">套餐总天数</label>
					    <div class="layui-input-inline">
					      <input type="number" id="reset_exp" class="layui-input" value="{$shop->reset_exp()}">
					    </div>
					    <div class="layui-form-mid layui-word-aux">
                           套餐整个周期，没有特别要求，默认0
                        </div>	
					  </div>
					   <div class="layui-form-item">
					    <label class="layui-form-label">每多少天</label>
					    <div class="layui-input-inline">
					      <input type="number" id="reset" class="layui-input" value="{$shop->reset()}">
					    </div>
					    <div class="layui-form-mid layui-word-aux">
                           套餐循环周期，没有特别要求，默认0
                        </div>
					  </div>
					   <div class="layui-form-item">
					    <label class="layui-form-label">重置流量为多少G</label>
					    <div class="layui-input-inline">
					      <input type="number" id="reset_value" class="layui-input" value="{$shop->reset_value()}">
					    </div>
					    <div class="layui-form-mid layui-word-aux">
                           没有特别要求，默认0
                        </div>
					  </div>
					</div>

				</div>
			</div>
		</div>

        <div class="layui-col-md12 tac">
            <button id="editsubmit" type="submit" class="layui-btn"><i class="icon ptfont pticon-editupdatepencil"></i> 提交修改</button>
            <a class="layui-btn layui-btn-primary" href="javascript:history.go(-1);">返回</a>
        </div>
		
    </div>
    </form>
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

	$('#edit_form').validate({
        rules: {
          name: {required: true},
          price: {required: true}
        },

        submitHandler: function() {

			if(document.getElementById('auto_reset_bandwidth').checked)
			{
				var auto_reset_bandwidth=1;
			}
			else
			{
				var auto_reset_bandwidth=0;
			}{/literal}

            $.ajax({
                type: "PUT",
                url: "/admin/shop/{$shop->id}",
                dataType: "json",
                data: {
                    name: $("#name").val(),
					auto_reset_bandwidth: auto_reset_bandwidth,
                    price: $("#price").val(),
                    auto_renew: $("#auto_renew").val(),
                    bandwidth: $("#bandwidth").val(),
                    speedlimit: $("#speedlimit").val(),
                    connector: $("#connector").val(),
                    expire: $("#expire").val(),
                    class: $("#class").val(),
					class_expire: $("#class_expire").val(),
					reset: $("#reset").val(),
					reset_value: $("#reset_value").val(),
					reset_exp: $("#reset_exp").val()
                },
                success: function (data) {
                    if (data.ret) {
                        {literal}
                        layer.msg(data.msg, {icon: 6}); 
                        {/literal}
                        window.setTimeout("location.href='/admin/shop'",1800);
                    } else {
                        layer.msg(data.msg);
                    }
                },
                error: function (jqXHR) {
                    layer.msg("发生错误");
                }
            });
        }

	});
})
</script>