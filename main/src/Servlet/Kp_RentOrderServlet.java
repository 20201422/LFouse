package Servlet;

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

        String h_id= request.getParameter("h_id");//得到房源id

        request.setAttribute("h_id",h_id);//保存房源id
        request.setAttribute("detailinformation", tong_detailinformationBean.detailinformation(h_id));//调用方法得到房源信息
        request.setAttribute("detailinformationfac", tong_detailinformationBean.detailinformationfac(h_id));//调用方法得到房源配置
        request.setAttribute("detailinformationuser", tong_detailinformationBean.detailinformationuser(h_id));//调用方法得到房源主人信息
        request.setAttribute("detailinformationphoto", tong_detailinformationBean.detailinformationphoto(h_id));//调用方法得到房源图片

        request.getRequestDispatcher("/Kp_RentOrder.jsp").forward(request,response);//返回订单jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
