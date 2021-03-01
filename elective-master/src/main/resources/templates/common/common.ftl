<#macro html import="body">
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
      <#--    <title>基于 Web 的学生选课管理系统</title>-->
		<link rel="icon" type="image/ico" href="/static/img/logo.png" />
		<link rel="stylesheet" href="/static/layui/css/layui.css">
		<script src="/static/js/jquery-3.5.1.js"></script>
		<script src="/static/js/axios.min.js"></script>
	</head>
	<#if import == "body">
		<body class="layui-layout-body">
      <#nested />
		</body>
		<#else>
			<body>
        <#nested />
			</body>
	</#if>
	</html>
</#macro>

<#macro js import="layui">
    <#if import??>
        <#list  import?split(",") as lib>
            <#switch lib>
                <#case "layui">
									<script src="/static/layui/layui.js"></script>
                    <#break />
                <#case "md5">
									<script src="/static/js/md5.js"></script>
                    <#break />
                <#default>
            </#switch>
        </#list>
    </#if>
    <#nested />
</#macro>

<#-- 刷新验证码 -->
<#macro refreshCode>
	<script>
    $(document).on('click', '#changeImg', function(){
      let img = document.getElementById("img");
      let now = document.getElementById("now");
      axios({
        method: 'post',
          url: "/getCodeImg"
      })
        .then(function (response) {
          img.src = response.data.img;
          now.value = response.data.now;
        })
      });
	</script>
</#macro>


<#--<#macro html1 import="layui">-->
<#--    <!DOCTYPE html>-->
<#--    <html>-->
<#--    <head>-->
<#--        <meta charset="utf-8">-->
<#--        <title>基于 Web 的学生选课系统</title>-->
<#--        <script type="text/javascript">-->
<#--            var base = "127.0.0.1:8888";-->
<#--        </script>-->
<#--        <#if import??>-->
<#--            <#list import?split(",") as lib>-->
<#--                <#switch lib>-->
<#--                    <#case "common">-->
<#--                        <@style path="webjars/gtmap/css/new-common.css?v=${.now?time}"/>-->
<#--                        <#break />-->
<#--                    <#case "layui">-->
<#--                        <@style path="webjars/lib/layui/css/layui.css?v=2.0.3"/>-->
<#--                        <@style path="webjars/gtmap/font/iconfont.css?v=2.0.3"/>-->
<#--                        <@style path="webjars/gtmap/css/form-table.css?v=2.0.3"/>-->
<#--                        <@style path="webjars/lib/module/layer/blue/layer.css?v=2.0.7"/>-->
<#--                        <@style path="static/css/public.css?v=1.0.0"/>-->
<#--                        <!-- 让IE8/9支持媒体查询，从而兼容栅格 &ndash;&gt;-->
<#--                        <!--[if lt IE 9]>-->
<#--                        <@script path="webjars/gtmap/js/html5.min.js"/>-->
<#--                        <@script path="webjars/gtmap/js/respond.min.js"/>-->
<#--                        <![endif]&ndash;&gt;-->
<#--                        <@script path="static/js/jquery/jquery.min.js?v=1.0.0"/>-->
<#--                        <@script path="webjars/lib/layui/layui.js?v=2.0.3"/>-->
<#--                        <@script path="webjars/gtmap/js/screen.js?v=2.0.3"/>-->
<#--                        <@script path="static/js/gtmap-common.min.js?v=1.0.0"/>-->
<#--                        <#break />-->
<#--                    <#case "public">-->
<#--                        <@style path="webjars/gtmap/css/new-public.css?v=${.now?time}"></@style>-->
<#--                        <@script path="static/js/public-data.js?v=${.now?time}"></@script>-->
<#--                        <@style path="static/css/gtmap-public.css?v=${.now?time}"></@style>-->
<#--                        <#break />-->

<#--                    <#default>-->
<#--                </#switch>-->
<#--            </#list>-->
<#--        </#if>-->
<#--    </head>-->
<#--    <body class="gtmap greenStyle">-->
<#--    <#nested />-->
<#--    </body>-->
<#--    </html>-->
<#--</#macro>-->

<#--<#macro script path>-->
<#--    <script src="${base!}/${path}" type="text/javascript"></script>-->
<#--</#macro>-->

<#--<#macro style path>-->
<#--    <link href="${base!}/${path}" type="text/css" rel="stylesheet"/>-->
<#--</#macro>-->

<#--<#macro required>-->
<#--    <span style="color:red;">*</span>-->
<#--</#macro>-->

<#--&lt;#&ndash;工具栏&ndash;&gt;-->
<#--<#macro toolbar show="save,print">-->
<#--    <#if show??>-->
<#--        <div class="gt-toolbar">-->
<#--            <#list show?split(",") as lib>-->
<#--                <#switch lib>-->
<#--                    <#case "save">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="save">-->
<#--                            <i class="iconfont icon-save"></i> 保 存-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "print">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="print">-->
<#--                            <i class="iconfont icon-printer"></i> 打 印-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "add">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="add">-->
<#--                            <i class="layui-icon layui-icon-add-1"></i> 新 增-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "edit">-->
<#--                        <button class="layui-btn layui-btn-sm " type="button" id="edit">-->
<#--                            <i class="layui-icon layui-icon-edit"></i> 修 改-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "delete">-->
<#--                        <button class="layui-btn layui-btn-danger layui-btn-sm" type="button" id="delete">-->
<#--                            <i class="layui-icon layui-icon-delete"></i> 删 除-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "upload">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="upload">-->
<#--                            <i class="iconfont icon-cloud-upload"></i> 上 传-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "download">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="download">-->
<#--                            <i class="iconfont icon-cloud-download"></i> 下 载-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "guidang">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="guidang">-->
<#--                            <i class="iconfont icon-guidang"></i> 归 档-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "search">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="search">-->
<#--                            <i class="iconfont icon-search"></i> 搜 索-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "send">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="send">-->
<#--                            <i class="iconfont icon-wj-fswj"></i> 发 送-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "retrieve">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="retrieve">-->
<#--                            <i class="iconfont icon-wj-shwj"></i> 取 回-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "return">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="return">-->
<#--                            <i class="iconfont icon-wj-thwj"></i> 退 回-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "banjie">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="banjie">-->
<#--                            <i class="iconfont icon-wj-wjtg"></i> 办 结-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "close">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="close">-->
<#--                            <i class="iconfont icon-guanbi"></i> 关 闭-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "priority">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="priority">-->
<#--                            <i class="iconfont icon-zu"></i> 优 先-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "guaqi">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="guaqi">-->
<#--                            <i class="iconfont icon-guaqi"></i> 挂 起-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "activate">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="activate">-->
<#--                            <i class="iconfont icon-activation"></i> 激 活-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#case "lock">-->
<#--                        <button class="layui-btn layui-btn-sm" type="button" id="lock">-->
<#--                            <i class="iconfont icon-lock"></i> 锁 定-->
<#--                        </button>-->
<#--                        <#break />-->
<#--                    <#default>-->
<#--                </#switch>-->
<#--            </#list>-->
<#--            <#nested/>-->
<#--        </div>-->
<#--    </#if>-->
<#--</#macro>-->

<#--&lt;#&ndash;表单标题&ndash;&gt;-->
<#--<#macro title value="" unit="">-->
<#--    <div class="gt-table-header">-->
<#--        <div class="gt-table-title">${value}</div>-->
<#--        <div class="gt-table-subtitle">${unit}</div>-->
<#--    </div>-->
<#--</#macro>-->

<#--<!-- 下拉框 &ndash;&gt;-->
<#--<#macro select name="" dataList=[] init="">-->
<#--    <select class="layui-select-sm" name="${name!}">-->
<#--        <option value=""></option>-->
<#--        <#if dataList?? && (dataList?size > 0)>-->
<#--            <#list dataList as list>-->
<#--                <option value="${list.dm!}" <#if list.dm! == init!>selected</#if>>${list.mc!}</option>-->
<#--            </#list>-->
<#--        </#if>-->
<#--    </select>-->
<#--</#macro>-->

<#--<!-- 输入框 &ndash;&gt;-->
<#--<#macro input name="" value="" class="">-->
<#--    <input type="text" class="layui-input layui-input-sm ${class!}" name="${name!}" value="${value!}"-->
<#--           autocomplete="off"/>-->
<#--</#macro>-->

<#--<!-- 筛选条件 &ndash;&gt;-->
<#--<#macro search id="search">-->
<#--    <form class="layui-search-form layui-form layui-row">-->
<#--        <div class="layui-search-btn">-->
<#--            <button class="layui-btn layui-btn-sm" type="button" id="${id!}">-->
<#--                <i class="iconfont icon-search"></i> 搜 索-->
<#--            </button>-->
<#--        </div>-->
<#--        <div class="layui-search">-->
<#--            <#nested/>-->
<#--        </div>-->
<#--    </form>-->
<#--    <div class="menu-more" data-flag="down">显示更多筛选条件</div>-->
<#--</#macro>-->

<#--<!-- 筛选条件项 &ndash;&gt;-->
<#--<#macro searchInput label="">-->
<#--    <div class="layui-col-sm4">-->
<#--        <label class="layui-form-label layui-form-label-sm">${label!}</label>-->
<#--        <div class="layui-input-block">-->
<#--            <#nested/>-->
<#--        </div>-->
<#--    </div>-->
<#--</#macro>-->

<#--<!-- 更多筛选条件 &ndash;&gt;-->
<#--<#macro searchMore>-->
<#--    <div class="layui-search-more">-->
<#--        <#nested/>-->
<#--    </div>-->
<#--</#macro>-->

<#--<!-- 筛选容器 &ndash;&gt;-->
<#--<#macro filter>-->
<#--    <!------------------------------筛选容器-------------------------------&ndash;&gt;-->
<#--    <form class="layui-form layui-row sort-container">-->
<#--        <!------------------------------筛选头部已选择-------------------------------&ndash;&gt;-->
<#--        <div class="sort-top layui-clear">-->
<#--            <div class="sort-selectedName">-->
<#--                <span class="have-selected">已选择条件：</span>-->
<#--                <div class="sort-select"></div>-->
<#--            </div>-->
<#--            <div class="right-opt">-->
<#--                <div class="layui-btn layui-btn-xs layui-btn-border layui-btn-primary filter-control">-->
<#--                    <i class="iconfont icon-up"></i><span>收起筛选条件</span>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--        <!------------------------------筛选条件-------------------------------&ndash;&gt;-->
<#--        <div class="layui-clear sort-bottom" style="height: auto">-->
<#--            <#nested/>-->
<#--        </div>-->
<#--        <!------------------------------筛选条件 end-------------------------------&ndash;&gt;-->
<#--    </form>-->
<#--    <!------------------------------筛选容器end-------------------------------&ndash;&gt;-->
<#--</#macro>-->

<#--<!-- 单选 &ndash;&gt;-->
<#--<#macro filterRadio name="" label="" dataList=[]>-->
<#--    <div class="gt-filter gt-radio">-->
<#--        <input type="hidden" name="${name!}">-->
<#--        <div class="gt-filter-item">-->
<#--            <div class="left-category">${label!}</div>-->
<#--            <div class="mid-cnt">-->
<#--                <#if dataList?? && (dataList?size > 0)>-->
<#--                    <#list dataList as data>-->
<#--                        <div data-id="${data.dm!}" filter-name="${name!}"><span>${data.mc!}</span></div>-->
<#--                    </#list>-->
<#--                </#if>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->
<#--</#macro>-->

<#--<!-- 多选 &ndash;&gt;-->
<#--<#macro filterCheckbox name="" label="" dataList=[]>-->
<#--    <div class="gt-filter gt-checkbox">-->
<#--        <input type="hidden" name="${name!}">-->
<#--        <div class="gt-filter-item">-->
<#--            <div class="left-category">${label!}</div>-->
<#--            <div class="mid-cnt">-->
<#--                <div class="allchecked"><span>全部</span></div>-->
<#--                <#if dataList?? && (dataList?size > 0)>-->
<#--                    <#list dataList as data>-->
<#--                        <div data-id="${data.dm!}" filter-name="${name!}"><span>${data.mc!}</span></div>-->
<#--                    </#list>-->
<#--                </#if>-->
<#--            </div>-->
<#--            <button type="button" class="layui-btn layui-btn-primary layui-btn-border layui-btn-xs gt-filter-item-opt"-->
<#--                    data-flag="up">-->
<#--                <i class="iconfont icon-up"></i>-->
<#--            </button>-->
<#--        </div>-->
<#--    </div>-->
<#--</#macro>-->
