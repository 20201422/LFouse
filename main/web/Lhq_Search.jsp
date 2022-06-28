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
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Tong_Search.css"/>
    <title>LFouse-找回密码</title>
</head>
<body>
<%
    String flg = request.getParameter("flg");
    String showway=request.getParameter("showway");
    String h_id=request.getParameter("h_id");
%>
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
<div class="wrap">
    <%
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String errorMsg = (String) request.getAttribute("errorMsg");
        if (errorMsg != null) {
    %>
    <div class="errorMsg">
        <div style="height: 15%"></div>
        <span style="font-family: 等线 Light;font-size: 19px;margin-left: 27%;"><%=errorMsg%></span>
    </div>
    <%}else{
    %>
    <div class="errorMsg1">
    </div>
    <%
        }%>
    <div align="center"style="height:14%;margin-left: 0%; margin-top: 8%">
        <font style="font-size: 42px;font-family: 等线 Light;color: #0597F2">LFouse 找回密码</font>
    </div>
    <div class="findpwd">
    <form action="Lhq_SearchServlet?flg=<%=flg%>&showway=<%=showway%>&h_id=<%=h_id%>" method="post" class="find_password">
        <div class="mailbox">
            <span>电话 :</span>
            <%if(tel!=null){%>
            <input type="tel" class="mail_code" name="tel" id="tel" width="80px"
                   height="60px" placeholder="请输入您的电话号码" value=<%=tel%>
                   required />
            <%}
            else{%>
            <input type="tel" class="mail_code" name="tel" id="tel" width="80px"
                   height="60px" placeholder="请输入您的电话号码"
                   required />
            <%}%>

        </div>
        <div class="mailbox">
            <span>邮箱 :</span>
            <%if(email!=null){%>
            <input type="email" class="mail_code" name="email" id="email" width="80px"
                   height="60px" placeholder="请输入您的邮箱地址" value=<%=email%>
                   required>
            <%}
            else{%>
            <input type="email" class="mail_code" name="email" id="email" width="80px"
                   height="60px" placeholder="请输入您的邮箱地址"
                   required>
            <%}%>
        </div>
        <p>
        <div class="findpwd-btn">
        <button type="submit" class="btn-success" id="button1">找回密码</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a class="back" href="Lhq_Login.jsp?flg=<%=flg%>&showway=<%=showway%>&h_id=<%=h_id%>">返回</a>
    </div>
        </p>
    </form>
    </div>
</div>

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
