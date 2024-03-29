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
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lhq_ShowMyInformation.css"/>
    <title>LFouse-我的信息</title>
</head>
<%
    User user=(User)request.getAttribute("ShowMyInformation");
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
    <nav class="menu-two">
        <p><a href="Kp_ShowMyRentHouseServlet">我的租房</a></p>
        <p><a href="Lrx_ShowServlet">我的房源</a></p>
        <p><a href="Kp_ShowMyCollectionServlet">我的收藏</a></p>
        <p><a href="Lhq_ShowMyInformationServlet">我的信息</a></p>
    </nav>
</header>
<br>
<div class="card">
<form id="menu" name="menu" method="post" action="Lhq_LogoutServlet">
    <input type="hidden" name="ntel" value=<%=user.getTel()%>>
    <input type="hidden" name="upwd" value=<%=user.getUpwd()%>>
    <div><span class="move">用户名：</span><input type="text" id="uname" readonly="true" name="uname" value=<%=user.getUname()%>></div>
    <div><span class="move">电话：</span><input type="text" id="tel" readonly="true" name="tel" value=<%=user.getTel().replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2")%>></div>
    <div><span class="move">邮箱：</span><input type="text" id="email" readonly="true" name="email" value=<%=user.getEmail()%>></div>
    <div><span class="move">性别：</span><input type="text" name="sex" readonly="true" value=<%=user.getSex()%>></div>
    <div><span class="move">年龄：</span><input type="text" id="age" name="age" readonly="true" value=<%=user.getAge()%>></div>
    <%
        if(user.getLodge_num()<=0){
            %>
    <div><span class="move">出租数量：</span><input type="text" id="lodge_num" name="lodge_num" readonly="true" value="0"></div>
    <%
        }else{
    %>
    <div><span class="move">出租数量：</span><input type="text" id="lodge_num" name="lodge_num" readonly="true" value=<%=user.getLodge_num()%>></div>
   <%
    }
    %>
    <%
        if(user.getRent_num()<=0){
    %>
    <div><span class="move">租房数量：</span><input type="text" id="rent_num" name="rent_num" readonly="true" value="0"></div>
    <%
    }else{
    %>
    <div><span class="move">租房数量：</span><input type="text" id="rent_num" name="rent_num" readonly="true" value=<%=user.getRent_num()%>></div>
    <%
    }
    %>
    <div class="form-btn">
        <input class="right" type="button" onclick="modificate()" value="修改密码">&nbsp&nbsp&nbsp&nbsp&nbsp
        <input class="left" type="button" onclick="editor()" value="修改信息">
    </div>
    <div class="form-btn-delete">
        <a href="javascript:document.menu.submit()">注销</a>
    </div>
</form>
</div>

<div style="background-color: transparent;width: 100%;height: 5%">

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
<script type="text/javascript" language="JavaScript" src="Script/Lhq_LogoutAndModificate.js"></script>
</body>
</html>
