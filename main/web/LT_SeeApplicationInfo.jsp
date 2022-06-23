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
    String user_id= (String) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字
%>
<html>
<%--管理员查看申请信息--%>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <%--<link rel="stylesheet" type="text/css" href="CSS/Kp_ShowHouse.css" />--%>
    <link rel="stylesheet" type="text/css" href="CSS/LT_admin.css" />
    <title>LFouse-申请详情</title>
</head>

<body>

<header>
    <div class="header">
        <img src="Image/logo.jpg" title="" alt="logo" class="logo">
        <img src="Image/name.jpg" title="" alt="LFouse" class="name">
        <span class="header_name">提供最好的租房服务</span>

        <div class="head_welcome" style="margin-right: 2%;margin-top: 1%">您好,管理员
            <div>
                <a href="" class="wa">[退出]</a>
            </div>
        </div>


        <input type="hidden" value="<%=uname%>" name="uno">

    </div>
    <hr class="hr">

</header>

<div style="height: 480px;">

    <nav class="LT_menu">
        <%
            String PageNo = request.getParameter("PageNo");
        %>
        <p id="p1"><a href="LT_ShowDataServlet?flag=1&PageNo=<%=PageNo%>">全部房源</a></p>
        <p id="p2"><a href="LT_ShowDataServlet?flag=2&PageNo=<%=PageNo%>">待审批</a></p>
        <p id="p3"><a href="LT_ShowDataServlet?flag=3&PageNo=<%=PageNo%>">未出租</a></p>
        <p id="p4"><a href="LT_ShowDataServlet?flag=4&PageNo=<%=PageNo%>">已出租</a></p>
        <p id="p5"><a href="LT_ShowDataServlet?flag=5&PageNo=<%=PageNo%>">用户信息</a></p>
    </nav>

    <div style="width: 92%;height: 100%;margin-left: 8%;background-color: #F2F2F2;border-radius: 20px">
        <div style="width: 100%;height: 4%;"></div>
        <div style="width: 40%;height: 80%;background-color: white;border-radius: 20px;margin-left: 9%;float: left">

        </div>
        <div style=";height: 80%;border-right: solid white;float: left;margin-left: 1%"></div>
        <div style="width: 40%;height: 80%;background-color: white;border-radius: 20px;margin-left: 1%;float: left">

        </div>

    </div>
</div>

<footer id="footer1">
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
