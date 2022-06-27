package Servlet;

import JavaBean.Kp_CollectionBean;
import JavaBean.Kp_ShowHouseBean;
import JavaBean.Tong_detailinformationBean;
import Model.H_resources;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Tong_detailedinformationServlet", value = "/Tong_detailedinformationServlet")
public class Tong_detailedinformationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Tong_detailinformationBean tong_detailinformationBean = new Tong_detailinformationBean();
        Kp_CollectionBean kp_collectionBean=new Kp_CollectionBean();
        Kp_ShowHouseBean kp_showHouseBean=new Kp_ShowHouseBean();

        HttpSession session=request.getSession();

        String showway= request.getParameter("showway");//得到详细信息类型，1是从房源界面查看，2是从我的租房信息查看,3是从我的收藏查看

        int h_id= Integer.parseInt(request.getParameter("h_id"));//得到房源id
        String user_id= (String) session.getAttribute("user_id");//得到用户id

        if(user_id!=null&& !user_id.equals("")){//已登录
            request.setAttribute("findCollection",
                    kp_collectionBean.findCollection(h_id, Integer.parseInt(user_id)));//调用方法找到收藏信息
        }

        request.setAttribute("showway",showway);//保存类型
        request.setAttribute("h_id",h_id);//保存房源id
        request.setAttribute("detailinformation",
                tong_detailinformationBean.detailinformation(h_id));//调用方法得到房源信息
        request.setAttribute("detailinformationfac",
                tong_detailinformationBean.detailinformationfac(h_id));//调用方法得到房源配置
        request.setAttribute("detailinformationuser",
                tong_detailinformationBean.detailinformationuser(h_id));//调用方法得到房源主人信息
        request.setAttribute("detailinformationphoto",
                tong_detailinformationBean.detailinformationphoto(h_id));//调用方法得到房源图片
        request.setAttribute("ShowAllHouse",
                kp_showHouseBean.ShowHouse("0",0,"0","","",
                        "","","","",""));//展示所有房源

        request.getRequestDispatcher("/Tong_detailedinformation.jsp").forward(request,response);//返回详细信息jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
