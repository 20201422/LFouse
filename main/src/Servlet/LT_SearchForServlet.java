package Servlet;

import JavaBean.LT_ShowDataBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LT_SearchForServlet")
public class LT_SearchForServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LT_ShowDataBean lt_showDataBean = new LT_ShowDataBean();
        //str代表搜索的1编号
        String str = request.getParameter("search");
        //str1代表判断搜索的是房源还是用户
        String str1 = request.getParameter("ForSearcchType");
        if(str==""||str==null){
            request.getRequestDispatcher("LT_ShowDataServlet").forward(request,response);
        }
        int H_id = Integer.parseInt(str);
        if(str1.equals("house")){
            request.setAttribute("searchhouse", lt_showDataBean.queryBillPage8(H_id));
        }else{
            request.setAttribute("searchuser", lt_showDataBean.queryBillPage9(H_id));
        }
        request.getRequestDispatcher("LT_SeeSearchInfo.jsp").forward(request,response);
    }
}
