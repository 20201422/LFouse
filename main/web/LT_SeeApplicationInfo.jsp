<%@ page import="java.util.Objects" %>
<%@ page import="Model.H_resources" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.User" %>
<%@ page import="Model.H_facilities" %>
<%@ page import="Model.Photo" %><%--
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
<%--管理员查看申请信息--%>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/LT_admin.css" />
    <title>LFouse-申请详情</title>
</head>

<body>

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

    <nav class="LT_menu">
        <%
            String PageNo = request.getParameter("PageNo");
            List<H_facilities>list= (List<H_facilities>)request.getAttribute("FYXX");//房间配套信息
            List<Photo>list1= (List<Photo>)request.getAttribute("photo");//房间配套照片
            String H_name = request.getParameter("H_name");
        %>
        <p id="p1"><a href="LT_ShowDataServlet?flag=1&PageNo=<%=PageNo%>">全部房源</a></p>
        <p id="p2"><a href="LT_ShowDataServlet?flag=2&PageNo=<%=PageNo%>">待审批</a></p>
        <p id="p3"><a href="LT_ShowDataServlet?flag=3&PageNo=<%=PageNo%>">未出租</a></p>
        <p id="p4"><a href="LT_ShowDataServlet?flag=4&PageNo=<%=PageNo%>">已出租</a></p>
        <p id="p5"><a href="LT_ShowDataServlet?flag=5&PageNo=<%=PageNo%>">用户信息</a></p>
    </nav>

    <div class="bigbg">
        <div style="width: 100%;height: 4%;"></div>
        <div style="width: 40%;height: 80%;background-color: white;border-radius: 20px;margin-left: 9%;float: left">
            <%--<div style="margin-top: 2%;margin-left: 6%;border-radius: 20px;width: 88%;background-color: #F5F5F7">--%>
                <%--<marquee hspace="4%" vspace="5%" scrollamount="10" scrolldelay="60" behavior="alternate" onMouseOver='stop()' onMouseOut='start()'>--%>
                <%--<img style="border-radius: 20px" src="Image/公寓1.jpg" idth="100%" height="80%" border="0">--%>
                <%--<img style="border-radius: 20px" src="Image/公寓2.jpg" idth="100%" height="80%" border="0">--%>
                <%--</marquee>--%>
            <%--</div>--%>
            <div class="photo">
                <%
                    if(list1!=null&&list1.size()>0){
                    for(Photo photo:list1){
                %>
                <img class="img" src="Image/<%=photo.getPhoto_name()%>">
                <%
                        }
                    }else{
                        %>
                        <div align="center"style="margin-top: 20%">
                            <h1 style="font-family:等线 Light;">暂时没有该房源图片</h1>
                        </div>
                        <%
                    }
                %>
                <%--<img class="img" src="Image/公寓1.jpg">--%>
                <%--<img class="img" src="Image/公寓2.jpg">--%>
                <%--<img class="img" src="Image/公寓3.jpg">--%>
                <%--<img class="img" src="Image/公寓4.jpg">--%>
                <%--<img class="img" src="Image/民宿1.jpg">--%>
            </div>
        </div>
        <div style="height: 80%;border-right: solid white;float: left;margin-left: 1%"></div>
        <div style="width: 40%;height: 80%;background-color: white;border-radius: 20px;margin-left: 1%;float: left">
            <%
                if(list!=null&&list.size()>0){
                    %>
                        <div align="center" style="width: 60%;height: 10%;background-color: #0597F2;margin-left: 20%;border-radius: 24px;margin-top: 4%">
                            <font style="line-height: 200%;color: white;font-size: 20px">配套设施信息</font>
                        </div>
                        <table align="center" border="1" cellpadding="0" cellspacing="0"class="table1">
                            <tr style="background: #f5f5f7" align="center"><td colspan="4"><font>LFouse房源信息审批订单</font></td></tr>
                            <tr>
                                <td colspan="1" style="text-align: center;width: 20%">
                                    <font>名称</font>
                                </td>
                                <td colspan="3">
                                    &nbsp;<%=H_name%><br/>
                                </td>
                            </tr>
                            <tr style="background: #f5f5f7">
                                <td colspan="1" style="text-align: center;width: 20%">
                                    <font>wifi</font>
                                </td>
                                <td colspan="3">
                                    &nbsp;<%
                                    if(list.get(0).getWifi()==1){
                                %>
                                    <%="有"%>
                                    <%
                                    }
                                    else{
                                    %>
                                    <%="无"%>
                                    <%
                                        }
                                    %><br/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="1" style="text-align: center">
                                    <font>TV</font>
                                </td>
                                <td colspan="3">
                                    &nbsp;<%
                                    if(list.get(0).getTV()==1){
                                %>
                                    <%="有"%>
                                    <%
                                    }
                                    else{
                                    %>
                                    <%="无"%>
                                    <%
                                        }
                                    %><br/>
                                </td>
                            </tr>
                            <tr style="background: #f5f5f7">
                                <td style="text-align: center;width: 20%">
                                    <font>淋浴</font>
                                </td>
                                <td style="width: 30%">
                                    &nbsp;<%
                                    if(list.get(0).getTV()==1){
                                %>
                                    <%="有"%>
                                    <%
                                    }
                                    else{
                                    %>
                                    <%="无"%>
                                    <%
                                        }
                                    %><br/>
                                </td>
                                <td style="text-align: center;width: 20%">
                                    <font>空调</font>
                                </td>
                                <td>
                                    &nbsp;<%
                                    if(list.get(0).getAirConditioner()==1){
                                %>
                                    <%="有"%>
                                    <%
                                    }
                                    else{
                                    %>
                                    <%="无"%>
                                    <%
                                        }
                                    %>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <font>洗衣机</font>
                                </td>
                                <td>
                                    &nbsp;<%
                                    if(list.get(0).getWashing()==1){
                                %>
                                    <%="有"%>
                                    <%
                                    }
                                    else{
                                    %>
                                    <%="无"%>
                                    <%
                                        }
                                    %><br/>
                                </td>
                                <td style="text-align: center">
                                    <font>冰箱</font>
                                </td>
                                <td>
                                    &nbsp;<%
                                    if(list.get(0).getRefrigerator()==1){
                                %>
                                    <%="有"%>
                                    <%
                                    }
                                    else{
                                    %>
                                    <%="无"%>
                                    <%
                                        }
                                    %><br/>
                                </td>
                            </tr>
                        </table>
                    <%
                }else{
                %>
                    <div align="center"style="margin-top: 20%">
                        <h1 style="font-family:等线 Light;">暂时没有你要查找的信息</h1>
                    </div>
                <%
                }
            %>

        </div>
        <nav class="back" align="center">
            <a href="javascript:history.back(-1)"><font >返回</font></a>
        </nav>
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
