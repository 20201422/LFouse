package Servlet;

import JavaBean.Kp_OrderBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Kp_PlaceOrderServlet", value = "/Kp_PlaceOrderServlet")
public class Kp_PlaceOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Kp_OrderBean kp_orderBean=new Kp_OrderBean();

        int user_id= (int) request.getSession().getAttribute("user_id");//得到用户id
        int h_id= Integer.parseInt(request.getParameter("h_id"));//得到房源id
        int lodge_limit= Integer.parseInt(request.getParameter("lodge_limit"));//得到月份
        int lodge_pway= Integer.parseInt(request.getParameter("lodge_pway"));//得到支付方式
        float lodge_price= Float.parseFloat(request.getParameter("lodge_price"));//得到支付价格


        kp_orderBean.createorder(user_id,h_id,lodge_limit,lodge_pway,lodge_price);//调用方法提交订单

        request.getRequestDispatcher("/Kp_ShowMyRentHouse.jsp").forward(request,response);//返回我的租房jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
