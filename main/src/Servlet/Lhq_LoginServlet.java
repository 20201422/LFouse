package Servlet;

import JavaBean.Lhq_LoginBean;
import Model.Admin;
import Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Lhq_LoginServlet", value = "/Lhq_LoginServlet")
public class Lhq_LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        Lhq_LoginBean login=new Lhq_LoginBean();
        User user = login.findUserNoAndPassword(account,password);
        Admin admin = login.findAdminNoAndPassword(account,password);
        if(user==null&&admin==null){
            request.setAttribute("errorMsg","账号或密码错误，请重新登录！");
            request.getRequestDispatcher("/Login.jsp").forward(request,response);
        }
        else if(user==null&&admin!=null){
            request.getRequestDispatcher("/Lt_admin.jsp").forward(request,response);
        }
        else{
            request.getSession().setAttribute("user_id",user.getUser_id());
            request.getSession().setAttribute("uname",user.getUname());
            request.getSession().setAttribute("tel",user.getTel());
            request.getRequestDispatcher("/Kp_LocationFindHouse.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
