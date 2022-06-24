package Servlet;

import JavaBean.LT_ShowDataBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LT_ShowDataServlet")
public class LT_ShowDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LT_ShowDataBean lt_showDataBean = new LT_ShowDataBean();
//        System.out.println(request.getParameter("flag"));
        //跳转到login.jsp
        if(request.getParameter("flag")==null||request.getParameter("flag")==""||request.getParameter("flag").equals("1")){
            //初始页面位置
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
            request.getSession().setAttribute("flag", request.getParameter("flag"));
            request.getRequestDispatcher("LT_admin.jsp").forward(request,response);
        }else if(request.getParameter("flag").equals("2")){
            //初始页面位置
            String PageNo =request.getParameter("PageNo");
            //如果初始页面位置为空则设置为第一页
            if(PageNo==null||PageNo=="")
                PageNo="1";
            //queryBillPageSize方法获取总记录条数
            Object count1 = lt_showDataBean.queryBillPageSize1();
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
            if(count==0){
                count=1;
            }
            //传输数据，调用queryBillPage方法将从数据库中获取的数据传递
            //参数pageNo为当前所在页面
            request.setAttribute("YHXX", lt_showDataBean.queryBillPage1(PageNo));
            //传输数据，调用queryBillPageSize方法传递总记录条数
            request.setAttribute("YHYS", lt_showDataBean.queryBillPageSize1());
            //传递页面总数
            request.setAttribute("count", count);
            //传递页面最大记录条数
            request.setAttribute("ts", 2);
            //传递当前页面位置
            request.getSession().setAttribute("PageNo", PageNo);
            request.getSession().setAttribute("flag", request.getParameter("flag"));
            request.getRequestDispatcher("LT_admin.jsp").forward(request,response);
        }else if(request.getParameter("flag").equals("3")){
            //初始页面位置
            String PageNo =request.getParameter("PageNo");
            //如果初始页面位置为空则设置为第一页
            if(PageNo==null||PageNo=="")
                PageNo="1";
            //queryBillPageSize方法获取总记录条数
            Object count1 = lt_showDataBean.queryBillPageSize2();
            long  count =(long) count1;
            if(count==0){
                PageNo="0";
            }
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
            request.setAttribute("YHXX", lt_showDataBean.queryBillPage2(PageNo));
            //传输数据，调用queryBillPageSize方法传递总记录条数
            request.setAttribute("YHYS", lt_showDataBean.queryBillPageSize2());
            //传递页面总数
            request.setAttribute("count", count);
            //传递页面最大记录条数
            request.setAttribute("ts", 2);
            //传递当前页面位置
            request.getSession().setAttribute("PageNo", PageNo);
            request.getSession().setAttribute("flag", request.getParameter("flag"));
            request.getRequestDispatcher("LT_admin.jsp").forward(request,response);
        }else if(request.getParameter("flag").equals("4")){
            //初始页面位置
            String PageNo =request.getParameter("PageNo");
            //如果初始页面位置为空则设置为第一页
            if(PageNo==null||PageNo=="")
                PageNo="1";
            //queryBillPageSize方法获取总记录条数
            Object count1 = lt_showDataBean.queryBillPageSize3();
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
            request.setAttribute("YHXX", lt_showDataBean.queryBillPage3(PageNo));
            //传输数据，调用queryBillPageSize方法传递总记录条数
            request.setAttribute("YHYS", lt_showDataBean.queryBillPageSize3());
            //传递页面总数
            request.setAttribute("count", count);
            //传递页面最大记录条数
            request.setAttribute("ts", 2);
            //传递当前页面位置
            request.getSession().setAttribute("PageNo", PageNo);
            request.getSession().setAttribute("flag", request.getParameter("flag"));
            request.getRequestDispatcher("LT_admin.jsp").forward(request,response);
        }else if(request.getParameter("flag").equals("5")){
            //初始页面位置
            String PageNo =request.getParameter("PageNo");
            //如果初始页面位置为空则设置为第一页
            if(PageNo==null||PageNo=="")
                PageNo="1";
            //queryBillPageSize方法获取总记录条数
            Object count1 = lt_showDataBean.queryBillPageSize4();
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
            request.setAttribute("YHXX", lt_showDataBean.queryBillPage4(PageNo));
            //传输数据，调用queryBillPageSize方法传递总记录条数
            request.setAttribute("YHYS", lt_showDataBean.queryBillPageSize4());
            //传递页面总数
            request.setAttribute("count", count);
            //传递页面最大记录条数
            request.setAttribute("ts", 2);
            //传递当前页面位置
            request.getSession().setAttribute("PageNo", PageNo);
            request.getSession().setAttribute("flag", request.getParameter("flag"));
            request.getRequestDispatcher("LT_SeeUserInfo.jsp").forward(request,response);
        }
        else if(request.getParameter("flag").equals("6")){
            String str = request.getParameter("H_id");
            request.setAttribute("FYXX", lt_showDataBean.queryBillPage5(Integer.parseInt(str)));
            request.setAttribute("photo", lt_showDataBean.queryBillPage6(Integer.parseInt(str)));
            request.getSession().setAttribute("flag", request.getParameter("flag"));
            request.getRequestDispatcher("LT_SeeApplicationInfo.jsp").forward(request,response);
        }
    }
}
