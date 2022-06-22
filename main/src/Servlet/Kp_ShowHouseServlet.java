package Servlet;

import JavaBean.Kp_ShowHouseBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "Kp_ShowHouseServlet", value = "/Kp_ShowHouseServlet")
public class Kp_ShowHouseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Kp_ShowHouseBean kp_showHouseBean=new Kp_ShowHouseBean();

        String way=request.getParameter("way");//得到查找方式

        String location=request.getParameter("location");//得到选择的位置
        String traffic=request.getParameter("traffic");//得到有无地铁
        String price=request.getParameter("price");//得到选择的价格
        String type=request.getParameter("type");//得到选择的类型
        String layout=request.getParameter("layout");//得到选择的房型
        String toward=request.getParameter("toward");//得到选择的朝向
        String elevator=request.getParameter("elevator");//得到有无电梯

        String pageNo=request.getParameter("pageNo");//获取页数
        int gs=5;//一页的条数
        int count=0;//总条数
        int pagecount;//总页数

        if(Objects.equals(way, "1")){//选择的类型为位置找房
            count = kp_showHouseBean.ShowHouse("0",0,"0",location,price,type,layout,toward,elevator).size();
        }
        else if(Objects.equals(way, "2")){//选择的类型为地铁找房
            count = kp_showHouseBean.ShowHouse("0",0,traffic,location,price,type,layout,toward,elevator).size();
        }
        else if(Objects.equals(way, "3")){//选择的类型为民宿
            count = kp_showHouseBean.ShowHouse("0",0,traffic,location,price,"民宿",layout,toward,elevator).size();
        }
        else if(Objects.equals(way, "4")){//选择的类型为公寓
            count = kp_showHouseBean.ShowHouse("0",0,traffic,location,price,"公寓",layout,toward,elevator).size();
        }
        else if(Objects.equals(way, "5")){//选择的类型为别墅
            count = kp_showHouseBean.ShowHouse("0",0,traffic,location,price,"别墅",layout,toward,elevator).size();
        }
        else if(Objects.equals(way, "6")){//选择的类型为商品房
            count = kp_showHouseBean.ShowHouse("0",0,traffic,location,price,"商品房",layout,toward,elevator).size();
        }
        else if(Objects.equals(way, "7")){//选择的类型为写字楼
            count = kp_showHouseBean.ShowHouse("0",0,traffic,location,price,"写字楼",layout,toward,elevator).size();
        }

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

        request.setAttribute("location",location);//保存选择的位置
        request.setAttribute("traffic",traffic);//保存有无地铁
        request.setAttribute("price",price);//保存选择的价格
        request.setAttribute("layout",layout);//保存选择的房型
        request.setAttribute("toward",toward);//保存选择的朝向
        request.setAttribute("elevator",elevator);//保存有无电梯

        request.setAttribute("way",way);//保存查找方式

        if(count==0){//如果未找到房源，就展示所有房源
            request.setAttribute("ShowAllHouse", kp_showHouseBean.ShowHouse(pageNo,gs,"0","","","","","",""));//展示房源
        }

        if(Objects.equals(way, "1")){//选择的类型为位置找房
            request.setAttribute("type",type);//保存选择的类型
            request.setAttribute("ShowHouse", kp_showHouseBean.ShowHouse(pageNo,gs,"0",location,price,type,layout,toward,elevator));//展示房源
        }
        else if(Objects.equals(way, "2")){//选择的类型为地铁找房
            request.setAttribute("type",type);//保存选择的类型
            request.setAttribute("ShowHouse", kp_showHouseBean.ShowHouse(pageNo,gs,traffic,location,price,type,layout,toward,elevator));//展示房源
        }
        else if(Objects.equals(way, "3")){//选择的类型为民宿
            request.setAttribute("type","民宿");//保存选择的类型
            request.setAttribute("ShowHouse", kp_showHouseBean.ShowHouse(pageNo,gs,traffic,location,price,"民宿",layout,toward,elevator));//展示房源
        }
        else if(Objects.equals(way, "4")){//选择的类型为公寓
            request.setAttribute("type","公寓");//保存选择的类型
            request.setAttribute("ShowHouse", kp_showHouseBean.ShowHouse(pageNo,gs,traffic,location,price,"公寓",layout,toward,elevator));//展示房源
        }
        else if(Objects.equals(way, "5")){//选择的类型为别墅
            request.setAttribute("type","别墅");//保存选择的类型
            request.setAttribute("ShowHouse", kp_showHouseBean.ShowHouse(pageNo,gs,traffic,location,price,"别墅",layout,toward,elevator));//展示房源
        }
        else if(Objects.equals(way, "6")){//选择的类型为商品房
            request.setAttribute("type","商品房");//保存选择的类型
            request.setAttribute("ShowHouse", kp_showHouseBean.ShowHouse(pageNo,gs,traffic,location,price,"商品房",layout,toward,elevator));//展示房源
        }
        else if(Objects.equals(way, "7")){//选择的类型为写字楼
            request.setAttribute("type","写字楼");//保存选择的类型
            request.setAttribute("ShowHouse", kp_showHouseBean.ShowHouse(pageNo,gs,traffic,location,price,"写字楼",layout,toward,elevator));//展示房源
        }

        request.getRequestDispatcher("/Kp_LocationFindHouse.jsp").forward(request,response);//返回位置找房jsp

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
