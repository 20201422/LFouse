package Servlet;

import JavaBean.Tong_detailinformationBean;
import Model.H_resources;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Tong_detailedinformationServlet", value = "/Tong_detailedinformationServlet")
public class Tong_detailedinformationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Tong_detailinformationBean tong_detailinformationBean = new Tong_detailinformationBean();

        String h_id= request.getParameter("h_id");
//        request.setAttribute("detailinformation", tong_detailinformationBean.detailinformation());
        request.getRequestDispatcher("/Tong_detailedinformation.jsp").forward(request,response);//返回位置找房jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
