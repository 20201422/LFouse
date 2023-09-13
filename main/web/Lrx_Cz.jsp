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
    <link rel="stylesheet" type="text/css" href="CSS/Kp_HeaderandFooter.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_TableStyle.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_AddCz.css" />
    <link rel="stylesheet" type="text/css" href="CSS/Lrx_Button.css" />
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <title>LFouse-出租</title>

</head>
<body>

<%
    String user_id= (String) session.getAttribute("user_id");//得到用户id
    String tel= (String) session.getAttribute("tel");//得到用户电话号码
    String uname= (String) session.getAttribute("uname");//得到用户名字
%>


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
</header>
<div>
<div>

    <form action="Lrx_CzAddServlet?user_id=<%=user_id%>" method="post" enctype="multipart/form-data">
        <div class="checkOrder_Head">
            <h1>请填写基本信息</h1>
        </div>
        <div class="message-0">
            <div class="message-1">
                <div>名称：<input type="text" name="h_name" id="h_name"></div>
                <div>户型：<input type="text" name="h_layout" id="h_layout"></div>
                <div>面积：<input placeholder="平方米" type="text" name="h_area" id="h_area"></div>
                <div>楼层：<input type="text" name="h_floor" id="h_floor"></div>
            </div>

            <div class="message-1">
                <div>
                    类型：
                    <select style="width: 100px" name="h_type" id="h_type">
                        <option>商品房</option>
                        <option>别墅</option>
                        <option>写字楼</option>
                        <option>民宿</option>
                        <option>公寓</option>
                    </select>
                </div>
                <div>
                    朝向：
                    <select style="width:100px" name="h_toward">
                        <option value="朝南">朝南</option>
                        <option value="朝北">朝北</option>
                        <option value="朝东">朝东</option>
                        <option value="朝西">朝西</option>
                        <option value="东南">东南</option>
                        <option value="西南">西南</option>
                        <option value="东北">东北</option>
                        <option value="西北">西北</option>
                    </select>
                </div>
                <div>
                    电梯：
                    <select style="width: 100px" name="h_elevator">
                        <option value="1">有</option>
                        <option value="0">无</option>
                    </select>
                </div>
            </div>
        </div>


        <div class="checkOrder_Head">
            <h1>请填写详细信息</h1>
        </div>
        <div class="message-2">
            <div>位置：<input type="text" name="h_location" id="h_location"></div>
            <div class="message-2-0">交通：
                <textarea class="message-2-1" rows="3" name="h_traffic" id="h_traffic"></textarea>
            </div>
        </div>

        <div class="checkOrder_Head">
            <h1>请勾选房屋的配置</h1>
        </div>
        <div class="message-3">
            <input type="checkbox" name="facilities" value="wifi">无线WIFI&nbsp&nbsp&nbsp&nbsp
            <input type="checkbox" name="facilities" value="TV">电视&nbsp&nbsp&nbsp&nbsp
            <input type="checkbox" name="facilities" value="shower">淋浴&nbsp&nbsp&nbsp&nbsp
            <input type="checkbox" name="facilities" value="airConditioner">空调&nbsp&nbsp&nbsp&nbsp
            <input type="checkbox" name="facilities" value="washing">洗衣机&nbsp&nbsp&nbsp&nbsp
            <input type="checkbox" name="facilities" value="refrigerator">冰箱
        </div>

        <div class="checkOrder_Head">
            <h1>您期望的月租</h1>
        </div>
        <div class="message-4">
            <input type="text" name="h_price" id="h_price">&nbsp RMB/月
        </div>
        <div class="checkOrder_Head">
            <h1>请上传房屋图片</h1>
        </div>
        <div class="message-5">
            <input type="file" name="file" id="file" >
        </div>
        <div align="center">
        <input type="button" value="添加更多图片" id="addMorePhoto">
        </div>
        <div id="morePhoto" style="display: none">
            <div class="message-5">
            <input type="file" name="file-1" id="file-1" >
            </div>
            <div class="message-5">
            <input type="file" name="file-2" id="file-2" >
            </div>
            <div class="message-5">
            <input type="file" name="file-3" id="file-3" >
            </div>
            <div class="message-5">
            <input type="file" name="file-4" id="file-4" >
            </div>
        </div>
        <script src="Script/Lrx_addMorePhoto.js"></script>
        <div class="message-6">
            <input type="submit" name="Submit" value="提交" class="btn">
            <input type="reset" value="重置" class="btn">
        </div>
    </form>
    <script src="Script/Lrx_AddHouse.js"></script>
</div>


<br><br>
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
