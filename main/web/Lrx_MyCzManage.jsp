<%@ page import="Model.H_resources" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: LRX
  Date: 2022-06-22
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String user_id= (String) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字

    String way= (String) request.getAttribute("way");//得到查找方式

    String traffic= (String) request.getAttribute("traffic");//得到有无地铁

    List<H_resources> list= (List<H_resources>) request.getAttribute("ShowHouse");
    List<H_resources> alllist= (List<H_resources>) request.getAttribute("ShowAllHouse");
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_TableStyle.css" />
    <title>LFouse-我的出租</title>
</head>
<script type="text/javascript" language="JavaScript" src="Script/Lrx_My.js.js"></script>
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
        <p><a id="My" href="Lrx_ShowServlet">我的房源</a></p>
        <p><a href="Kp_ShowMyCollectionServlet">我的收藏</a></p>
        <p><a href="Lhq_ShowMyInformationServlet">我的信息</a></p>
    </nav>

    <nav class="menu-three" id="MyHouse">
        <p><a href="Lrx_ShowServlet">已出租</a></p>
        <p><a href="Lrx_ShowNotCzServlet">未出租</a></p>
    </nav>
</header>
<!--
<div>
    <div class="Lrx_menu" >
        <p><a href="Lrx_ShowServlet">已出租</a></p><br>
        <p> <a href="Lrx_ShowNotCzServlet">未出租</a></p>
    </div>
    <div class="float">
        <div>
            <form action="Lrx_AlreadyCzSearchServlet?method=1">
            房位<select name="location">
                <option>请选择</option>
                <option>南昌</option>
                <option>上海</option>
                <option>北京</option>
                <option>包头</option>
            </select>
            支付状态<select name="pway">
                <option>请选择</option>
                <option>已支付</option>
                <option>分期支付中</option>
            </select>
            </form>
            <form Lrx_AlreadyCzSearchServlet?method=2>
                房名<input type="text" name="h_name">&nbsp;
                租客姓名<input type="text" name="uname">&nbsp;

                <input type="submit" value="搜索">
            </form>
        </div>
-->
<p align="center">已出租房源</p>
<c:forEach items="${List}" var="Lrx_AlreadyCz">
<div class="myCz">
    <div style="text-align: center;display: flex;
    justify-content: space-evenly;
    flex-wrap: nowrap;
    align-items: center;" >
        <img class="img" src="Image/${Lrx_AlreadyCz.photo_name}" >
        <table style="">
            <tr>

                <td>租客姓名：${Lrx_AlreadyCz.uname}</td>
                <td>租客电话：${Lrx_AlreadyCz.tel}</td>
                <td colspan="2">房屋名称：${Lrx_AlreadyCz.h_name}</td>
            </tr>
            <tr>
                <td colspan="2">租客邮箱：${Lrx_AlreadyCz.email}</td>
                <td colspan="2">房屋位置：${Lrx_AlreadyCz.h_location}</td>
            </tr>
            <tr>
                <td>月份：${Lrx_AlreadyCz.lodge_limit}个月</td>
                <td>价格：${Lrx_AlreadyCz.h_price} RMB/月</td>
                <td>支付方式：${Lrx_AlreadyCz.lodge_pway}</td>
                <td>支付状态：${Lrx_AlreadyCz.lodge_psta}</td>
            </tr>
            <tr>
                <td colspan="2">起始时间：${Lrx_AlreadyCz.lodge_stime}</td>
                <td colspan="2">预计结束时间：${Lrx_AlreadyCz.lodge_etime}</td>
            </tr>
            <tr>
                <td colspan="4">实际退租时间：${Lrx_AlreadyCz.lodge_otime}</td>
            </tr>

        </table>
    </div>
</div>
</c:forEach>

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
