package Servlet;

import JavaBean.Lrx_CzDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Lrx_ModifyServlet", value = "/Lrx_ModifyServlet")
public class Lrx_ModifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        Lrx_CzDao cz=new Lrx_CzDao();
        String h_id=request.getParameter("h_id");
        String h_name=request.getParameter("h_name");
        String h_location=request.getParameter("h_location");
        String h_price=request.getParameter("h_price");
        String h_layout=request.getParameter("h_layout");
        String h_type=request.getParameter("h_type");
        String h_area=request.getParameter("h_area");
        String h_elevator=request.getParameter("h_elevator");
        String h_toward=request.getParameter("h_toward");
        String h_traffic=request.getParameter("h_traffic");
        String h_floor=request.getParameter("h_floor");
        //System.out.println(h_name);
        cz.Modify(h_id,h_name,h_location,h_price,h_layout,h_type,h_area,h_elevator,h_toward,h_traffic,h_floor);
        request.getRequestDispatcher("Lrx_ShowNotCzServlet").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
