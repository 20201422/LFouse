package Servlet;

import JavaBean.Kp_CollectionBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "Kp_CollectionServlet", value = "/Kp_CollectionServlet")
public class Kp_CollectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Kp_CollectionBean kp_collectionBean=new Kp_CollectionBean();

        int h_id= Integer.parseInt(request.getParameter("h_id"));//得到房源id
        String user_id= (String) request.getSession().getAttribute("user_id");//得到用户id

        String collectionway=request.getParameter("collectionway");//得到收藏方式,1为加入，2为取消

        String showway=request.getParameter("showway");//得到详细信息类型，1是从房源界面查看，2是从我的租房信息查看,3是从我的收藏查看

        if(collectionway.equals("1")){//加入收藏
            kp_collectionBean.addCollection(h_id, Integer.parseInt(user_id));//调用方法添加到收藏
        }
        else if(collectionway.equals("2")){//取消收藏
            kp_collectionBean.subtractCollection(h_id, Integer.parseInt(user_id));//调用方法取消收藏
        }
        else{
            System.out.println("收藏故障");
        }

        if(Objects.equals(showway, "3")){//从我的收藏进入的详细信息界面
            request.getRequestDispatcher("Kp_ShowMyCollectionServlet").forward(request,response);//返回我的收藏Servlet
        }
        else{
            request.getRequestDispatcher("Tong_detailedinformationServlet?h_id="+h_id).forward(request,response);//返回房源详细信息Servlet
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
