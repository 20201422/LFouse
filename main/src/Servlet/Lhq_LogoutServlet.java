package Servlet;

import JavaBean.Lhq_LogoutBean;
import Model.Lodge;
import Model.User;
import javafx.scene.web.HTMLEditor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Lhq_LogoutServlet", value = "/Lhq_LogoutServlet")
public class Lhq_LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String user_id=(String)request.getSession().getAttribute("user_id");
        Lhq_LogoutBean check = new Lhq_LogoutBean();
        User user = check.checkUser(user_id);
        PrintWriter out = response.getWriter();
        out.print("<script >var check=confirm('您确定要注销吗？');if(!check){window.location.href='Lhq_ShowMyInformationServlet';}</script>");
        out.print("<script >var check=confirm('您确定要注销吗？');if(!check){window.location.href='Lhq_ShowMyInformationServlet';}</script>");
        if(user!=null){
            check.DeleteCollection(user_id);
            check.DeleteLodge(user_id);
            check.DeleteUser(user_id);
            out.print("<script >alert('注销成功！');window.location.href='Lhq_QuitServlet'</script>");
        }
        else{
            out.print("<script >alert('注销失败，正在租房或房屋正在出租！');window.location.href='Kp_ShowHouseServlet?way=1'</script>");
        }
//        request.getRequestDispatcher("Kp_ShowHouseServlet?way=1").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
