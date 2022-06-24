<%--
  Created by IntelliJ IDEA.
  User: coopskywalker
  Date: 2022/6/21
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css"/>
    <link rel="stylesheet" type="text/css" href="CSS/Lhq_Login.css"/>
    <title>LFouse-登录</title>
</head>
<script type="text/javascript" language="JavaScript" src="Script/Lhq_PwdShowAndHide.js"></script>
<body>

<header>
    <div class="header">
        <img src="Image/logo.jpg" title="" alt="logo" class="logo" onclick="window.location.href='index.jsp'">
        <img src="Image/name.jpg" title="" alt="LFouse" class="name" onclick="window.location.href='index.jsp'">
        <span class="header_name">提供最好的租房服务</span>
        <div class="head_welcome">
            <br>
            <div class="ts">现在租房或者出租，享受免押金、免定金、免息分期等服务。</div>
        </div>
    </div>
</header>
<div style="background-color: transparent;width: 100%;height: 14%">

</div>
<div class="card">
    <div class="login">
        <div class="errorMsg">
            <%
                String errorMsg = (String) request.getAttribute("errorMsg");
                String flg = request.getParameter("flg");
                String showway=request.getParameter("showway");
                String h_id=request.getParameter("h_id");
                if (errorMsg != null) {
            %>
            <span><%=errorMsg%></span>
            <%}%>
        </div>
        <form method="post" id="menu" name="menu" action="Lhq_LoginServlet?flg=<%=flg%>&showway=<%=showway%>&h_id=<%=h_id%>">
            <div>
                <span>账号：</span>
                <input type="text" class="account" name="account" placeholder="请输入账号">

            </div>

            <div><span>密码：</span>
                <input type="password" id="password" name="password" class="password" placeholder="请输入密码">
                <img class="eyes" id="eyes" alt="" src="Image/hide.jpg" onclick="change()">
            </div>
            <div class="left-right"><a href="Lhq_Register.jsp" class="left">注册</a> <a class="right" href="Lhq_Search.jsp">忘记密码?</a>
            </div>
            <br>
            <div class="login-button"><input type="submit" value="登录"></div>
        </form>
    </div>
</div>
<div style="background-color: transparent;width: 100%;height: 20%">

</div>

<footer>
    <hr>
    <div class="footer-help">
        需要更多帮助？致电 400-820-8820。
    </div>
    <div class="footer">
        <p>LFouse采用符合业界标准的加密技术对您提交的信息进行保密。</p>
        <hr>
        Copyrite ©️ 2022 202014-4 lnc.保留所有权利<br>
        京IPC备202014-4 营业执照 无线电发射设备销售备案编号11201910351200
    </div>
</footer>

</body>
</html>
