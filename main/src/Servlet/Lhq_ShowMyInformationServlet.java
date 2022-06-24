package Servlet;

import JavaBean.Lhq_ShowMyInformationBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Lhq_ShowMyInformationServlet", value = "/Lhq_ShowMyInformationServlet")
public class Lhq_ShowMyInformationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tel=(String)request.getSession().getAttribute("tel");
        Lhq_ShowMyInformationBean show=new Lhq_ShowMyInformationBean();
        request.setAttribute("ShowMyInformation",show.findUser(tel));
        request.getRequestDispatcher("/Lhq_ShowMyInformation.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}