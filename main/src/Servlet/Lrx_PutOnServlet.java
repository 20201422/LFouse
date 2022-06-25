package Servlet;

import JavaBean.Lrx_CzDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Lrx_PutOnServlet", value = "/Lrx_PutOnServlet")
public class Lrx_PutOnServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        Lrx_CzDao cz=new Lrx_CzDao();
        String h_id=request.getParameter("h_id");
        cz.PutOn(h_id);
        request.getRequestDispatcher("Lrx_ShowNotCzServlet").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
