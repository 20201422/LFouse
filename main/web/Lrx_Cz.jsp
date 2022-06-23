<%--
  Created by IntelliJ IDEA.
  User: LRX
  Date: 2022-06-22
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String uname= (String) session.getAttribute("uname");
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_CzForm.css" />
    <title>LFouse-出租</title>
</head>
<body>
    <div class="header">
        <img src="Image/logo.jpg" title="" alt="logo" class="logo">
        <img src="Image/name.jpg" title="" alt="LFouse" class="name">
        <span class="header_name">提供最好的租房服务</span>
        <div class="head_welcome">您好,<%=uname%>&nbsp<a href="Lhq_QuitServlet" class="wa">[退出]</a>&nbsp&nbsp&nbsp<br>
            <div class="ts">现在租房或者出租，享受免押金、免定金、免息分期等服务。</div>
        </div>
    </div>

    <div class="information">
    <form action="Lrx_CzAddServlet" method="post" enctype="multipart/form-data">
        房子名称：<input type="text" name="h_name"><br>
        位置：<input type="text" name="h_location"><br>
        价格：<input type="text" name="h_price"><br>
        户型：<input type="text" name="h_layout"><br>
        类型：<input type="text" name="h_type"><br>
        面积：<input type="text" name="h_area"><br>
        <!-- 是否有电梯：<input type="text" name="h_elevator"><br>
         朝向：<input type="text" name="h_toward"><br>  -->
        是否有电梯：<select name="h_elevator">
            <option value="1">有</option>
            <option value="0">无</option>
        </select><br>
        朝向：<select name="h_toward">
            <option value="朝南" selected>朝南</option>
            <option value="朝北">朝北</option>
            <option value="朝东">朝西</option>
            <option value="朝西">朝西</option>
            <option value="东南">东南</option>
            <option value="西南">东南</option>
            <option value="东北">东南</option>
            <option value="西北">东南</option>
        </select><br>
        交通状况：<input type="text" name="h_traffic"><br>
        楼层：<input type="text" name="h_floor"><br>
        <input type="checkbox" name="facilities" value="wifi">无线WIFI
        <input type="checkbox" name="facilities" value="TV">电视
        <input type="checkbox" name="facilities" value="shower">淋浴
        <input type="checkbox" name="facilities" value="airConditioner">空调
        <input type="checkbox" name="facilities" value="washing">洗衣机
        <input type="checkbox" name="facilities" value="refrigerator">冰箱
        <br>
        <input type="file" name="file" id="file" ><br>
        <input type="submit" name="Submit" value="提交">
        <input type="reset" value="重置">
    </form>
    </div>

    <br><br>
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
