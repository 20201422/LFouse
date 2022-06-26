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
<%--管理员主界面--%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <%--<link rel="stylesheet" type="text/css" href="CSS/Kp_ShowHouse.css" />--%>
    <link rel="stylesheet" type="text/css" href="CSS/LT_admin.css" />
    <title>LFouse-管理员</title>
</head>

<body style="min-width: 1350px;min-height: 800px">

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

<div style="height: 67%;margin-top: 1%">
    <%
        List<H_resources>list= (List<H_resources>)request.getAttribute("searchhouse");
        List<User>list1= (List<User>)request.getAttribute("searchuser");
    %>
    <nav class="LT_menu">
        <p id="p1"><a href="LT_ShowDataServlet?PageNo=${PageNo}&ts=2&flag=1">全部房源</a></p>
        <p id="p2"><a href="LT_ShowDataServlet?ts=2&flag=2">待审批</a></p>
        <p id="p3"><a href="LT_ShowDataServlet?ts=2&flag=3">未出租</a></p>
        <p id="p4"><a href="LT_ShowDataServlet?ts=2&flag=4">已出租</a></p>
        <p id="p5"><a href="LT_ShowDataServlet?ts=2&flag=5">用户信息</a></p>
    </nav>

    <div class="bigbg">
        <div style="height: 3%"></div>
        <form name=form1 method="post" action="LT_SearchForServlet">
            <%
            if(list!=null){
                %>
                    <div style="margin-left: 9%;width: 80%;height: 8%;background-color: #F5F5F7;">
                        <input style="height: 60%;float: left;border-radius: 10px" type="text" placeholder="搜索房源编号"name="search">
                        <a href="javascript:document.form1.submit()">
                            <img style="height: 50%;margin-left: -28px;margin-top: 2px" src="Image/搜索图标1jpg">
                        </a>
                        <%--此处是为了判断搜索的是房源编号还是用户--%>
                        <input type="hidden" id="ForSearcchType" name="ForSearcchType" value="house">
                    </div>
                <%
            } else {
                %>
                    <div style="margin-left: 9%;width: 80%;height: 8%;background-color: #F5F5F7;">
                        <input style="height: 60%;float: left;border-radius: 10px" type="text" placeholder="搜索用户编号"name="search">
                        <a href="javascript:document.form1.submit()">
                            <img style="height: 50%;margin-left: -28px;margin-top: 2px" src="Image/搜索图标1jpg">
                        </a>
                        <%--此处是为了判断搜索的是房源编号还是用户--%>
                        <input type="hidden" id="ForSearcchType" name="ForSearcchType" value="user">
                    </div>
                <%
            }
            %>
        </form>


        <%--<%--%>
        <%--if(request.getParameter("search")==""||request.getParameter("search")==null){--%>
        <%----%>
        <%--}--%>
        <%--%>--%>

        <div style="width: 40%;height: 70%;background-color: white;border-radius: 20px;margin-left: 30%;float: left;">

            <div class="h_id" align="center" >1</div><br/><br/>
            <%
                if(list!=null&&list.size()>0){
            %>
            <table align="center" cellspacing="0" cellpadding="0" class="table1">
                <tr align="center"><td colspan="4"><font>LFouse房源信息审批订单</font></td></tr>
                <tr>
                    <td colspan="1" style="text-align: center;width: 20%">
                        <font>编号：<%=list.get(0).getH_id()%></font>
                    </td>
                    <td colspan="3" align="center">
                        &nbsp;<%=list.get(0).getH_name()%><br/>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" style="text-align: center">
                        <font>房源位置</font>
                    </td>
                    <td colspan="3">
                        &nbsp;<%=list.get(0).getH_location()%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;width: 20%">
                        <font>房源价格</font>
                    </td>
                    <td style="width: 30%">
                        &nbsp;<%=list.get(0).getH_price()%><br/>
                    </td>
                    <td style="text-align: center;width: 20%">
                        <font>户型</font>
                    </td>
                    <td>
                        &nbsp;
                        <%if(list.get(0).getH_layout()==null||list.get(0).getH_layout()==""){
                        %><%="暂无"%><%
                    }else{
                    %><%=list.get(0).getH_layout()%><%
                        }%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <font>类型</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(0).getH_type()%><br/>
                    </td>
                    <td style="text-align: center">
                        <font>面积</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(0).getH_area()%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <font>有无电梯</font>
                    </td>
                    <td>
                        &nbsp;
                        <%if(list.get(0).isH_elevator()){
                        %><%="有电梯"%><%
                    }else{
                    %><%="无电梯"%><%
                        }%><br/>
                    </td>
                    <td style="text-align: center">
                        <font>朝向</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(0).getH_toward()%><br/>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" style="text-align: center">
                        <font>交通情况</font>
                    </td>
                    <td colspan="3">
                        &nbsp;<%=list.get(0).getH_traffic()%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <font>楼层</font>
                    </td>
                    <td>
                        &nbsp;<%=list.get(0).getH_floor()%><br/>
                    </td>
                    <td style="text-align: center">
                        <font>目前状态</font>
                    </td>
                    <td>
                        &nbsp;
                        <%if(list.get(0).getH_status()==0){
                        %><%="待审批"%><%
                    }else if(list.get(0).getH_status()==1){
                    %><%="待上架"%><%
                    }else if(list.get(0).getH_status()==2){
                    %><%="未出租"%><%
                    }else if(list.get(0).getH_status()==3){
                    %><%="已出租"%><%
                        }
                    %><br/>
                    </td>
                </tr>
            </table>
            <nav class="LT_div" style="float: left;height: 8%;width: 80%;background-color: #0597F2;margin-top: 4%;margin-left: 10%;border-radius: 24px">
                <%
                    if(list.get(0).getH_status()==2){
                %>
                <%--flag为传递的参数，用于判断跳转的页面--%>
                <a class="abq2"  href="LT_RefuseApplication.jsp?flag=2&PageNo=${PageNo}&H_id=<%=list.get(0).getH_id()%>&Type=1">打回</a>
                <a class="abq2"  href="LT_ShowDataServlet?flag=6&PageNo=${PageNo}&H_name=<%=list.get(0).getH_name()%>&H_id=<%=list.get(0).getH_id()%>">详情</a>
                <%
                }else if(list.get(0).getH_status()==3){
                %>
                <%--<a class="abq3" style="color: white"></a>--%>
                <a class="abq1"  href="LT_ShowDataServlet?flag=6&PageNo=${PageNo}&H_name=<%=list.get(0).getH_name()%>&H_id=<%=list.get(0).getH_id()%>">详情</a>
                <%--<a class="abq3" style="color: white"></a>--%>
                <%
                }else if(list.get(0).getH_status()==1){
                %>
                <%--<a class="abq1" style="color: white"></a>--%>
                <a class="abq1"  href="LT_ShowDataServlet?flag=6&PageNo=${PageNo}&H_name=<%=list.get(0).getH_name()%>&H_id=<%=list.get(0).getH_id()%>">详情</a>
                <%--<a class="abq1" style="color: white"></a>--%>
                <%
                }else {
                %>
                <a class="abq0" style="color: white" href="LT_RefuseApplication.jsp?flag=2&PageNo=${PageNo}&H_id=<%=list.get(0).getH_id()%>&Type=1">打回</a>
                <a class="abq0" style="color: white" href="LT_ShowDataServlet?flag=6&PageNo=${PageNo}&H_name=<%=list.get(0).getH_name()%>&H_id=<%=list.get(0).getH_id()%>">详情</a>
                <a class="abq0" style="color: white" href="LT_RefuseApplication.jsp?flag=2&PageNo=${PageNo}&H_id=<%=list.get(0).getH_id()%>&Type=3">通过</a>
                <%
                    }
                %>
            </nav>
            <%
            }else if(list1!=null&&list1.size()>0) {
            %>
            <table align="center" border="1" cellpadding="0" cellspacing="0"class="table1">
                <tr align="center"><td colspan="4"><font>LFouse用户信息</font></td></tr>
                <tr>
                    <td colspan="1" style="text-align: center;width: 20%">
                        <font>名称</font>
                    </td>
                    <td colspan="3">
                        &nbsp;<%=list1.get(0).getUname()%><br/>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" style="text-align: center">
                        <font>电话号码</font>
                    </td>
                    <td colspan="3">
                        &nbsp;<%=list1.get(0).getTel()%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;width: 20%">
                        <font>性别</font>
                    </td>
                    <td style="width: 30%">
                        &nbsp;<%=list1.get(0).getSex()%><br/>
                    </td>
                    <td style="text-align: center;width: 20%">
                        <font>年龄</font>
                    </td>
                    <td>
                        &nbsp;<%=list1.get(0).getAge()%><br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <font>出租数量</font>
                    </td>
                    <td>
                        &nbsp;<%=list1.get(0).getLodge_num()%><br/>
                    </td>
                    <td style="text-align: center">
                        <font>租房数量</font>
                    </td>
                    <td>
                        &nbsp;<%=list1.get(0).getRent_num()%><br/>
                    </td>
                </tr>
            </table>
            <%
                }else {
                    %>
                        <div align="center"style="margin-top: 20%">
                            <h1>暂无信息</h1>
                        </div>

                    <%
                }
            %>

            <%--<div style="float: left;height: 8%;width: 80%;background-color: #CEE4F2;margin-top: 4%;margin-left: 10%"></div>--%>
        </div>

        <nav style="margin-left: 40%" class="back" align="center">
            <a href="javascript:history.back(-1)"><font >返回</font></a>
        </nav>
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
