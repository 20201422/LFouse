<%--
  Created by IntelliJ IDEA.
  User: LRX
  Date: 2022-06-22
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>出租界面</title>
</head>
<body>

    <form action="Lrx_CzAddServlet" method="post" enctype="multipart/form-data">
        房子名称：<input type="text" name="h_name"><br>
        位置：<input type="text" name="h_location"><br>
        价格：<input type="text" name="h_price"><br>
        户型：<input type="text" name="h_layout"><br>
        类型：<input type="text" name="h_type"><br>
        面积：<input type="text" name="h_area"><br>
        是否有电梯：<input type="text" name="h_elevator"><br>
        朝向：<input type="text" name="h_toward"><br>
        交通状况：<input type="text" name="h_traffic"><br>
        楼层：<input type="text" name="h_floor"><br>
        <input type="hidden" name="id" value="">
        商品展示<input type="file" name="file" id="file">
        <input type="submit" name="Submit" value="上传">
    </form>
</body>
</html>
