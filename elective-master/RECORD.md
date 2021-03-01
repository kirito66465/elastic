# 过程记录

## 进度记录
- 2021-02-01(1): 完成项目初步搭建，添加实体类、枚举类，引入 Freemarker 成功；
- 2021-02-01(2): 添加学生相关 SQL 语句；解决 Freemarker 宏定义引入静态资源问题；
- 2021-02-08(1): 完成用户登录逻辑与视图页面；完成验证码加载与刷新；使用 axios 进行请求；
- 2021-02-08(2): 添加 aorus 虚拟机的 MySQL 与 Redis 配置；
- 2021-02-09(1): 完成注册逻辑与页面，实现下拉框联动；初始化首页；
- 2021-02-18(1): 完成布局设计；

## 问题记录
- 2021-02-01(1)：Freemarker 宏定义引入静态资源失败；
> 解决：配置 spring.mvc.static-path-pattern。
```yaml
spring: 
  mvc: 
    static-path-pattern: /static/**
```
- 2021-02-01(2): Session 存放 Token：；
> 解决：使用 HttpServletRequest。
```java
request.getSession().setAttribute("token", token);
```
- 2021-02-08(1)：layui 表单组件显示不全；
> 解决：宏定义中别忘了`<#nested />`；添加`form.render();`。
- 2021-02-09(1)：下拉框联动，使用 axios 请求 post 可以完成，但是 get 不行；
- 2021-02-09(2)：下拉框选项使用 `<option value="${college.id}">${college.name}</option>`，不能换行，否则会显示空白；
- 2021-02-18(1)：子框架如何切换；