package Servlet;

import JavaBean.Kp_OrderBean;
import JavaBean.Tong_detailinformationBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Kp_RentOrderServlet", value = "/Kp_RentOrderServlet")
public class Kp_RentOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Tong_detailinformationBean tong_detailinformationBean = new Tong_detailinformationBean();
        Kp_OrderBean kp_orderBean=new Kp_OrderBean();

        int h_id= Integer.parseInt(request.getParameter("h_id"));//得到房源id
        String user_id= (String) request.getSession().getAttribute("user_id");//得到用户id
        String orderway=request.getParameter("orderway");//得到方式，1为创建订单，2为续租

        request.setAttribute("h_id",h_id);//保存房源id
        request.setAttribute("orderway",orderway);//保存方式
        request.setAttribute("detailinformation",
                tong_detailinformationBean.detailinformation(h_id));//调用方法得到房源信息
        request.setAttribute("detailinformationfac",
                tong_detailinformationBean.detailinformationfac(h_id));//调用方法得到房源配置
        request.setAttribute("detailinformationuser",
                tong_detailinformationBean.detailinformationuser(h_id));//调用方法得到房源主人信息
        request.setAttribute("detailinformationphoto",
                tong_detailinformationBean.detailinformationphoto(h_id));//调用方法得到房源图片
        request.setAttribute("lodgecount",
                kp_orderBean.lodgeCount(Integer.parseInt(user_id)));//调用方法得到该用户已租信息
        request.setAttribute("FindMyresourcesHouse",
                kp_orderBean.FindMyresourcesHouse(Integer.parseInt(user_id),h_id));//调用方法找到自己的房源


        request.getRequestDispatcher("/Kp_RentOrder.jsp").forward(request,response);//返回订单jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
