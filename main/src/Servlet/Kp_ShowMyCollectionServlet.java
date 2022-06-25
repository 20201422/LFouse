package Servlet;

import JavaBean.Kp_CollectionBean;
import JavaBean.Kp_ShowHouseBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Kp_ShowMyCollectionServlet", value = "/Kp_ShowMyCollectionServlet")
public class Kp_ShowMyCollectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Kp_ShowHouseBean kp_showHouseBean=new Kp_ShowHouseBean();
        Kp_CollectionBean kp_collectionBean=new Kp_CollectionBean();

        String user_id= (String) request.getSession().getAttribute("user_id");//得到用户id
        String h_id=request.getParameter("h_id");

        String pageNo=request.getParameter("pageNo");//获取页数
        int gs=4;//一页的条数
        int count=0;//总条数
        int pagecount;//总页数

        count = kp_collectionBean.countCollection(Integer.parseInt(user_id)).size();//得到收藏总条数

        if(pageNo==null|| pageNo.equals(""))//如果页数为空则赋值为1
            pageNo="1";

        if(count%gs==0){//总页数
            pagecount=count/gs;
        }
        else{
            pagecount=count/gs+1;
        }
        if(Integer.parseInt(pageNo)>=pagecount){//超过总页数将其设置为最大页数
            pageNo= String.valueOf(pagecount);
        }
        if(Integer.parseInt(pageNo)<=1){//低于1页将其设置为1
            pageNo= "1";
        }

        request.setAttribute("count", count);//保存总条数
        request.setAttribute("pagecount", pagecount);//保存总页数
        request.getSession().setAttribute("pageNo", pageNo);//session保存当前页数

        request.setAttribute("showMyCollection",kp_showHouseBean.ShowMyCollection(pageNo,gs,Integer.parseInt(user_id)));//调用方法得到我的收藏

        request.getRequestDispatcher("Kp_ShowMyCollection.jsp").forward(request,response);//返回我的收藏jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
