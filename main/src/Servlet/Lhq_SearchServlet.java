package Servlet;

import JavaBean.Lhq_SearchBean;
import JavaBean.Lhq_SendMailBean;
import Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Lhq_SearchServlet", value = "/Lhq_SearchServlet")
public class Lhq_SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String flg = request.getParameter("flg");
        String showway = request.getParameter("showway");
        String h_id = request.getParameter("h_id");
        request.setAttribute("flg",flg);
        request.setAttribute("showway",showway);
        request.setAttribute("h_id",h_id);
        Lhq_SearchBean search=new Lhq_SearchBean();
        User user = search.findEmail(email,tel);
        //实例化一个发送邮件的对象
        Lhq_SendMailBean myLhqSendMailBean = new Lhq_SendMailBean();
        //根据邮箱找到该用户信息
        if(user!=null) {
            String message="尊敬的 "+user.getUname()+"：<br>您的密码为："+user.getUpwd()+"<br>您的账号通过LFouse平台已找回！";
            myLhqSendMailBean.sendMail(email, message);
            request.setAttribute("errorMsg","密码已发送到您的邮箱！");
            request.getRequestDispatcher("/Lhq_Login.jsp").forward(request,response);
        }
        else {
            if(search.findTel(tel)==null)
                request.setAttribute("errorMsg", "该电话尚未注册！");
            if(search.findmail(email)==null)
                request.setAttribute("errorMsg", "该邮箱尚未注册！");
            if(search.findTel(tel)!=null&&search.findmail(email)!=null)
                request.setAttribute("errorMsg", "电话和邮箱不匹配！");
        }
        request.getRequestDispatcher("/Lhq_Search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
