package Servlet;

import JavaBean.Lhq_ShowMyInformationBean;
import Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "Lhq_UpdateServlet", value = "/Lhq_UpdateServlet")
public class Lhq_UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String user_id= request.getParameter("user_id");
        String tel= request.getParameter("tel");
        String uname= request.getParameter("uname");
        String email= request.getParameter("email");
        String sex= request.getParameter("sex");
        String age= request.getParameter("age");
        Lhq_ShowMyInformationBean show=new Lhq_ShowMyInformationBean();
        User user=show.check(tel);
            if (!Objects.equals(user_id, "") && !Objects.equals(age, ""))
                show.editor(Integer.parseInt(user_id), tel, uname, email, sex, Integer.parseInt(age));
            if(user!=null) {
                request.setAttribute("ShowMyInformation",show.findUser(tel));
                request.getRequestDispatcher("/Lhq_ShowMyInformation.jsp").forward(request,response);
            }
            else {
                request.getRequestDispatcher("/Lhq_Login.jsp?flg=Kp_ShowHouseServlet").forward(request, response);
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
