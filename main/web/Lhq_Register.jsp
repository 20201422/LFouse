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
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css"/>
    <title>LFouse-注册</title>
  <link rel="stylesheet" type="text/css" href="CSS/Tong_Register.css"/>
</head>
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
<%
  String flg = request.getParameter("flg");
  String showway=request.getParameter("showway");
  String h_id=request.getParameter("h_id");
%>
<div  class="wrap">
  <%
  String errorMsg = (String) request.getAttribute("errorMsg");
  if (errorMsg != null) {
%>
  <div class="errorMsg">
    <div style="height: 24%"></div>
    <span style="font-family: 等线 Light;font-size: 19px;"><%=errorMsg%></span>
  </div>
  <%}else{
  %>
  <div class="errorMsg1">
  </div>
  <%
    }%>
<%--  <div style="height: 5%"></div>--%>
  <form style="height: 50%;width: 100%;" class="form_Register" method="post" action="Lhq_RegisterServlet?flg=<%=flg%>&showway=<%=showway%>&h_id=<%=h_id%>">
<%--    <div align="center"style="margin-top: 10%">--%>
<%--      <font style="font-size: 42px;font-family: 等线 Light">LFouse 注册</font>--%>
<%--    </div>--%>
    <div><span class="block">电话：</span><input class="move" type="text" id="tel" name="tel" onchange="check1()"><span id = "check1"> </span></div>
    <div><span class="block">姓名：</span><input class="move" type="text" id="uname" name="uname" onchange="check2()"><span id = "check2"> </span></div>
    <div><span class="block">邮箱：</span><input class="move" type="text" id="email" name="email" onchange="check3()"><span id = "check3"> </span></div>
    <div><span class="block">密码：</span><input class="move" type="password" id="upwd" name="upwd" onchange="check4()"><span id = "check4"> </span></div>
    <div ><span class="block">确认密码：</span><input class="nmove" type="password" id="eupwd" name="eupwd" onchange="check5()"><span id = "check5"> </span></div>
    <div><span class="block">性别：</span><input class="sex" type="radio" name="sex" value="男" checked><span>男</span>&nbsp;&nbsp;<input type="radio" name="sex" value="女" ><span>女</span>&nbsp;&nbsp;<input type="radio" name="sex" value="其他" ><span>其他</span></div>
    <div><span class="block">年龄：</span><input class="move" type="text" id="age" name="age" onchange="check6()"><span id = "check6"> </span></div>
    <div class="send-button"><input type = "submit" class="submit" value="注册">&nbsp;&nbsp;<input type="button" class="cancel" value="取消" onclick="window.location.href='Lhq_Login.jsp'"></div>
  </form>
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
<script type="text/javascript" language="JavaScript" src="Script/Lhq_Register.js"></script>
</body>
</html>
