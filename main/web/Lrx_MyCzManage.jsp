<%--
  Created by IntelliJ IDEA.
  User: LRX
  Date: 2022-06-22
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>我的出租</title>
</head>
<body>
    <div>
        <table border="1">
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
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
