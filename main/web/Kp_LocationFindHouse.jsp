<%@ page import="java.util.Objects" %>
<%@ page import="Model.H_resources" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: coopskywalker
  Date: 2022/6/20
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int user_id= (int) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字

    List<H_resources> list= (List<H_resources>) request.getAttribute("ShowHouse");
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Kp_LocationfFindHouse.css" />
    <title>LFouse-位置找房</title>
</head>

<body>

<header>
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
</header>

<div class="locationfindhouse">
    <%
        int i=1;
        for(H_resources h_resources:list){
            if((i+2)%3==0){
                out.print("<div class=\"ShowHouse\">");
            }
    %>
        <div class="House">
            <p><%=h_resources.getH_id()%></p>
            <p><%=h_resources.getH_name()%></p>
            <p><%=h_resources.getH_location()%></p>
            <p><%=h_resources.getH_price()%></p>
            <p><%=h_resources.getH_layout()%></p>
            <p><%=h_resources.getH_type()%></p>
            <p><%=h_resources.getH_area()%></p>
            <p><%if(h_resources.isH_elevator()){%>是<%}else%> 无</p>
            <p><%=h_resources.getH_toward()%></p>
            <p><%=h_resources.getH_traffic()%></p>
            <p><%=h_resources.getH_floor()%></p>
        </div>
    <%
            if(i%3==0)
                out.print("</div>");
            i++;
        }
    %>

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
