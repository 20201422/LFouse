<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: coopskywalker
  Date: 2022/6/20
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user_id= (String) session.getAttribute("user_id");//得到会员名字
    String uname= (String) session.getAttribute("uname");//得到会员名字
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/HeaderandFooter.css" />
    <title>LFouse-租房</title>
</head>

<body>

<header>
    <%
        if(user_id==null|| user_id.equals("")){//未登录
    %>
    <div class="head_welcome">您好，<a href="Login.jsp" class="wa">请登录</a>（支持IPv6访问）</div>
    <%
    }else{//已登录
    %>
    <div class="head_welcome">您好,<%=uname%>&nbsp<a href="" class="wa">[退出]</a></div>
    <input type="hidden" value="<%=uname%>" name="uno">
    <%
        }
    %>
    <div class="header">LFouse</div>
    <nav class="menu">
        <p><a href="">位置找房</a></p>
        <p><a href="">交通找房</a></p>
        <p><a href="">民宿</a></p>
        <p><a href="">公寓</a></p>
        <p><a href="">别墅</a></p>
        <p><a href="">商品房</a></p>
        <p><a href="">写字楼</a></p>
        <%
            if(user_id==null|| user_id.equals("")){//未登录
        %>
        <p><a href="Login.jsp">我要出租</a></p>
        <p><a href="Login.jsp">我的</a></p>
        <%
        }else{//已登录
        %>
        <p><a href="Login.jsp">我要租房</a></p>
        <p><a href="Login.jsp">我的</a></p>
        <%
            }
        %>
    </nav>
    <div class="ts">现在租房或者出租，享受免押金、免定金、免息分期等服务。</div>
</header>


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
