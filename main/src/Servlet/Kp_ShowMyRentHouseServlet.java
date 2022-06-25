package Servlet;

import JavaBean.Kp_ShowHouseBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Kp_ShowMyRentHouseServlet", value = "/Kp_ShowMyRentHouseServlet")
public class Kp_ShowMyRentHouseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession();

        Kp_ShowHouseBean kp_showHouseBean=new Kp_ShowHouseBean();

        String user_id= (String) session.getAttribute("user_id");//得到用户id

        if(user_id!=null){//已登录
            request.setAttribute("showMyHouse",kp_showHouseBean.ShowMyHouse(Integer.parseInt(user_id)));//调用方法得到我的租房信息
        }
        request.setAttribute("ShowAllHouse",
                kp_showHouseBean.ShowHouse("0",0,"0","","",
                        "","","","",""));//展示所有房源

        request.getRequestDispatcher("/Kp_ShowMyRentHouse.jsp").forward(request,response);//返回我的租房jsp
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
