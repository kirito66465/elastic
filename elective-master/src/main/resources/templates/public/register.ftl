<@html>
	<div class="layui-container">
		<form class="layui-form" lay-filter="loginForm">
			<input hidden name="now" value="${now!}" id="now">
			<div class="layui-row">
				<div class="layui-form-item layui-col-md6">
					<label class="layui-form-label">学生注册</label>
					<label class="layui-form-label">/</label>
					<label class="layui-form-label">Register</label>
					<label class="layui-form-label">
						<a href="/index">登录</a>
					</label>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-form-item">
					<div class="layui-col-md2">
						<label class="layui-form-label">学号</label>
					</div>
					<div class="layui-col-md3">
						<div class="layui-input-block">
							<input type="text" name="card" placeholder="学号" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-form-item">
					<div class="layui-col-md2">
						<label class="layui-form-label">姓名</label>
					</div>
					<div class="layui-col-md3">
						<div class="layui-input-block">
							<input type="text" name="name" placeholder="姓名" autocomplete="off" class="layui-input">
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
						<label class="layui-form-label">学院</label>
					</div>
					<div class="layui-col-md3">
						<div class="layui-input-block">
							<select name="collegeId" lay-verify="required" lay-search lay-filter="selectCollege" id="college">
								<option value=""></option>
								<#if collegeList??>
									<#list collegeList as college>
										<option value="${college.id}">${college.name}</option>
									</#list>
								</#if>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-form-item">
					<div class="layui-col-md2">
						<label class="layui-form-label">班级</label>
					</div>
					<div class="layui-col-md3">
						<div class="layui-input-block">
							<select name="classId" lay-verify="required" lay-search lay-filter="selectClass" id="class">
								<option value=""></option>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<div class="layui-col-md1">
							<button class="layui-btn" lay-submit lay-filter="register">注册</button>
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

        // 下拉框联动
        form.on('select(selectCollege)', function () {
					let collegeId = document.getElementById("college").value;
          console.log(collegeId)
          let param = new URLSearchParams()
	        param.append("collegeId", collegeId)
					axios({
						method: 'post',
						url: '/getClassList',
						data: param
					})
	          .then(function (response) {
              console.log(response.data)
		          let classList = response.data

              $("#class").empty();
              $("#class").append(new Option("", ""));
              for(let i = 0; i < classList.length; i++) {
                $("#class").append("<option value='" + classList[i].id + "'>" + classList[i].name + "</option>");
              }
              form.render("select");
            })
        })

        form.on('submit(register)', function(data){
          layer.load(2)
          let field = data.field
          console.log(field)
          let param = new URLSearchParams()
          let password = hex_md5(field.password)
          param.append("card", field.card)
          param.append("password", password)
          param.append("now", field.now)
          param.append("name", field.name)
          param.append("collegeId", field.collegeId)
          param.append("classId", field.classId)
          axios({
            method: 'post',
            url: "/register",
            data: param
          })
            .then(function (response) {
              if (response.data === "transactional") {
	              alert("事务异常")
              } else {
	              location.href = "/stu/home";
              }
            })
          return false;
        });
      });
	  </script>
  </@js>
</@html>