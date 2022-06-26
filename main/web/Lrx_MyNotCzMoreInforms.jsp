<%@ page import="Model.Lrx_NotCzMoreInforms" %><%--
  Created by IntelliJ IDEA.
  User: LRX
  Date: 2022-06-24
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String uname= (String) session.getAttribute("uname");//得到用户名字%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_TableStyle.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_Button.css" />
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
        Lrx_NotCzMoreInforms lncmi=(Lrx_NotCzMoreInforms)request.getAttribute("oneInform");
    %>
    <div class="checkOrder_Head"><h1>你可以对这些基本信息进行修改</h1></div>
    <div class="myChangeTable">
        <form action="Lrx_ModifyServlet?h_id=<%=lncmi.getH_id()%>" method="post">
            <table>
                <tr>
                    <td colspan="2">房名：<input style="width: 305px" type="text" name="h_name" value=<%=lncmi.getH_name()%>></td>
                    <td colspan="2">房位：<input style="width: 310px" type="text" name="h_location" value=<%=lncmi.getH_location()%>></td>
                </tr>
                <tr>
                    <td>房价：<input style="width: 100px" type="text" name="h_price" value="<%=lncmi.getH_price()%>"></td>
                    <td>户型：<input style="width: 100px" type="text" name="h_layout" value=<%=lncmi.getH_layout()%>></td>
                    <td>类型：
                        <select style="width: 100px" name="h_type">
                            <option <c:if test="${oneInform.h_type=='商品房'}"> selected="selected"</c:if>>商品房</option>
                            <option <c:if test="${oneInform.h_type=='别墅'}"> selected="selected"</c:if>>别墅</option>
                            <option <c:if test="${oneInform.h_type=='写字楼'}"> selected="selected"</c:if>>写字楼</option>
                            <option <c:if test="${oneInform.h_type=='民宿'}"> selected="selected"</c:if>>民宿</option>
                            <option <c:if test="${oneInform.h_type=='公寓'}"> selected="selected"</c:if>>公寓</option>
                        </select>
                    </td>
                    <td>面积：<input style="width: 100px" type="text" name="h_area" value="<%=lncmi.getH_area()%>"></td>
                </tr>
                <tr>
                    <td>
                        楼层：<input style="width: 100px" type="text" name="h_floor" value=<%=lncmi.getH_floor()%>>
                    </td>
                    <td>朝向：
                        <select style="width: 95px" name="h_toward">
                            <option value="朝南" <c:if test="${oneInform.h_toward=='朝南'}"> selected="selected"</c:if>>朝南</option>
                            <option value="朝北" <c:if test="${oneInform.h_toward=='朝北'}"> selected="selected"</c:if>>朝北</option>
                            <option value="朝东" <c:if test="${oneInform.h_toward=='朝东'}"> selected="selected"</c:if>>朝东</option>
                            <option value="朝西" <c:if test="${oneInform.h_toward=='朝西'}"> selected="selected"</c:if>>朝西</option>
                            <option value="东南" <c:if test="${oneInform.h_toward=='东南'}"> selected="selected"</c:if>>东南</option>
                            <option value="西南" <c:if test="${oneInform.h_toward=='西南'}"> selected="selected"</c:if>>西南</option>
                            <option value="东北" <c:if test="${oneInform.h_toward=='东北'}"> selected="selected"</c:if>>东北</option>
                            <option value="西北" <c:if test="${oneInform.h_toward=='西北'}"> selected="selected"</c:if>>西北</option>
                        </select>
                    </td>
                    <td colspan="2">电梯：
                        <select style="width: 100px" name="h_elevator">
                            <option value="1" <c:if test="${oneInform.h_elevator==1}"> selected="selected"</c:if>>有</option>
                            <option value="0" <c:if test="${oneInform.h_elevator==0}"> selected="selected"</c:if>>无</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">交通情况：<input style="width: 690px" type="text" name="h_traffic" value=<%=lncmi.getH_traffic()%>></td>
                </tr>
            </table>
            <input type="submit" value="保存修改" class="btn">
           <a href="Lrx_MyNotCzManage.jsp"> <input type="button" value="返回" class="btn"> </a>
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
