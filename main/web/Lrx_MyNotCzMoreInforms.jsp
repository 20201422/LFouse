<%@ page import="Model.Lrx_NotCzMoreInforms" %><%--
  Created by IntelliJ IDEA.
  User: LRX
  Date: 2022-06-24
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String uname= (String) session.getAttribute("uname");//得到用户名字%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_CzForm.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_TableStyle.css" />
    <title>LFouse-详细信息</title>
</head>
<body>
    <header>
        <div class="header">
            <img src="Image/logo.jpg" title="" alt="logo" class="logo" onclick="window.location.href='index.jsp'">
            <img src="Image/name.jpg" title="" alt="LFouse" class="name" onclick="window.location.href='index.jsp'">
            <span class="header_name">提供最好的租房服务</span>

            <div class="head_welcome">您好,<%=uname%>&nbsp<a href="Lhq_QuitServlet" class="wa">[退出]</a>&nbsp&nbsp&nbsp<br>
                <div class="ts">现在租房或者出租，享受免押金、免定金、免息分期等服务。</div>
            </div>
            <input type="hidden" value="<%=uname%>" name="uno">
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
            <p><a href="Lrx_Cz.jsp">我要出租</a></p>
            <p><a href="Kp_ShowMyRentHouseServlet">我的</a></p>
        </nav>


        <nav class="menu-two">
            <p><a href="Kp_ShowMyRentHouseServlet">我的租房</a></p>
            <p><a href="Lrx_ShowServlet">我的出租</a></p>
            <p><a href="Kp_ShowMyCollectionServlet">我的收藏</a></p>
            <p><a href="Lhq_ShowMyInformationServlet">我的信息</a></p>
        </nav>
    </header>

    <%
        Lrx_NotCzMoreInforms lncmi=(Lrx_NotCzMoreInforms)request.getSession().getAttribute("oneInform");
    %>
    <div class="myChangeTable">
        <form action="Lrx_ModifyServlet?h_id=<%=lncmi.getH_id()%>" method="post">
            房名<input type="text" name="h_name" value=<%=lncmi.getH_name()%>><br>
            房位<input type="text" name="h_location" value=<%=lncmi.getH_location()%>><br>
            房价<input type="text" name="h_price" value="<%=lncmi.getH_price()%>"><br>
            户型<input type="text" name="h_layout" value=<%=lncmi.getH_layout()%>><br>
            类型<input type="text" name="h_type" value=<%=lncmi.getH_type()%>><br>
            面积<input type="text" name="h_area" value="<%=lncmi.getH_area()%>"><br>
            是否有电梯<input type="text" name="h_elevator" value="<%=lncmi.getH_elevator()%>"><br>
            朝向<input type="text" name="h_toward" value="<%=lncmi.getH_toward()%>"><br>
            交通情况<input type="text" name="h_traffic" value=<%=lncmi.getH_traffic()%>><br>
            楼层<input type="text" name="h_floor" value=<%=lncmi.getH_floor()%>><br>
            <input type="submit" value="保存修改">
            <input type="reset" value="重置">
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
</body>
</html>
