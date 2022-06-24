<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2022-06-24
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LFouse-编辑用户信息</title>
</head>
<%User user=(User)request.getAttribute("ShowMyInformation");%>
<body>
<form id="menu" name="menu" method="post" action="Lhq_UpdateServlet">
    <input type="hidden" name="user_id" value=<%=user.getUser_id()%>>
    <div><span>姓名：</span><input type="text" id="uname" name="uname" value=<%=user.getUname()%>></div>
    <div><span>电话：</span><input type="text" id="tel" name="tel" value=<%=user.getTel()%>></div>
    <div><span>邮箱：</span><input type="text" id="email" name="email" value=<%=user.getEmail()%>></div>
    <div><span>性别：</span><input type="text" name="sex" value=<%=user.getSex()%>></div>
    <div><span>年龄：</span><input type="text" id="age" name="age" value=<%=user.getAge()%>></div>
    <div><span>出租数量：</span><input type="text" id="lodge_num" name="lodge_num" value="0" readonly="true" value=<%=user.getLodge_num()%>></div>
    <div><span>租房数量：</span><input type="text" id="rent_num" name="rent_num" value="0" readonly="true" value=<%=user.getRent_num()%>></div>
    <div><input type="submit" value="立即修改"><input type="button" onclick="window.location.href='Lhq_ShowMyInformationServlet';"value="返回"></div>
</form>
<script type="text/javascript" language="JavaScript" src="Script/Lhq_EditorUser.js"></script>
</body>
</html>
