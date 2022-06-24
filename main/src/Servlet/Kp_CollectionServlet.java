package Servlet;

import JavaBean.Kp_CollectionBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Kp_CollectionServlet", value = "/Kp_CollectionServlet")
public class Kp_CollectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Kp_CollectionBean kp_collectionBean=new Kp_CollectionBean();

        int h_id= Integer.parseInt(request.getParameter("h_id"));//得到房源id
        String user_id= (String) request.getSession().getAttribute("user_id");//得到用户id

        String way=request.getParameter("way");//得到收藏方式,1为加入，2为取消

        if(way.equals("1")){//加入收藏
            kp_collectionBean.addCollection(h_id, Integer.parseInt(user_id));//调用方法添加到收藏
        }
        else if(way.equals("2")){//取消收藏
            kp_collectionBean.subtractCollection(h_id, Integer.parseInt(user_id));//调用方法取消收藏
        }
        else{
            System.out.println("收藏故障");
        }

        request.getRequestDispatcher("Tong_detailedinformationServlet?way="+way+"h_id="+h_id).forward(request,response);//返回房源详细信息Servlet
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
