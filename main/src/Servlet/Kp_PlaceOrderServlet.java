package Servlet;

import JavaBean.Kp_OrderBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "Kp_PlaceOrderServlet", value = "/Kp_PlaceOrderServlet")
public class Kp_PlaceOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Kp_OrderBean kp_orderBean=new Kp_OrderBean();

        String orderway=request.getParameter("orderway");//得到方式，1为创建订单，2为续租
        String user_id= (String) request.getSession().getAttribute("user_id");//得到用户id
        int h_id= Integer.parseInt(request.getParameter("h_id"));//得到房源id
        int lodge_limit= Integer.parseInt(request.getParameter("lodge_limit"));//得到月份
        int lodge_pway= Integer.parseInt(request.getParameter("lodge_pway"));//得到支付方式
        float lodge_price= Float.parseFloat(request.getParameter("lodge_price"));//得到支付价格

        if(Objects.equals(orderway, "1")){
            kp_orderBean.createorder(Integer.parseInt(user_id),h_id,lodge_limit,lodge_pway,lodge_price);//调用方法提交订单
        }
        else if(Objects.equals(orderway, "2")){
            kp_orderBean.goonorder(Integer.parseInt(user_id),h_id,lodge_limit,lodge_pway,lodge_price);//调用方法续租订单
        }

        request.getRequestDispatcher("Kp_ShowMyRentHouseServlet").forward(request,response);//返回我的租房Servlet

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
