<%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2022-06-22
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LFouse-注册</title>
</head>
<body>
<form method="post" action="Lhq_RegisterServlet">
  <div><span>电话：</span><input type="text" id="tel" name="tel"></div>
  <div><span>姓名：</span><input type="text" id="uname" name="uname"></div>
  <div><span>邮箱：</span><input type="text" id="email" name="email"></div>
  <div><span>密码：</span><input type="password" id="upwd" name="upwd"></div>
  <div><span>确认密码：</span><input type="password" id="eupwd" name="eupwd"></div>
  <div><span>性别：</span><input type="radio" name="sex" value="男" checked><span>男</span>&nbsp;&nbsp;<input type="radio" name="sex" value="女" ><span>女</span>&nbsp;&nbsp;<input type="radio" name="sex" value="其他" ><span>其他</span></div>
  <div><span>年龄：</span><input type="text" id="age" name="age"></div>
  <div><span>出租数量：</span><input type="text" id="lodge_num" name="lodge_num" value="0" readonly="true"></div>
  <div><span>租房数量：</span><input type="text" id="rent_num" name="rent_num" value="0" readonly="true"></div>
  <div class="send-button"><input type = "submit" value="提交">&nbsp;&nbsp;<input type="button" value="取消" onclick="window.location.href='Kp_ShowHouseServlet';"></div>
</form>
<script type="text/javascript" language="JavaScript" src="Script/Lhq_Register.js"></script>
</body>
</html>
