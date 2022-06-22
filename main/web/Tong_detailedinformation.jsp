<%--
  Created by IntelliJ IDEA.
  User: xxd
  Date: 2022/6/22
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.H_resources" %>
<%@ page import="java.util.List" %>
<%
    int user_id= (Integer) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字

    List<H_resources> list= (List<H_resources>) request.getAttribute("ShowHouse");
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <title>房源信息</title>
</head>
<body>
<header>
    <div>
        <div class="header">
            <img src="Image/logo.jpg" title="" alt="logo" class="logo">
            <img src="Image/name.jpg" title="" alt="LFouse" class="name">
            <span class="header_name">提供最好的租房服务</span>
            <%
                if(tel==null|| tel.equals("")){//未登录
            %>
            <div class="head_welcome">
                您好，<a href="Login.jsp" class="wa">请登录</a>（支持IPv6访问）<br>
                <div class="ts">现在租房或者出租，享受免押金、免定金、免息分期等服务。</div>
            </div>
            <%
            }else{//已登录
            %>
            <div class="head_welcome">您好,<%=uname%>&nbsp<a href="" class="wa">[退出]</a><br>
                <div class="ts">现在租房或者出租，享受免押金、免定金、免息分期等服务。</div>
            </div>
            <input type="hidden" value="<%=uname%>" name="uno">
            <%
                }
            %>
        </div>
        <hr class="hr">
        <nav class="menu">
            <p><a href="">位置找房</a></p>
            <p><a href="">交通找房</a></p>
            <p><a href="">民宿</a></p>
            <p><a href="">公寓</a></p>
            <p><a href="">别墅</a></p>
            <p><a href="">商品房</a></p>
            <p><a href="">写字楼</a></p>
            <%
                if(tel==null|| tel.equals("")){//未登录
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
    </div>

    <div class="container">
        <div>
            房源名称
        </div>
        <div>
            图片
        </div>
    </div>
</header>

    <div>

    </div>
</body>
</html>
