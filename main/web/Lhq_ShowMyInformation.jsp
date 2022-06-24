<%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2022-06-24
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.User" %>
<html>
<head>
    <title>LFouse-个人信息</title>
</head>
<%User user=(User)request.getAttribute("ShowMyInformation");%>
<body>
<form id="menu" name="menu" method="post" action="Lhq_LogoutServlet">
    <input type="hidden" name="ntel" value=<%=user.getTel()%>>
    <input type="hidden" name="upwd" value=<%=user.getUpwd()%>>
    <div><span>姓名：</span><input type="text" id="uname" readonly="true" name="uname" value=<%=user.getUname()%>></div>
    <div><span>电话：</span><input type="text" id="tel" readonly="true" name="tel" value=<%=user.getTel().replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2")%>></div>
    <div><span>邮箱：</span><input type="text" id="email" readonly="true" name="email" value=<%=user.getEmail()%>></div>
    <div><span>性别：</span><input type="text" name="sex" readonly="true" value=<%=user.getSex()%>></div>
    <div><span>年龄：</span><input type="text" id="age" name="age" readonly="true" value=<%=user.getAge()%>></div>
    <div><span>出租数量：</span><input type="text" id="lodge_num" name="lodge_num" value="0" readonly="true" value=<%=user.getLodge_num()%>></div>
    <div><span>租房数量：</span><input type="text" id="rent_num" name="rent_num" value="0" readonly="true" value=<%=user.getRent_num()%>></div>
    <div><a href="javascript:document.menu.submit()">注销</a></div>
    <div><input type="button" onclick="modificate()" value="修改密码"><input type="button" onclick="editor()" value="编辑"></div>
</form>
<script type="text/javascript" language="JavaScript" src="Script/Lhq_LogoutAndModificate.js"></script>
</body>
</html>
