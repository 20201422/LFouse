package Servlet;

import JavaBean.Lrx_CzDao;
import Model.Lrx_NotCzMoreInforms;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Lrx_ShowMoreInformsServlet", value = "/Lrx_ShowMoreInformsServlet")
public class Lrx_ShowMoreInformsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String h_id=request.getParameter("h_id");
        Lrx_CzDao cz=new Lrx_CzDao();
        Lrx_NotCzMoreInforms ln=cz.getNorCzMoreInforms(h_id);
        //System.out.println(ln.getH_name());
        request.setAttribute("oneInform",ln);
        request.getRequestDispatcher("/Lrx_MyNotCzMoreInforms.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
