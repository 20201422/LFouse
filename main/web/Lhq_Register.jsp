<%@ page import="java.util.Objects" %><%--
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
  String flg = (String)request.getAttribute("flg");
  String showway=(String)request.getAttribute("showway");
  String h_id=(String)request.getAttribute("h_id");
  String num= (String) request.getAttribute("num");
  String tel= (String)request.getAttribute("tel");
  String uname= (String)request.getAttribute("uname");
  String upwd= (String)request.getAttribute("upwd");
  String eupwd= (String)request.getAttribute("eupwd");
  String email=(String)request.getAttribute("email");
  String age= (String)request.getAttribute("age");
  String flg1=request.getParameter("flg");
  String showway1=request.getParameter("showway");
  String h_id1=request.getParameter("h_id1");
%>
<div  class="wrap">
  <%
    String errorMsg = (String) request.getAttribute("errorMsg");
    if (errorMsg != null) {
  %>
  <div class="errorMsg" style="height: 6%">
    <div style="height: 20%"></div>
    <span style="font-family: 等线 Light;font-size: 19px;margin-left: 27%;"><%=errorMsg%></span>
  </div>
  <%}else{
  %>
  <div class="errorMsg1">
  </div>
  <%
    }%>
  <form id="menu" name="menu" style="height: 80%;width: 100%;" class="form_Register" method="post" action="Lhq_RegisterServlet">
    <div align="center"style="height:14%;margin-left: 0%;margin-top: -1%">
      <font style="font-size: 42px;font-family: 等线 Light;color: #0597F2">LFouse 注册</font>
    </div>
    <%if(tel!=null){%>
    <div style="margin-top: -1%">
      <span style="margin-left: 10%">电话：</span>
      <input style="margin-left: -2%;margin-top: -1%" class="move" type="text" id="tel" name="tel" onchange="check1()" value=<%=tel%>>
    </div>
    <%}
    else{%>
      <div style="margin-top: -1%">
      <span style="margin-left: 10%">电话：</span>
      <input style="margin-left: -2%;margin-top: -1%" class="move" type="text" id="tel" name="tel" onchange="check1()">
      </div>
    <%}%>
    <div style="margin-left: 35%">
      <span id = "check1"> </span>
    </div>

    <input type="hidden" id="code" name="code" value=<%=num%>>
    <input type="hidden" name="flg" value=<%=flg%>>
    <input type="hidden" name="showway" value=<%=showway%>>
    <input type="hidden" name="h_id" value=<%=h_id%>>

    <%if(uname!=null){%>
    <div style="margin-top: -1%">
      <span style="margin-left: 10%">姓名：</span>
      <input style="margin-left: -2%" class="move" type="text" id="uname" name="uname" onchange="check2()" value=<%=uname%>>
    </div>
    <%}
      else{%>
      <div style="margin-top: -1%">
      <span style="margin-left: 10%">姓名：</span>
      <input style="margin-left: -2%" class="move" type="text" id="uname" name="uname" onchange="check2()">
      </div>
    <%}%>
    <div style="margin-left: 35%">
      <span id = "check2"> </span>
    </div>

    <%if(email!=null){%>
    <div style="margin-top: -1%">
      <span style="margin-left: 10%">邮箱：</span>
      <input style="margin-left: -2%" class="move" type="text" id="email" name="email" onchange="check3()" value=<%=email%>>
    </div>
    <%}else{%>
      <div style="margin-top: -1%">
      <span style="margin-left: 10%">邮箱：</span>
      <input style="margin-left: -2%" class="move" type="text" id="email" name="email" onchange="check3()">
      </div>
    <%}%>
    <div style="margin-left: 35%">
      <span id = "check3"> </span>
    </div>

    <div style="margin-top: -1%">
      <span style="margin-left: 4%">验证码：</span>
      <input style="margin-left: -2%" class="move1" type="text" id="vcode" name="vcode" onchange="check7()">
      <input type="button" class="send" value="发送验证码" onclick="checkvcode()">
    </div>
    <div style="margin-left: 35%">
      <span id = "check7"> </span>
    </div>

    <%if(upwd!=null){%>
    <div style="margin-top: -1%">
      <span style="margin-left: 10%">密码：</span>
      <input style="margin-left: -2%" class="move" type="password" id="upwd" name="upwd" onchange="check4()" value=<%=upwd%>>
    </div>
    <%}else{%>
    <div style="margin-top: -1%">
      <span style="margin-left: 10%">密码：</span>
      <input style="margin-left: -2%" class="move" type="password" id="upwd" name="upwd" onchange="check4()">
    </div>
    <%}%>
    <div style="margin-left: 35%">
      <span id = "check4"> </span>
    </div>

    <%if(eupwd!=null){%>
    <div style="margin-top: -1%">
      <span style="margin-left: -2%">确认密码：</span>
      <input style="margin-left: -2%" class="nmove" type="password" id="eupwd" name="eupwd" onchange="check5()" value=<%=eupwd%>>
    </div>
    <%}else{%>
    <div style="margin-top: -1%">
      <span style="margin-left: -2%">确认密码：</span>
      <input style="margin-left: -2%" class="nmove" type="password" id="eupwd" name="eupwd" onchange="check5()">
    </div>
      <%}%>
    <div style="margin-left: 35%">
      <span id = "check5"> </span>
    </div>

    <div style="margin-top: -1%">
      <span style="margin-left: 10%">性别：</span>
      <input class="sex" type="radio" name="sex" value="男" checked>
      <span>男</span>
      <input type="radio" name="sex" value="女" >
      <span>女</span>
      <input type="radio" name="sex" value="其他" >
      <span>其他</span>
    </div>

    <div style="margin-left: 35%">
    </div>

    <div style="margin-top: 1%">
      <span style="margin-left: 10%">年龄：</span>
      <input style="margin-left: -2%" class="move" type="number" id="age" name="age" onchange="check6()" value=<%=age%>>
    </div>
    <div style="margin-left: 35%">
      <span id = "check6"> </span>
    </div>
    <div>
      <div style="float: left;width: 20%">
        <input type = "submit" class="submit" value="注册">
      </div>
      <div style="float: left;width: 20%">
        <input type="button" class="cancel" value="取消" onclick="window.location.href='Lhq_Login.jsp?flg=<%=flg1%>&showway=<%=showway1%>&h_id=<%=h_id1%>'">
      </div>
    </div>
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
