package Servlet;

import JavaBean.Lrx_CzDao;
import Model.H_resources;
import Model.Lodge;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Lrx_ShowServlet", value = "/Lrx_ShowServlet")
public class Lrx_ShowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id="3";
        Lrx_CzDao cz=new Lrx_CzDao();
        List<Lodge> list=cz.getAll(user_id);
        request.getSession().setAttribute("lodgeList",list);
        request.getRequestDispatcher("/Lrx_MyCzManage.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
