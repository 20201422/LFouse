<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2022-06-21
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="Test02Servlet" method="post" enctype="multipart/form-data" name="form1">
        <input type="hidden" name="id" value="">
        商品展示<input type="file" name="file" id="file">
        <input type="submit" name="Submit" value="上传">
    </form>
</body>
</html>
