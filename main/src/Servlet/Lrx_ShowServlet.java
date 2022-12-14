package Servlet;

import JavaBean.Lrx_CzDao;
import Model.H_resources;
import Model.Lodge;
import Model.Lrx_AlreadyCz;
import Model.Lrx_NotCz;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Lrx_ShowServlet", value = "/Lrx_ShowServlet")
public class Lrx_ShowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id=(String) request.getSession().getAttribute("user_id");
        Lrx_CzDao cz=new Lrx_CzDao();
        List<Lrx_AlreadyCz> list=cz.getAlreadyCz(user_id);
        request.getSession().setAttribute("List",list);
        request.getRequestDispatcher("/Lrx_MyCzManage.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
