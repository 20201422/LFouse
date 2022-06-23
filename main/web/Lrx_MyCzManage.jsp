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
    int user_id= (Integer) session.getAttribute("user_id");//得到用户id
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
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_CzForm.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_TableStyle.css" />
    <title>LFouse-我的出租</title>
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


    <div>
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr  class="firstTr"><th>出租编号</th><th>租客编号</th><th>房源编号</th><th>出租月数</th><th>出租价格</th><th>出租开始时间</th><th>出租预计结束时间</th><th>实际退租时间</th><th>支付状态</th><th>支付方式</th><th>操作</th></tr>
            <c:forEach items="${lodgeList}" var="Lodge">
                <tr>
                    <td>${Lodge.lodge_id}</td>
                    <td>${Lodge.user_id}</td>
                    <td>${Lodge.h_id}</td>
                    <td>${Lodge.lodge_limit}</td>
                    <td>${Lodge.lodge_price}</td>
                    <td>${Lodge.lodge_stime}</td>
                    <td>${Lodge.lodge_etime}</td>
                    <td>${Lodge.lodge_otime}</td>
                    <td>${Lodge.lodge_psta}</td>
                    <td>${Lodge.lodge_pway}</td>
                    <td><input type="button" value="修改">&nbsp;<input type="button" value="删除"></td>

                </tr>
            </c:forEach>
        </table>
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
