<@html import="body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">layui 后台布局</div>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					<a href="javascript:;">
						<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
						贤心
					</a>
					<dl class="layui-nav-child">
<#--						<a href="javascript:;" data-id="1" data-title="修改密码" data-url="index.php?&a=adminList"-->
<#--						   class="site-demo-active" data-type="tabAdd">修改密码</a>-->
						<dd><a href="">基本资料</a></dd>
						<dd><a href="">修改密码</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item"><a href="javascript:;" id="exitBtn">退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
					<li class="layui-nav-item"><a href="/">返回首页</a></li>
					<li class="layui-nav-item layui-nav-itemed">
						<a href="javascript:;">在线选课</a>
						<dl class="layui-nav-child">
							<dd><a href="javascript:;">专业课</a></dd>
							<dd><a href="javascript:;">通识课</a></dd>
							<dd><a href="javascript:;">体育课</a></dd>
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed">
						<a href="javascript:;">信息维护</a>
						<dl class="layui-nav-child">
							<dd><a href="">个人信息</a></dd>
							<dd><a href="">密码修改</a></dd>
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed">
						<a href="javascript:;">信息查询</a>
						<dl class="layui-nav-child">
							<dd><a href="">成绩查询</a></dd>
							<dd><a href="">选课情况查询</a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">内容主体区域</div>
		</div>

		<!-- tab 标签-->
		<div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="margin-left: 200px;">
			<ul class="layui-tab-title"></ul>
			<div class="layui-tab-content"></div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© layui.com - 底部固定区域
		</div>
	</div>

	<@js import="layui">
		<script>
      // //JavaScript代码区域
      // layui.use('element', function(){
      //   var element = layui.element;
			//
      //   $("#exitBtn").click(function () {
      //   	location.href = "/";
			// 	})
      // });

      layui.use(['element', 'layer', 'jquery'], function () {
        var element = layui.element;
        // var layer = layui.layer;
        var $ = layui.$;
        // 配置 tab 实践在下面无法获取到菜单元素
        $('.site-demo-active').on('click', function () {
          var dataid = $(this);
          // 这时会判断右侧 .layui-tab-title 属性下的有 lay-id 属性的 li 的数目，即已经打开的 tab 项数目
          if ($(".layui-tab-title li[lay-id]").length <= 0) {
            // 如果比零小，则直接打开新的 tab 项
            active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
          } else {
            // 否则判断该 tab 项是否以及存在
            var isData = false; // 初始化一个标志，为 false 说明未打开该 tab 项，为 true 则说明已有
            $.each($(".layui-tab-title li[lay-id]"), function () {
              // 如果点击左侧菜单栏所传入的 id 在右侧 tab 项中的 lay-id 属性可以找到，则说明该 tab 项已经打开
              if ($(this).attr("lay-id") === dataid.attr("data-id")) {
                isData = true;
              }
            })
            if (isData === false) {
              // 标志为 false 新增一个 tab 项
              active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            }
          }
          // 最后不管是否新增 tab，最后都转到要打开的选项页面上
          active.tabChange(dataid.attr("data-id"));
        });

        var active = {
          // 在这里给 active 绑定几项事件，后面可通过 active 调用这些事件
          tabAdd: function (url, id, name) {
            // 新增一个 Tab 项，传入三个参数，分别对应其标题，tab 页面的地址，还有一个规定的 id，是标签中 data-id 的属性值
            // 关于 tabAdd 的方法所传入的参数可看 layui 的开发文档中基础方法部分
            element.tabAdd('demo', {
              title: name,
              content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:99%;"></iframe>',
              id: id // 规定好的 id
            })
            FrameWH();  // 计算 iframe 层的大小
          },
          tabChange: function (id) {
            // 切换到指定 Tab 项
            element.tabChange('demo', id); // 根据传入的 id 传入到指定的 tab 项
          },
          tabDelete: function (id) {
            element.tabDelete("demo", id); // 删除
          }
        };
        function FrameWH() {
          var h = $(window).height();
          $("iframe").css("height", h + "px");
        }
      });
		</script>
	</@js>
</@html>