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
<div class="big">
    <div class="card">
                <%
                    String errorMsg = (String) request.getAttribute("errorMsg");
                    if (errorMsg != null) {
                        %>
                    <div class="errorMsg">
                    <div style="height: 24%"></div>
                        <span style="margin-left:2%;font-family: 等线 Light;font-size: 19px;"><%=errorMsg%></span>
                    </div>
                    <%}else{
                        %>
                            <div class="errorMsg1">
                            </div>
                        <%
                    }%>
                <%
                    String flg = request.getParameter("flg");
                    String showway=request.getParameter("showway");
                    String h_id=request.getParameter("h_id");
                    String account=request.getParameter("account");
                    String password=request.getParameter("password");
                %>
            <div style="height: 5%"></div>
            <form style="height: 50%;width: 100%;" method="post" id="menu" name="menu" action="Lhq_LoginServlet?flg=<%=flg%>&showway=<%=showway%>&h_id=<%=h_id%>">
                <div align="center"style="margin-top: 10%">
                    <font style="font-size: 42px;font-family: 等线 Light">Welcome LFouse</font>
                </div>
                <div style="height: 80%">
                    <%if(account!=null){%>
                    <div class="ipt">
                        <input type="text"  class="password" placeholder=" 电话:"readonly=readonly>
                        <input type="text" class="account" name="account"  value=<%=account%>>
                    </div>
                    <%}
                    else{%>
                    <div class="ipt">
                        <input type="text"  class="password" placeholder=" 电话:"readonly=readonly>
                        <input type="text" class="account" name="account">
                    </div>
                    <%}%>

                    <%if(password!=null){%>
                    <div class="ipt1">
                        <input type="text"  class="password" placeholder=" 密码:"readonly=readonly>
                        <input type="password" id="password" name="password" class="account" value=<%=password%>>
                    </div>
                    <%}
                    else{%>
                    <div class="ipt1">
                        <input type="text"  class="password" placeholder=" 密码:"readonly=readonly>
                        <input type="password" id="password" name="password" class="account">
                    </div>
                    <%}%>

                    <img class="eyes" id="eyes" alt="" src="Image/hide.jpg" onclick="change()">
                </div>
                <div class="login-button" ><input class="submit" type="submit" value="立 即 登 录"></div>
                <div style="float: left;margin-top: 3%;width: 100%">
                    <a class="right" href="Lhq_Search.jsp?flg=<%=flg%>&showway=<%=showway%>&h_id=<%=h_id%>">忘记密码?</a>
                    |
                    <a href="Lhq_Register.jsp?flg=<%=flg%>&showway=<%=showway%>&h_id=<%=h_id%>" class="left">立即注册&nbsp;</a>
                </div>

            </form>

    </div>

    <div style="height: 4%">

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
