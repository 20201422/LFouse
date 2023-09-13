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
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lhq_Modificate.css" />
    <title>LFouse-修改密码</title>
</head>
<%  String upwd=request.getParameter("upwd");
    String ntel=request.getParameter("ntel");
    String user_id= (String) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字
%>
<body>
<header>
    <div class="header">
        <img src="Image/logo.jpg" title="" alt="logo" class="logo" onclick="window.location.href='index.jsp'">
        <img src="Image/name.jpg" title="" alt="LFouse" class="name" onclick="window.location.href='index.jsp'">
        <span class="header_name">提供最好的租房服务</span>
        <%
            if(tel==null|| tel.equals("")){//未登录
        %>
        <div class="head_welcome">
            您好，<a href="Lhq_Login.jsp?flg=Kp_ShowHouseServlet" class="wa">请登录</a>（支持IPv6访问）<br>
            <div class="ts">现在租房或者出租，享受免押金、免定金、免息分期等服务。</div>
        </div>
        <%
        }else{//已登录
        %>
        <div class="head_welcome">您好,<%=uname%>&nbsp<a href="Lhq_QuitServlet" class="wa">[退出]</a>&nbsp&nbsp&nbsp<br>
            <div class="ts">现在租房或者出租，享受免押金、免定金、免息分期等服务。</div>
        </div>
        <input type="hidden" value="<%=uname%>" name="uno">
        <%
            }
        %>
    </div>
    <hr class="hr">
    <nav class="menu">
        <p><a href="Kp_ShowHouseServlet?way=1">位置找房</a></p>
        <p><a href="Kp_ShowHouseServlet?way=2">地铁找房</a></p>
        <p><a href="Kp_ShowHouseServlet?way=3">民宿</a></p>
        <p><a href="Kp_ShowHouseServlet?way=4">公寓</a></p>
        <p><a href="Kp_ShowHouseServlet?way=5">别墅</a></p>
        <p><a href="Kp_ShowHouseServlet?way=6">商品房</a></p>
        <p><a href="Kp_ShowHouseServlet?way=7">写字楼</a></p>
        <%
            if(tel==null|| tel.equals("")){//未登录
        %>
        <p><a href="Lhq_Login.jsp?flg=Lrx_Cz.jsp">我要出租</a></p>
        <p><a href="Lhq_Login.jsp?flg=Kp_ShowMyRentHouseServlet">我的</a></p>
        <%
        }else{//已登录
        %>
        <p><a href="Lrx_Cz.jsp">我要出租</a></p>
        <p><a href="Kp_ShowMyRentHouseServlet">我的</a></p>
        <%
            }
        %>
    </nav>
</header>
<br>

<div class="apwd-menu">
    <form id="menu" name="menu" method="post" action="Lhq_ModificateServlet">
        <input type="hidden" name="tel" value=<%=ntel%>>
        <input type="hidden" id="check" value=<%=upwd%>>
        <div class="apwd-text">
            <div style="margin-top: 5%"></div>
        <div>
            <div>
                <span>原密码：</span><input type="password" id="upwd" name="upwd" onchange="check1()">
                <div style="height: 10%;margin-top: -4%">
                    <span id="check1"></span>
                </div>
            </div>
        </div>
            <div>
                <span>新密码：</span><input type="password" id="newupwd" name="newupwd" onchange="check2()">
                <div style="height: 10%;margin-top: -4%">
                    <span id="check2"></span>
                </div>
            </div>
            <div>
                <span>确认新密码：</span><input type="password" id="enewupwd" name="enewupwd" onchange="check3()">
                <div style="height: 10%;margin-top: -4%">
                    <span id="check3"></span>
                </div>
            </div>
        </div><br>
        <div class="form-btn">
            <input type="submit" value="立即修改">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="button" onclick="window.location.href='Lhq_ShowMyInformationServlet';"value="返回">
        </div>
    </form>
</div>

<footer>
    <hr>
    <div class="footer-help">
        需要更多帮助？致电 400-820-XXXX。
    </div>
    <div class="footer">
        <p>LFouse采用符合业界标准的加密技术对您提交的信息进行保密。</p>
        <hr>
        Copyright ©️ 2022 202014-4 lnc.保留所有权利<br>
        蒙 ICP备2023001109号
    </div>
</footer>
<script type="text/javascript" language="JavaScript" src="Script/Lhq_Modificate.js"></script>
</body>
</html>
