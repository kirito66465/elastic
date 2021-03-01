<@html>
	<div class="layui-container">
		<form class="layui-form" lay-filter="loginForm">

			<input hidden name="now" value="${now!}" id="now">
			<div class="layui-row">
				<div class="layui-form-item layui-col-md6">
					<label class="layui-form-label">用户登录</label>
					<label class="layui-form-label">/</label>
					<label class="layui-form-label">Login</label>
					<label class="layui-form-label">
						<a href="/register-input">学生注册</a>
					</label>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-form-item">
					<div class="layui-col-md2">
						<label class="layui-form-label">用户名</label>
					</div>
					<div class="layui-col-md3">
						<div class="layui-input-block">
							<input type="text" name="card" placeholder="用户名" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-form-item">
					<div class="layui-col-md2">
						<label class="layui-form-label">密  码</label>
					</div>
					<div class="layui-col-md3">
						<div class="layui-input-block">
							<input type="password" name="password" placeholder="密  码" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-form-item">
					<div class="layui-col-md2">
						<label class="layui-form-label">验证码</label>
					</div>
					<div class="layui-col-md2">
						<div class="layui-input-block">
							<input type="text" name="checkCode" placeholder="验证码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-col-md2">
						<img src="${img!}" id="img">
					</div>
					<div class="layui-col-md2">
						<a href="javascript:void(0);" id="changeImg">看不清，换一张</a>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<input type="radio" name="identity" value="stu" title="学生" checked>
						<input type="radio" name="identity" value="tea" title="老师">
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<div class="layui-col-md1">
							<button class="layui-btn" lay-submit lay-filter="login">登录</button>
						</div>
						<div class="layui-col-md1">
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

  <@js import="layui,md5">
	  <script>
      layui.use('form', function(){
        let form = layui.form;
        form.render();

        form.on('radio(filter)', function(data){
          console.log(data.elem);
          console.log(data.value);
        });
        form.on('submit(login)', function(data){
          /**
           * 取表单数据，键值对形式：{name: value}
           * var formData = form.val("loginForm");
           * var formData = data.field;
           */
          layer.load(2)
          let field = data.field
          let param = new URLSearchParams()
          let password = hex_md5(field.password)
          param.append("card", field.card)
          param.append("password", password)
          param.append("now", field.now)
          param.append("checkCode", field.checkCode)
          param.append("identity", field.identity)
          axios({
            method: 'post',
            url: "/login",
            data: param
          })
            .then(function (response) {
              if (response.data === "验证码输入错误！") {
                alert("验证码输入错误！")
              } else if (response.data === "fail") {
                alert("用户名或密码输入错误！")
              } else if (response.data === 'transactional') {
                alert("事务异常！")
              } else {
                if (field.identity === 'stu') {
                  location.href = "/stu/home";
                } else if (field.identity === 'tea') {
                  location.href = "/tea/home";
                }
              }
            })
          return false;
        });
      });
	  </script>
  </@js>
	<#-- 刷新验证码 -->
  <@refreshCode />
</@html>