package Servlet;

import JavaBean.LT_AdminWork;
import JavaBean.LT_ShowDataBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LT_AdminWorkServlet")
public class LT_AdminWorkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LT_AdminWork lt_adminWork = new LT_AdminWork();
        LT_ShowDataBean lt_showDataBean = new LT_ShowDataBean();
        String H_id = request.getParameter("H_id");
//        System.out.println(H_id);
        int temp1 = Integer.parseInt(H_id);//将用户id改为整形
        String Type = request.getParameter("Type");
        int temp3 = Integer.parseInt(Type);
        lt_adminWork.ChangeHouseStatus(temp1,temp3);//将代表拒绝还是接受的标志改为整形
        String PageNo =request.getParameter("PageNo");
        //如果初始页面位置为空则设置为第一页
        if(PageNo==null||PageNo=="")
            PageNo="1";
        //queryBillPageSize方法获取总记录条数
        Object count1 = lt_showDataBean.queryBillPageSize();

        long  count =(long) count1;
        //每一页的记录条数//
        int PageNum =2 ;
        //如果总记录条数能够是PageNum的整数倍
        if(count%PageNum==0){
            count=count/2;
        }
        //否则count+1才是总页面数
        else{
            count=count/2+1;
        }
        //判断当前页面位置是否超过总页数
        if(Integer.parseInt(PageNo)>=count){
            //超过总页数将其设置为最大页数
            PageNo= String.valueOf(count);
        }
        //同理
        if(Integer.parseInt(PageNo)<=1){
            PageNo= "1";
        }
        //传输数据，调用queryBillPage方法将从数据库中获取的数据传递
        //参数pageNo为当前所在页面
        request.setAttribute("YHXX", lt_showDataBean.queryBillPage(PageNo));
        //传输数据，调用queryBillPageSize方法传递总记录条数
        request.setAttribute("YHYS", lt_showDataBean.queryBillPageSize());
        //传递页面总数
        request.setAttribute("count", count);
        //传递页面最大记录条数
        request.setAttribute("ts", 2);
        //传递当前页面位置
        request.getSession().setAttribute("PageNo", PageNo);
        System.out.println(request.getParameter("flag"));
        request.getSession().setAttribute("flag", request.getParameter("flag"));
        request.getRequestDispatcher("LT_admin.jsp").forward(request,response);
    }
}
