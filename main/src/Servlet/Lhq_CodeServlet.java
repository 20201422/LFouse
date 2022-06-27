package Servlet;

import JavaBean.SendMail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Lhq_CodeServlet", value = "/Lhq_CodeServlet")
public class Lhq_CodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String flg = request.getParameter("flg");
        String showway = request.getParameter("showway");
        String h_id = request.getParameter("h_id");
        String email=request.getParameter("email");
        String tel= request.getParameter("tel");
        String uname= request.getParameter("uname");
        String upwd= request.getParameter("upwd");
        String age= request.getParameter("age");
        String eupwd= request.getParameter("eupwd");
        //随机产生一个6位数验证码
        int num=(int)(Math.random()*900000)+100000;
        //实例化一个发送邮件的对象
        SendMail mySendMail = new SendMail();
        //根据邮箱找到该用户信息
        String message="尊敬的用户：\n您的验证码为："+num+"\n您可以注册LFouse了！";

        String n= String.valueOf(num);
        String a= String.valueOf(age);
        mySendMail.sendMail(email, message);
        request.setAttribute("num",n);
        request.setAttribute("showway",showway);
        request.setAttribute("h_id",h_id);
        request.setAttribute("flg",flg);
        request.setAttribute("tel",tel);
        request.setAttribute("uname",uname);
        request.setAttribute("upwd",upwd);
        request.setAttribute("age",a);
        request.setAttribute("email",email);
        request.setAttribute("eupwd",eupwd);
        request.getRequestDispatcher("Lhq_Register.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

}