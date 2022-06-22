package Servlet;

import JavaBean.Kp_ShowHouseBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Kp_ShowHouseServlet", value = "/Kp_ShowHouseServlet")
public class Kp_ShowHouseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Kp_ShowHouseBean kp_showHouseBean=new Kp_ShowHouseBean();

        String location=request.getParameter("location");//得到选择的位置
        String price=request.getParameter("price");//得到选择的价格
        String type=request.getParameter("type");//得到选择的类型
        String layout=request.getParameter("layout");//得到选择的房型
        String toward=request.getParameter("toward");//得到选择的朝向
        String elevator=request.getParameter("elevator");//得到有无电梯

        System.out.println(location+","+price+","+type+","+layout+","+toward+","+elevator+",");

        request.setAttribute("location",location);//保存选择的位置
        request.setAttribute("price",price);//保存选择的价格
        request.setAttribute("type",type);//保存选择的类型
        request.setAttribute("layout",layout);//保存选择的房型
        request.setAttribute("toward",toward);//保存选择的朝向
        request.setAttribute("elevator",elevator);//保存有无电梯

        request.setAttribute("ShowHouse", kp_showHouseBean.ShowHouse(location,price,type,layout,toward,elevator));//展示房源

        request.getRequestDispatcher("/Kp_LocationFindHouse.jsp").forward(request,response);//返回位置找房jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
