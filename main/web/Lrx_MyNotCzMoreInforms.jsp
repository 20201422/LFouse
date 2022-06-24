<%@ page import="Model.Lrx_NotCzMoreInforms" %><%--
  Created by IntelliJ IDEA.
  User: LRX
  Date: 2022-06-24
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Lrx_NotCzMoreInforms lncmi=(Lrx_NotCzMoreInforms)request.getSession().getAttribute("oneInform");
    %>
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
        楼层<input type="text" name="h_floor" value=<%=lncmi.getH_floor()%>>
        <input type="submit" value="保存修改">
        <input type="reset" value="重置">
    </form>
</body>
</html>
