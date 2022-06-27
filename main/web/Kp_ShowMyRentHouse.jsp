<%@ page import="java.util.List" %>
<%@ page import="Model.Lodge" %>
<%@ page import="java.util.Objects" %>
<%@ page import="Model.H_resources" %><%--
  Created by IntelliJ IDEA.
  User: coopskywalker
  Date: 2022/6/23
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user_id= (String) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字

    List<Lodge> list= (List<Lodge>) request.getAttribute("showMyHouse");//得到我的租房信息
    List<H_resources> alllist= (List<H_resources>) request.getAttribute("ShowAllHouse");//得到我的租房信息

%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Kp_ShowMyRentHouse.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Kp_MaybeLike.css" />
    <title>LFouse-我的租房</title>
</head>

<script type="text/javascript" language="JavaScript" src="Script/Kp_ShowMyRentHouse.js"></script>

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
            您好，<a href="Lhq_Login.jsp" class="wa">请登录</a>（支持IPv6访问）<br>
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

<div>
    <%
        if(list.size()!=0){//有租房信息
    %>
    <div class="checkOrder_Head">
        <h1>您的租房信息</h1>
    </div>
    <%
            for(Lodge lodge:list){
    %>
    <div class="myrent">
        <table>
            <tr>
                <td>订单编号：<%=lodge.getLodge_id()%></td>
                <td>房屋编号：<%=lodge.getH_id()%></td>
                <td colspan="2">房屋名称：<%=lodge.getH_name()%></td>
            </tr>
            <tr>
                <td>月份：<%=lodge.getLodge_limit()%> 个月</td>
                <td>价格：<%=lodge.getLodge_price()%> RMB</td>
                <td>支付方式：<%=lodge.getLodge_pway()%></td>
                <%
                    if(Objects.equals(lodge.getLodge_psta(), "分期支付中")){
                %>
                <td class="myrent-error">支付状态：<span class="error"><%=lodge.getLodge_psta()%></span></td>
                <%
                    }else{
                %>
                <td>支付状态：&nbsp&nbsp<%=lodge.getLodge_psta()%></td>
                <%
                    }
                %>
            </tr>
            <tr>
                <td colspan="2">起始时间：<%=lodge.getLodge_stime()%></td>
                <td colspan="2">预计结束时间：<%=lodge.getLodge_etime()%></td>
            </tr>
        </table>
        <div class="myrent-cz">
            <a href="Tong_detailedinformationServlet?showway=2&h_id=<%=lodge.getH_id()%>">查看房屋详细信息</a>
            <a href="Kp_RentOrderServlet?orderway=2&h_id=<%=lodge.getH_id()%>">续租</a>
            <a onclick="quxiao('<%=lodge.getH_id()%>')">取消租房</a>
            <form action="Kp_CancelOrderServlet" id="quxiao">
                <input type="hidden" name="h_id" id="h_id">
            </form>
        </div>
    </div>
    <%
            }
        }else{
    %>
    <div class="checkOrder_Head">
        <h1>您还没有租房哦！</h1>
    </div>
    <%
            }
    %>
</div>

<div class="like">
    <hr>
    <p class="like-title">猜你喜欢</p>
    <div class="maybelike">
        <%
            if(alllist!=null){
                for(H_resources h_resources:alllist){
                    request.setAttribute("h_resorces",h_resources);
        %>
        <div class="ShowHouse" onclick="
                window.location.href='Tong_detailedinformationServlet?showway=1&h_id=<%=h_resources.getH_id()%>'">
            <div class="img">
                <img class="img" src="Image/<%=h_resources.getPhoto_name()%>" alt="<%=h_resources.getH_name()%>"
                     title="<%=h_resources.getH_name()%>">
            </div>
            <div class="message">
                <div class="House_Message0">
                    <p class="title-error0"><%=h_resources.getH_name()%></p>
                </div>
                <div class="House_Message2">
                    <p>
                        <%
                            if(h_resources.getH_layout()==null){//户型为空（用于写字楼）
                        %>
                        户型：暂无&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <%
                        }else{//户型不为空（用于写字楼）
                        %>
                        户型：<%=h_resources.getH_layout()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <%
                            }
                        %>
                        面积：<%=h_resources.getH_area()%>平米&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    </p>
                </div>
                <div class="House_Message3">
                    <p>价格：<%=h_resources.getH_price()%></p>
                    <p class="House_Message3-a">RMB/月&nbsp&nbsp&nbsp&nbsp</p>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
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
</body>
</html>
