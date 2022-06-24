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
    <link rel="stylesheet" type="text/css" href="CSS/Tong_Search.css"/>
    <title>LFouse-找回密码</title>
</head>
<body>
<div class="wrap">
    <div class="head_color">  通过邮箱找回密码</div>
    <form action="Lhq_SearchServlet" method="post" class="find_password">
        <div class="mailbox">
            <span>邮箱 :</span>
            <input type="email" class="mail_code" name="email" id="email" width="100px"
                   height="60px" placeholder="请输入您的邮箱地址"
                   required>

        </div>
        <p>
            <button type="submit" class="btn-success" id="button1"
                    width="100px" height="60px">找回密码
            </button>
        </p>

        <p>
            <a class="back_login"
               href="Lhq_Login.jsp">返回登录页面</a>
<%--            <button type="button" class="btn btn-primary" id="button"--%>
<%--                    onclick="backLogin()" width="100px" height="60px">返回登录页面--%>
<%--            </button>--%>
        </p>
    </form>


</div>
<%--<script type="text/javascript">--%>
<%--    function backLogin() {--%>
<%--        window.location.href = "Lhq_Login.jsp"--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
