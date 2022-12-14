package Servlet;

import JavaBean.Lhq_LoginBean;
import JavaBean.Lhq_RegisterBean;
import Model.Admin;
import Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "Lhq_RegisterServlet", value = "/Lhq_RegisterServlet")
public class Lhq_RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String tel= request.getParameter("tel");
        String uname= request.getParameter("uname");
        String upwd= request.getParameter("upwd");
        String email= request.getParameter("email");
        String sex= request.getParameter("sex");
        String age= request.getParameter("age");
        String flg = request.getParameter("flg");
        String showway = request.getParameter("showway");
        String h_id = request.getParameter("h_id");
        Lhq_RegisterBean register=new Lhq_RegisterBean();
        User user = register.findTel(tel);
        if(user==null&&!Objects.equals(age,"")){
            register.add(0, tel, uname, email, upwd, sex, Integer.parseInt(age),0,0);
            request.setAttribute("errorMsg","注册成功！");
            request.setAttribute("flg",flg);
            request.setAttribute("showway",showway);
            request.setAttribute("h_id",h_id);
            request.getRequestDispatcher("/Lhq_Login.jsp").forward(request,response);

        }
        else{
            request.setAttribute("errorMsg","注册失败！该用户已存在");
            request.getRequestDispatcher("/Lhq_Register.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
