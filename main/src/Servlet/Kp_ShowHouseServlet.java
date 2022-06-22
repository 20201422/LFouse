package Servlet;

import JavaBean.Kp_ShowHouseBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Kp_ShowHouseServlet", value = "/Kp_ShowHouseServlet")
public class Kp_ShowHouseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession();
        Kp_ShowHouseBean kp_showHouseBean=new Kp_ShowHouseBean();

        request.setAttribute("ShowHouse", kp_showHouseBean.ShowHouse());//展示耕地

        request.getRequestDispatcher("/Kp_LocationFindHouse.jsp").forward(request,response);//返回耕种jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
