<%@ page import="Model.H_resources" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Lrx_NotCz" %><%--
  Created by IntelliJ IDEA.
  User: LRX
  Date: 2022-06-24
  Time: 14:41
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

    <nav class="menu-three">
        <p><a href="Lrx_ShowServlet">已出租</a></p>
        <p><a href="Lrx_ShowNotCzServlet">未出租</a></p>
    </nav>
</header>

<c:if test="${List.size()!=0}">
    <div class="checkOrder_Head"><h1>未出租房源</h1></div>
</c:if>
<c:if test="${List.size()==0}">
    <div class="checkOrder_Head" style="min-height: 300px"><h1>暂无未出租房源</h1></div>
</c:if>
<c:forEach items="${List}" var="Lrx_NotCz" varStatus="status">
    <c:if test="${(status.index)%2==0}">
        <div class="cross">
    </c:if>
<div class="myNotCz" style="min-height: 200px;width: 45%">
    <div style="display: flex;justify-content: space-evenly;flex-wrap: nowrap;" >
        <img class="img-1" src="Image/${Lrx_NotCz.photo_name}" >
        <div>
        <table>

                <tr>
                    <td colspan="2">房屋名称：${Lrx_NotCz.h_name}</td>
                </tr>
                <tr>
                    <td colspan="2">房屋位置：${Lrx_NotCz.h_location}</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <c:if test="${Lrx_NotCz.h_status==0}">房屋状态：待审核</c:if>
                        <c:if test="${Lrx_NotCz.h_status==1}">房屋状态：待上架</c:if>
                        <c:if test="${Lrx_NotCz.h_status==2}">房屋状态：已上架</c:if>
                        <c:if test="${Lrx_NotCz.h_status==-1}"><span style="color: crimson">房屋状态：审核不通过</span></c:if>
                    </td>
                </tr>
        </table>

        <div class="MyCz-cz">
            <a href="Lrx_ShowMoreInformsServlet?h_id=${Lrx_NotCz.h_id}">查看详细信息</a>
            <c:if test="${Lrx_NotCz.h_status==0}">
                <a onclick="del(${Lrx_NotCz.h_id})">删除</a>
                <span style="color: #cccccc">上架</span>
                <span style="color: #cccccc">下架</span>
            </c:if>
            <c:if test="${Lrx_NotCz.h_status==1}">
                <a onclick="del(${Lrx_NotCz.h_id})">删除</a>
                <a href="Lrx_PutOnServlet?h_id=${Lrx_NotCz.h_id}">上架</a>
                <span style="color: #cccccc">下架</span>
            </c:if>
            <c:if test="${Lrx_NotCz.h_status==2}">
                <span style="color: #cccccc">删除</span>
                <span style="color: #cccccc">上架</span>
                <a href="Lrx_PutOffServlet?h_id=${Lrx_NotCz.h_id}">下架</a>
            </c:if>
            <c:if test="${Lrx_NotCz.h_status==-1}">
                <a onclick="del(${Lrx_NotCz.h_id})">删除</a>
                <span style="color: #cccccc">上架</span>
                <span style="color: #cccccc">下架</span>
            </c:if>
        </div>
            <script >
                function del(h_id){
                    var check=confirm('您确定要删除吗？');
                    if(!check)
                        window.location.href='Lrx_MyNotCzManage.jsp';
                    else
                        window.location.href='Lrx_Delh_resourcesServlet?h_id='+h_id+'';
                }
            </script>
        </div>
    </div>
</div>
    <c:if test="${(status.index+1)%2==0}">
        </div>
    </c:if>
</c:forEach>
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
</body>
</html>
