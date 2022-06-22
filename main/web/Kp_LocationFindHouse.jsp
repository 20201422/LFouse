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
    int user_id= (Integer) session.getAttribute("user_id");//得到用户id
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
        <div class="head_welcome">您好,<%=uname%>&nbsp<a href="Lhq_QuitServlet" class="wa">[退出]</a><br>
            <div class="ts">现在租房或者出租，享受免押金、免定金、免息分期等服务。</div>
        </div>
        <input type="hidden" value="<%=uname%>" name="uno">
        <%
            }
        %>
    </div>
    <hr class="hr">
    <nav class="menu">
        <p><a href="Kp_ShowHouseServlet">位置找房</a></p>
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
        for(H_resources h_resources:list){
            request.setAttribute("h_resorces",h_resources);
    %>
        <div class="ShowHouse" onclick="
        window.location.href='Tong_detailedinformationServlet?h_id=<%=h_resources.getH_id()%>' ">
            <div class="img">
                <img class="img" src="Image/<%=h_resources.getPhoto_name()%>" alt="<%=h_resources.getH_name()%>">
            </div>
            <div class="message">
                <div class="House_Message0">
                    <p><%=h_resources.getH_name()%></p>
                </div>
                <div class="House_Message1">
                    <p>
                        地点：<%=h_resources.getH_location()%>&nbsp&nbsp&nbsp&nbsp
                        交通：<%=h_resources.getH_traffic()%>
                    </p>
                </div>
                <div class="House_Message2">
                    <p>
                        种类：<%=h_resources.getH_type()%>&nbsp&nbsp&nbsp&nbsp
                        户型：<%=h_resources.getH_layout()%>&nbsp&nbsp&nbsp&nbsp
                        面积：<%=h_resources.getH_area()%>平米&nbsp&nbsp&nbsp&nbsp
                        楼层：<%=h_resources.getH_floor()%>&nbsp&nbsp&nbsp&nbsp
                        <%if(h_resources.isH_elevator()){%>有电梯<%}else%>无电梯
                        &nbsp&nbsp&nbsp&nbsp
                        朝向：<%=h_resources.getH_toward()%>
                    </p>
                </div>
                <div class="House_Message3">
                    <p>
                        价格：¥ <%=h_resources.getH_price()%>/月&nbsp&nbsp&nbsp&nbsp
                    </p>
                </div>
            </div>
        </div>
    <%
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
