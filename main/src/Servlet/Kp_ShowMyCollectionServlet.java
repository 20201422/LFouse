package Servlet;

import JavaBean.Kp_ShowHouseBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Kp_ShowMyCollectionServlet", value = "/Kp_ShowMyCollectionServlet")
public class Kp_ShowMyCollectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Kp_ShowHouseBean kp_showHouseBean=new Kp_ShowHouseBean();

        String user_id= (String) request.getSession().getAttribute("user_id");//得到用户id

        request.setAttribute("showMyCollection",kp_showHouseBean.ShowMyCollection(Integer.parseInt(user_id)));//调用方法得到我的收藏

        request.getRequestDispatcher("Kp_ShowMyCollection.jsp").forward(request,response);//返回我的收藏jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
