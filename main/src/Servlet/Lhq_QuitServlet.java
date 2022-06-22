package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Lhq_QuitServlet", value = "/Lhq_QuitServlet")
public class Lhq_QuitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //清除session里用户数据
        request.getSession().removeAttribute("user_id");
        request.getSession().removeAttribute("tel");
        request.getSession().removeAttribute("uname");
        
        request.getRequestDispatcher("Kp_ShowHouseServlet?way=1").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
