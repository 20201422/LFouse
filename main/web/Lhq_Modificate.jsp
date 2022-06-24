<%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2022-06-24
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LFouse-修改密码</title>
</head>
<%  String upwd=request.getParameter("upwd");
    String tel=request.getParameter("ntel");
%>
<body>
<form id="menu" name="menu" method="post" action="Lhq_ModificateServlet">
    <input type="hidden" name="tel" value=<%=tel%>>
    <input type="hidden" id="check" value=<%=upwd%>>
    <div><span>旧密码：</span><input type="password" id="upwd" name="upwd"></div>
    <div><span>新密码：</span><input type="password" id="newupwd" name="newupwd"></div>
    <div><span>确认新密码：</span><input type="password" id="enewupwd" name="enewupwd"></div>
    <div><input type="submit" value="立即修改"><input type="button" onclick="window.location.href='Lhq_ShowMyInformationServlet';"value="返回"></div>
</form>
<script type="text/javascript" language="JavaScript" src="Script/Lhq_Modificate.js"></script>
</body>
</html>
