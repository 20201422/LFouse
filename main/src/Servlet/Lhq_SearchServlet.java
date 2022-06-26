package Servlet;

import JavaBean.Lhq_SearchBean;
import JavaBean.SendMail;
import Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Lhq_SearchServlet", value = "/Lhq_SearchServlet")
public class Lhq_SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String email = request.getParameter("email");
        Lhq_SearchBean search=new Lhq_SearchBean();
        User user = search.findEmail(email);
        //实例化一个发送邮件的对象
        SendMail mySendMail = new SendMail();
        //根据邮箱找到该用户信息
        if(user!=null) {
            String message="尊敬的 "+user.getUname()+"：\n您的密码为："+user.getUpwd()+"\n您的账号通过LFouse平台已找回！";
            mySendMail.sendMail(email, message);
            request.setAttribute("errorMsg","找回密码成功！");
            request.getRequestDispatcher("/Lhq_Login.jsp").forward(request,response);
        }
        request.setAttribute("errorMsg","该邮箱尚未注册！");
        request.getRequestDispatcher("/Lhq_Search.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
