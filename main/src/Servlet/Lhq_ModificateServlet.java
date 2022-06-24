package Servlet;

import JavaBean.Lhq_ShowMyInformationBean;
import Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Lhq_ModificateServlet", value = "/Lhq_ModificateServlet")
public class Lhq_ModificateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tel=request.getParameter("tel");
        String newupwd=request.getParameter("newupwd");
        Lhq_ShowMyInformationBean show=new Lhq_ShowMyInformationBean();
        show.Modificate(tel,newupwd);
        request.setAttribute("errorMsg","密码修改成功！");
        request.getRequestDispatcher("/Lhq_Login.jsp?flg=Kp_ShowHouseServlet").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
