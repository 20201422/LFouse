<%@ page import="java.util.Objects" %>
<%@ page import="Model.H_resources" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: coopskywalker
  Date: 2022/6/20
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user_id= (String) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字
%>
<html>
<%--管理员查看用户信息--%>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <%--<link rel="stylesheet" type="text/css" href="CSS/Kp_ShowHouse.css" />--%>
    <link rel="stylesheet" type="text/css" href="CSS/LT_admin.css" />
    <title>LFouse-浏览用户信息</title>
</head>

<body style="min-width: 1300px;min-height: 800px">

<header>
    <div class="header">
        <img src="Image/logo.jpg" title="" alt="logo" class="logo">
        <img src="Image/name.jpg" title="" alt="LFouse" class="name">
        <span class="header_name">提供最好的租房服务</span>

        <div class="head_welcome" style="margin-right: 2%;margin-top: 1%">您好,管理员
            <div>
                <a href="Lhq_QuitServlet" class="wa">[退出]</a>
            </div>
        </div>


        <input type="hidden" value="<%=uname%>" name="uno">

    </div>
    <hr class="hr">

</header>

<div style="height: 480px;">
    <%
        String PageNo = request.getParameter("PageNo");
        String ts = "2";
        List<User> list= (List<User>)request.getAttribute("YHXX");
    %>
    <nav class="LT_menu">
        <p id="p1"><a href="LT_ShowDataServlet?ts=2&flag=1">全部房源</a></p>
        <p id="p2"><a href="LT_ShowDataServlet?ts=2&flag=2">待审批</a></p>
        <p id="p3"><a href="LT_ShowDataServlet?ts=2&flag=3">未出租</a></p>
        <p id="p4"><a href="LT_ShowDataServlet?ts=2&flag=4">已出租</a></p>
        <p id="p5"><a href="LT_ShowDataServlet?PageNo=${PageNo}&ts=2&flag=5">用户信息</a></p>
    </nav>

    <div class="bigbg">
        <div style="width: 100%;height: 4%;"></div>
        <div style="width: 40%;height: 80%;background-color: white;border-radius: 20px;margin-left: 9%;float: left">
            <div align="center" style="float: left;width: 4%;height: 6%;border-radius: 45px;background-color: #0597F2;margin-left: 45%;margin-top: 4%;color: white">${PageNo*2-1}</div><br/><br/>
            <%
                if(list.get(0).getUser_id()!=0){
            %>
            <table align="center" border="1" cellpadding="0" cellspacing="0"class="table1">
                <tr align="center"><td colspan="4"><font>LFouse用户信息</font></td></tr>
                <tr>
                    <td colspan="1" style="text-align: center;width: 20%">
                        <font>名称</font>
                    </td>
                    <td colspan="3">
                        &nbsp;<%=list.get(0).getUname()%><br/>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" style="text-align: center">
                        <font>电话号码</font>
                    </td>
                    <td colspan="3">
                        &nbsp;<%=list.get(0).getTel()%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;width: 20%">
                        <font>性别</font>
                    </td>
                    <td style="width: 30%">
                        &nbsp;<%=list.get(0).getSex()%><br/>
                    </td>
                    <td style="text-align: center;width: 20%">
                        <font>年龄</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(0).getAge()%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <font>出租数量</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(0).getLodge_num()%><br/>
                    </td>
                    <td style="text-align: center">
                        <font>租房数量</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(0).getRent_num()%><br/>
                    </td>
                </tr>
            </table>

            <%
            }else {
            %>
            <h1>暂无信息</h1>
            <%
                }
            %>
            <%--<div style="float: left;height: 8%;width: 80%;background-color: #CEE4F2;margin-top: 4%;margin-left: 10%"></div>--%>
        </div>
        <div style=";height: 80%;border-right: solid white;float: left;margin-left: 1%"></div>
        <div style="width: 40%;height: 80%;background-color: white;border-radius: 20px;margin-left: 1%;float: left">
            <%
                if(list.size()==2){
            %>
            <div align="center" style="float: left;width: 4%;height: 6%;border-radius: 45px;background-color: #0597F2;margin-left: 45%;margin-top: 4%;color: white">${PageNo*2}</div><br/><br/>
            <table align="center" border="1" cellpadding="0" cellspacing="0"class="table1">
                <tr align="center"><td colspan="4"><font>LFouse用户信息</font></td></tr>
                <tr>
                    <td colspan="1" style="text-align: center;width: 20%">
                        <font>用户名称</font>
                    </td>
                    <td colspan="3">
                        &nbsp;<%=list.get(1).getUname()%><br/>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" style="text-align: center">
                        <font>用户电话号码</font>
                    </td>
                    <td colspan="3">
                        &nbsp;<%=list.get(1).getTel()%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;width: 20%">
                        <font>用户性别</font>
                    </td>
                    <td style="width: 30%">
                        &nbsp;<%=list.get(1).getSex()%><br/>
                    </td>
                    <td style="text-align: center;width: 20%">
                        <font>用户年龄</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(1).getAge()%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <font>出租数量</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(1).getLodge_num()%><br/>
                    </td>
                    <td style="text-align: center">
                        <font>租房数量</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(1).getRent_num()%><br/>
                    </td>
                </tr>

            </table>
            <%
            }else {
            %>
            <div style="float: left;margin-left: 40%;margin-top: 20%">
                <h1>暂无信息</h1>
            </div>

            <%
                }
            %>
        </div>

    </div>
    <div  style="text-align: center;width: 73%;height: 8%;background-color: white;border-radius: 16px;margin-left: 18%;margin-top: -4%;line-height: 240%">
        <font style="color: #0597F2">共${YHYS}条记录<font/>
            <%-- /showServlet为从新转向showServlet，?pageNo=1&tiaoshu=<%=ts%>pageNo,tiaoshu为传递的两个参数--%>
            <a class="abq" href="${pageContext.request.contextPath }/LT_ShowDataServlet?PageNo=1&tiaoshu=2&flag=5">首页</a>
            <a class="abq" href="${pageContext.request.contextPath }/LT_ShowDataServlet?PageNo=${PageNo-1}&tiaoshu=2&flag=5">上一页</a>
            <font style="color: #0597F2">${PageNo}/${count}页</font>
            <a class="abq" href="${pageContext.request.contextPath }/LT_ShowDataServlet?PageNo=${PageNo+1 }&tiaoshu=2&flag=5">下一页</a>
            <a class="abq" href="${pageContext.request.contextPath }/LT_ShowDataServlet?PageNo=${count }&tiaoshu=2&flag=5">末页</a>
    </div>
</div>

<footer id="footer1">
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
