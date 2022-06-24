<%@ page import="java.util.List" %>
<%@ page import="Model.H_resources" %><%--
  Created by IntelliJ IDEA.
  User: coopskywalker
  Date: 2022/6/23
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user_id= (String) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字

    List<H_resources> list= (List<H_resources>) request.getAttribute("showMyCollection");//得到我的收藏

%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Kp_ShowMyCollection.css" />
    <title>LFouse-我的收藏</title>
</head>
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
        <p><a href="Lrx_ShowServlet">我的出租</a></p>
        <p><a href="Kp_ShowMyCollectionServlet">我的收藏</a></p>
        <p><a href="Lhq_ShowMyInformationServlet">我的信息</a></p>
    </nav>
</header>

<div class="middle">
    <div class="locationfindhouse">
    <%
        if(list.size()!=0){//有收藏
    %>
        <div class="checkOrder_Head">
            <h1>您的收藏</h1>
        </div>
    <%
            for(H_resources h_resources:list){
                request.setAttribute("h_resorces",h_resources);
    %>
        <div class="ShowHouse" onclick="
                window.location.href='Tong_detailedinformationServlet?showway=3&h_id=<%=h_resources.getH_id()%>'">
            <div class="img">
                <img class="img" src="Image/<%=h_resources.getPhoto_name()%>" alt="<%=h_resources.getH_name()%>">
            </div>
            <div class="message">
                <div class="House_Message0">
                    <p class="title-error0"><%=h_resources.getH_name()%></p>
                    <%
                        if (h_resources.getH_status() == 3) {
                    %>
                    <p class="title-error">（已租出）</p>
                    <%
                        }
                    %>&nbsp&nbsp&nbsp&nbsp
                    <p class="title-error-id">房源编号：<%=h_resources.getH_id()%></p>
                </div>
                <div class="House_Message1">
                    <p>
                        地点：<%=h_resources.getH_location()%>&nbsp&nbsp&nbsp&nbsp
                        交通：<%=h_resources.getH_traffic()%>
                    </p>
                </div>
                <div class="House_Message2">
                    <p>
                        种类：<%=h_resources.getH_type()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
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
                        楼层：<%=h_resources.getH_floor()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <%if(h_resources.isH_elevator()){%>有电梯<%}else%>无电梯
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        朝向：<%=h_resources.getH_toward()%>
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
        }else{//没有收藏
    %>
        <div class="checkOrder_Head">
            <h1>您还没有收藏的房源！</h1>
        </div>
    <%
        }
    %>
    </div>
</div>

<%--<div class="fenye">--%>
<%--    <div class="fy_message">--%>
<%--        共${count}条记录,${pageNo}/${pagecount}页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--%>
<%--    </div>--%>
<%--    <div class="fy_btn">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${pageNo!=1}">--%>
<%--                <a class="a"--%>
<%--                   href="${pageContext.request.contextPath }/Kp_ShowHouseServlet?way=${way}&pageNo=1&location=${location}&price=${price}&type=${type}&layout=${layout}&toward=${toward}&traffic=${traffic}">--%>
<%--                    首页</a>&nbsp&nbsp&nbsp--%>
<%--                <a class="a"--%>
<%--                   href="${pageContext.request.contextPath }/Kp_ShowHouseServlet?way=${way}&pageNo=${pageNo-1}&location=${location}&price=${price}&type=${type}&layout=${layout}&toward=${toward}&traffic=${traffic}">--%>
<%--                    上一页</a>&nbsp&nbsp&nbsp--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <c:if test="${pageNo==1}">--%>
<%--                    <a class="b">首页</a>&nbsp&nbsp&nbsp--%>
<%--                    <a class="b">上一页</a>&nbsp&nbsp&nbsp--%>
<%--                </c:if>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--        <c:if test="${pageNo!=pagecount}">--%>
<%--            <a class="a"--%>
<%--               href="${pageContext.request.contextPath }/Kp_ShowHouseServlet?way=${way}&pageNo=${pageNo+1}&location=${location}&price=${price}&type=${type}&layout=${layout}&toward=${toward}&traffic=${traffic}">--%>
<%--                下一页</a>&nbsp&nbsp&nbsp--%>
<%--            <a class="a"--%>
<%--               href="${pageContext.request.contextPath }/Kp_ShowHouseServlet?way=${way}&pageNo=${pagecount}&location=${location}&price=${price}&type=${type}&layout=${layout}&toward=${toward}&traffic=${traffic}">--%>
<%--                末页</a>--%>
<%--        </c:if>--%>
<%--        <c:if test="${pageNo==pagecount}">--%>
<%--            <a class="b">下一页</a>&nbsp&nbsp&nbsp--%>
<%--            <a class="b">末页</a>--%>
<%--        </c:if>--%>
<%--    </div>--%>
<%--</div>--%>


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
