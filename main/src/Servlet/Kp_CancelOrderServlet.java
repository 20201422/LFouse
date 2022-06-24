package Servlet;

import JavaBean.Kp_OrderBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Kp_CancelOrderServlet", value = "/Kp_CancelOrderServlet")
public class Kp_CancelOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession();

        Kp_OrderBean kp_orderBean=new Kp_OrderBean();

        String user_id= (String) session.getAttribute("user_id");//得到用户id
        int h_id= Integer.parseInt(request.getParameter("h_id"));//得到房源id

        System.out.println(h_id);

        kp_orderBean.cancelorder(Integer.parseInt(user_id),h_id);//调用方法取消租房

        request.getRequestDispatcher("Kp_ShowMyRentHouseServlet").forward(request,response);//返回我的租房Servlet
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
