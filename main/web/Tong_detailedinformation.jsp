<%--
  Created by IntelliJ IDEA.
  User: xxd
  Date: 2022/6/22
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.*" %>
<%@ page import="JavaBean.Kp_CollectionBean" %>
<%@ page import="java.util.Objects" %>
<%
    String user_id= (String) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字

    String showway= (String) request.getAttribute("showway");//得到类型

    H_resources h_resources= (H_resources) request.getAttribute("detailinformation");//得到房源信息
    H_facilities h_facilities= (H_facilities) request.getAttribute("detailinformationfac");//得到房源配置
    User user= (User) request.getAttribute("detailinformationuser");//得到房源主人信息
    List<Photo> photolist= (List<Photo>) request.getAttribute("detailinformationphoto");//得到房源图片
    Collection collection= (Collection) request.getAttribute("findCollection");//得到收藏信息
    List<H_resources> alllist= (List<H_resources>) request.getAttribute("ShowAllHouse");//得到我的租房信息

%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS/Tong_detailedinformation.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Kp_MaybeLike.css" />
    <title>LFouse-房源信息</title>
</head>

<body>
<%--头部--%>
<header>
    <div class="header">
        <img src="Image/logo.jpg" title="" alt="logo" class="logo" onclick="window.location.href='index.jsp'">
        <img src="Image/name.jpg" title="" alt="LFouse" class="name" onclick="window.location.href='index.jsp'">
        <span class="header_name">提供最好的租房服务</span>
        <%
            if(tel==null|| tel.equals("")){//未登录
        %>
        <div class="head_welcome">
            您好，<a href="Lhq_Login.jsp?flg=Tong_detailedinformationServlet&showway=1&h_id=${h_id}" class="wa">请登录</a>（支持IPv6访问）<br>
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
</header>

<%--中间body--%>
<div class="wrap">

    <div class="title">
        <div class="title-name">
            <h1><%=h_resources.getH_name()%></h1>
            <%
                if (h_resources.getH_status() == 3 && !Objects.equals(showway, "2")) {
            %>
            <h1 class="title-error">（已租出）</h1>
            <%
                }
            %>
        </div>
        <div class="title-message">
            <p class="information-title-price"><%=h_resources.getH_price()%></p>
            <p class="information-title-price-a">RMB/月</p>&nbsp&nbsp&nbsp&nbsp&nbsp
            <p class="information-title-layout"><%=h_resources.getH_layout()%></p>&nbsp&nbsp&nbsp&nbsp&nbsp
            <p class="information-title-area"><%=h_resources.getH_area()%></p>
            <p class="information-title-area-a">平方米</p>&nbsp&nbsp&nbsp&nbsp&nbsp
            <p class="information-title-toward"><%=h_resources.getH_toward()%></p>
        </div>
    </div>
    <div class="photo">
        <%
            for(Photo photo:photolist){
        %>
        <img class="img" src="Image/<%=photo.getPhoto_name()%>">
        <%
            }
        %>
    </div>

    <div class="nr">
        <div class="nr-message">
            <h2>房屋信息</h2>
            <table>
                <tr>
                    <td>类型：<%=h_resources.getH_type()%></td>
                    <%
                        if(Objects.equals(h_resources.getH_layout(), "")||
                                (h_resources.getH_layout()==null)){//户型为空（用于写字楼）
                    %>
                    <td>户型：暂无</td>
                    <%
                    }else{//户型不为空（用于写字楼）
                    %>
                    <td>户型：<%=h_resources.getH_layout()%></td>
                    <%
                        }
                    %>
                </tr>
                <tr>
                    <td>楼层：<%=h_resources.getH_floor()%></td>
                    <td>面积：<%=h_resources.getH_area()%></td>
                </tr>
                <tr>
                    <td>朝向：<%=h_resources.getH_toward()%></td>
                    <%if(h_resources.isH_elevator()){%>
                    <td>有电梯</td>
                    <%}else{%>
                    <td class="error">无电梯</td>
                    <%}%>
                </tr>
                <tr>
                    <td colspan="2">位置：<%=h_resources.getH_location()%></td>
                </tr>
                <tr>
                    <td colspan="2">交通：<%=h_resources.getH_traffic()%></td>
                </tr>
            </table>
        </div>

        <div class="facilities">
            <h2>房屋配置</h2>
            <table class="table1">
                <tr>
                    <%if(h_facilities.getWifi()==1){%>
                    <td> Wi-Fi：有</td>
                        <%}else{%>
                        <td class="error">Wi-Fi：无</td>
                        <%}%>
                    <%if(h_facilities.getTV()==1){%>
                    <td>电视：有</td>
                        <%}else{%>
                    <td class="error">电视：无</td>
                        <%}%>
                    <%if(h_facilities.getWashing()==1){%>
                    <td>洗衣机：有</td>
                        <%}else{%>
                    <td class="error">洗衣机：无</td>
                        <%}%>
                </tr>
                <tr>
                    <%if(h_facilities.getShower()==1){%>
                    <td>热水器：有</td>
                        <%}else{%>
                    <td class="error">热水器：无</td>
                        <%}%>
                    <%if(h_facilities.getAirConditioner()==1){%>
                        <td>空调：有</td>
                        <%}else{%>
                    <td class="error">空调：无</td>
                        <%}%>
                    <%if(h_facilities.getRefrigerator()==1){%>
                    <td>冰箱：有</td>
                        <%}else{%>
                    <td class="error">冰箱：无</td>
                        <%}%>
                </tr>
            </table>
            <h2>屋主信息</h2>
            <table>
                <tr>
                    <td>姓名：<%=user.getUname()%></td>
                    <td>联系方式：<%=user.getTel()%></td>
                </tr>
                <tr>
                    <td>性别：<%=user.getSex()%></td>
                    <td>年龄：<%=user.getAge()%></td>
                </tr>
            </table>
        </div>
    </div>

    <%
        if(Objects.equals(showway, "1")){//方式1，由房源界面进入
    %>
    <div class="check">
        <%
            if(tel==null|| tel.equals("")){//未登录
        %>
        <a href="Lhq_Login.jsp?flg=Tong_detailedinformationServlet&showway=1&h_id=${h_id}">加入收藏</a>
        <a href="Lhq_Login.jsp?flg=Tong_detailedinformationServlet&showway=1&h_id=${h_id}">我要租房</a>
        <%
        }else{//已登录
        %>
        <%
            if(collection==null){//未加入收藏
        %>
        <a href="Kp_CollectionServlet?collectionway=1&showway=1&h_id=${h_id}">加入收藏</a>
        <%
        }else{//已加入到收藏
        %>
        <p class="error-no">已添加到收藏</p>
        <a href="Kp_CollectionServlet?collectionway=2&showway=1&h_id=${h_id}">取消收藏</a>
        <%
            }
        %>
        <%
            if(h_resources.getH_status()==3){//已租出
        %>
        <p class="error-no">我要租房</p>
        <%
        }else{//未租出
        %>
        <a href="Kp_RentOrderServlet?showway=1&orderway=1&h_id=${h_id}">我要租房</a>
        <%
            }
        %>
        <%
            }
        %>
    </div>
    <%
        }else if(Objects.equals(showway, "2")){//方式2，由我的租房界面进入
    %>
    <div class="check">
        <%
            if(collection==null){//未加入收藏
        %>
        <a href="Kp_CollectionServlet?collectionway=1&showway=2&h_id=${h_id}">加入收藏</a>
        <%
        }else{//已加入到收藏
        %>
        <p class="error-no">已添加到收藏</p>
        <a href="Kp_CollectionServlet?collectionway=2&showway=2&h_id=${h_id}">取消收藏</a>
        <%
            }
        %>
    </div>
    <%
        }else if(Objects.equals(showway, "3")){//方式3，由我的收藏界面进入
    %>
    <div class="check">
        <%
            if(collection==null){//未加入收藏
        %>
        <a href="Kp_CollectionServlet?collectionway=1&showway=3&h_id=${h_id}">加入收藏</a>
        <%
        }else{//已加入到收藏
        %>
        <p class="error-no">已添加到收藏</p>
        <a href="Kp_CollectionServlet?collectionway=2&showway=3&h_id=${h_id}">取消收藏</a>
        <%
            }
        %>
    </div>
    <%
        }
    %>

</div>

<div class="like">
    <hr>
    <p class="like-title">猜你喜欢</p>
    <div class="maybelike">
        <%
            if(alllist!=null){
                for(H_resources h_resource:alllist){
                    if(h_resource.getH_id()!= h_resources.getH_id()){
                        request.setAttribute("h_resorces",h_resource);
        %>
        <div class="ShowHouse" onclick="
                window.location.href='Tong_detailedinformationServlet?showway=1&h_id=<%=h_resource.getH_id()%>'">
            <div class="img">
                <img class="img" src="Image/<%=h_resource.getPhoto_name()%>" alt="<%=h_resource.getH_name()%>"
                     title="<%=h_resource.getH_name()%>">
            </div>
            <div class="message">
                <div class="House_Message0">
                    <p class="title-error0"><%=h_resource.getH_name()%></p>
                </div>
                <div class="House_Message2">
                    <p>
                        <%
                            if(Objects.equals(h_resources.getH_layout(), "")||
                                    (h_resources.getH_layout()==null)){//户型为空（用于写字楼）
                        %>
                        户型：暂无&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <%
                        }else{//户型不为空（用于写字楼）
                        %>
                        户型：<%=h_resource.getH_layout()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <%
                            }
                        %>
                        面积：<%=h_resource.getH_area()%>平米&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    </p>
                </div>
                <div class="House_Message3">
                    <p>价格：<%=h_resource.getH_price()%></p>
                    <p class="House_Message3-a">RMB/月&nbsp&nbsp&nbsp&nbsp</p>
                </div>
            </div>
        </div>
        <%
                    }
                }
            }
        %>
    </div>
</div>

<%--尾巴--%>
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