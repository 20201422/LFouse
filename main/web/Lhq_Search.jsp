<%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2022-06-23
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LFouse-找回密码</title>
</head>
<body>
<div style="text-align: center" width="300px" height="200px">
    <form action="Lhq_SearchServlet" method="post">


        <input type="email" name="email" id="email" width="100px"
               height="60px" style="margin-top: 100px" placeholder="请输入您的邮箱地址"
               required> <br>
        <br>

        <button type="submit" class="btn btn-success" id="button1"
                width="100px" height="60px">找回密码</button>
    </form>
    <br>
    <br>

    <button type="button" class="btn btn-primary" id="button"
            onclick="backLogin()" width="100px" height="60px">返回登录页面</button>
</div>
<script type="text/javascript">
    function backLogin() {
        window.location.href = "Lhq_Login.jsp"
    }
</script>
</body>
</html>
