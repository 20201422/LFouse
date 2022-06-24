package Servlet;

import JavaBean.Lhq_ShowMyInformationBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Lhq_EditorServlet", value = "/Lhq_EditorServlet")
public class Lhq_EditorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tel=request.getParameter("ntel");
        Lhq_ShowMyInformationBean show=new Lhq_ShowMyInformationBean();
        request.setAttribute("ShowMyInformation",show.findUser(tel));
        request.getRequestDispatcher("/Lhq_EditorUser.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
