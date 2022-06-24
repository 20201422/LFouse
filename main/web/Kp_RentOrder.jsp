<%--
  Created by IntelliJ IDEA.
  User: coopskywalker
  Date: 2022/6/23
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Model.H_resources" %>
<%@ page import="Model.H_facilities" %>
<%@ page import="Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user_id= (String) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字

    H_resources h_resources= (H_resources) request.getAttribute("detailinformation");//得到房源信息
    H_facilities h_facilities= (H_facilities) request.getAttribute("detailinformationfac");//得到房源配置
    User user= (User) request.getAttribute("detailinformationuser");//得到房源主人信息
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Kp_RentOrder.css" />
    <title>LFouse-检查订单</title>
</head>

<script type="text/javascript" language="JavaScript" src="Script/Kp_RentOrder.js"></script>

<body>
<header>
    <div class="header">
        <img src="Image/logo.jpg" title="" alt="logo" class="logo">
        <img src="Image/name.jpg" title="" alt="LFouse" class="name">
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
        <p><a href="Lhq_Login.jsp">我要出租</a></p>
        <p><a href="Lhq_Login.jsp">我的</a></p>
        <%
        }else{//已登录
        %>
        <p><a href="">我要出租</a></p>
        <p><a href="">我的</a></p>
        <%
            }
        %>
    </nav>
</header>

<div>
    <div class="checkOrder_Head">
        <h1>请检查您的租房信息</h1>
    </div>

    <div class="nr">
        <div class="message">
            <h2>房屋信息</h2>
            <table>
                <tr>
                    <td>类型：<%=h_resources.getH_type()%></td>
                    <td>户型：<%=h_resources.getH_layout()%></td>
                </tr>
                <tr>
                    <td>楼层：<%=h_resources.getH_floor()%></td>
                    <td>面积：<%=h_resources.getH_area()%></td>
                </tr>
                <tr>
                    <td>朝向：<%=h_resources.getH_toward()%></td>
                    <%if(h_resources.isH_elevator()){%>
                    <td>有电梯</td>
                    <%}else{%>
                    <td class="error">无电梯</td>
                    <%}%>
                </tr>
                <tr>
                    <td colspan="2">位置：<%=h_resources.getH_location()%></td>
                </tr>
                <tr>
                    <td colspan="2">交通：<%=h_resources.getH_traffic()%></td>
                </tr>
            </table>
        </div>

        <div class="facilities">
            <h2>房屋配置</h2>
            <table class="table1">
                <tr>
                    <%if(h_facilities.getWifi()==1){%>
                    <td> Wi-Fi：有</td>
                    <%}else{%>
                    <td class="error">Wi-Fi：无</td>
                    <%}%>
                    <%if(h_facilities.getTV()==1){%>
                    <td>电视：有</td>
                    <%}else{%>
                    <td class="error">电视：无</td>
                    <%}%>
                    <%if(h_facilities.getWashing()==1){%>
                    <td>洗衣机：有</td>
                    <%}else{%>
                    <td class="error">洗衣机：无</td>
                    <%}%>
                </tr>
                <tr>
                    <%if(h_facilities.getShower()==1){%>
                    <td>热水器：有</td>
                    <%}else{%>
                    <td class="error">热水器：无</td>
                    <%}%>
                    <%if(h_facilities.getAirConditioner()==1){%>
                    <td>空调：有</td>
                    <%}else{%>
                    <td class="error">空调：无</td>
                    <%}%>
                    <%if(h_facilities.getRefrigerator()==1){%>
                    <td>冰箱：有</td>
                    <%}else{%>
                    <td class="error">冰箱：无</td>
                    <%}%>
                </tr>
            </table>
            <h2>屋主信息</h2>
            <table>
                <tr>
                    <td>姓名：<%=user.getUname()%></td>
                    <td>联系方式：<%=user.getTel()%></td>
                </tr>
                <tr>
                    <td>性别：<%=user.getSex()%></td>
                    <td>年龄：<%=user.getAge()%></td>
                </tr>
            </table>
        </div>
    </div>

    <div class="fill">
        <form action="Kp_PlaceOrderServlet" id="queding">
            <div class="form">
                租房月数：&nbsp&nbsp&nbsp&nbsp
                <input type="number" min="1" name="lodge_limit" id="lodge_limit" class="form-text" value="1"
                       onblur="totalprice('<%=h_resources.getH_price()%>')" oninput="if(value<0)value=0"><br>
                支付方式：&nbsp&nbsp&nbsp
                <input type="radio" name="lodge_pway" value="1">全款
                <input type="radio" name="lodge_pway" value="2">分期<br>
            </div>
            <div class="Check_Form_btn">
                合计: <span id="totalprice" onclick="totalprice()" name="lodge_price"><%=h_resources.getH_price()%></span> RMB
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="button" value="确定" class="form-btn" onclick="queding()">
            </div>
            <input type="hidden" value="<%=user_id%>" name="user_id">
            <input type="hidden" value="<%=h_resources.getH_id()%>" name="h_id">
            <input type="hidden" value="<%=h_resources.getH_price()%>" name="lodge_price" id="lodge_price">
        </form>
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
