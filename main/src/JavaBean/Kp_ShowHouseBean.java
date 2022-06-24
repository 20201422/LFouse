package JavaBean;

import Model.H_resources;
import Model.Lodge;
import Model.User;

import org.junit.Test;

import java.util.List;
import java.util.Objects;

public class Kp_ShowHouseBean extends BaseDao{

    public List<H_resources> ShowHouse(String pageNo,int gs,String traffic,String location,String price,String type,String layout,String toward,String elevator){

        String sql="select * from h_resources,photo where h_resources.h_id=photo.h_id and (h_status=2 or h_status=3)";

        if(!Objects.equals(location, "全部")&&location!=null
                &&!Objects.equals(location, "null")&&!Objects.equals(location, "")){//添加位置搜素
            sql=sql+" and h_location like '%"+location+"%'";
        }
        if(!Objects.equals(price, "全部")&&price!=null
                &&!Objects.equals(price, "null")&&!Objects.equals(price, "")){//添加价格搜素
            if(Objects.equals(price, "1"))
                sql=sql+" and h_price<=1000";
            else if(Objects.equals(price, "2"))
                sql=sql+" and h_price>=1000 and h_price<=3000";
            else if(Objects.equals(price, "3"))
                sql=sql+" and h_price>=3000 and h_price<=5000";
            else if(Objects.equals(price, "4"))
                sql=sql+" and h_price>=5000 and h_price<=8000";
            else if(Objects.equals(price, "5"))
                sql=sql+" and h_price>=8000";
        }
        if(!Objects.equals(type, "全部")&&type!=null
                &&!Objects.equals(type, "null")&&!Objects.equals(type, "")){//添加类型搜素
            sql=sql+" and h_type='"+type+"'";
        }
        if(!Objects.equals(layout, "全部")&&layout!=null
                &&!Objects.equals(layout, "null")&&!Objects.equals(layout, "")){//添加房型搜素
            if(Objects.equals(layout, "一室"))
                layout="1室";
            else if(Objects.equals(layout, "二室"))
                layout="2室";
            else if(Objects.equals(layout, "三室"))
                layout="3室";
            else if(Objects.equals(layout, "四室"))
                layout="4室";
            else
                layout="5室及以上";
            sql=sql+" and h_layout like'%"+layout+"%'";
        }
        if(!Objects.equals(toward, "全部")&&toward!=null
                &&!Objects.equals(toward, "null")&&!Objects.equals(toward, "")){//添加朝向搜素
            sql=sql+" and h_toward='"+toward+"'";
        }
        if(Objects.equals(elevator, "on")){//添加有无电梯搜素
            sql=sql+" and h_elevator=1";
        }
        if(Objects.equals(traffic, "on")){
            sql=sql+" and (h_traffic like'%号线%' or h_traffic like '%地铁%')";
        }

        if(!Objects.equals(pageNo, "0")){//如果为零则表示无分页
            int pageIndex=(Integer.parseInt(pageNo) -1)*gs;//每一页的第一条数据的序号
            sql=sql+" limit "+pageIndex+","+gs;
        }

        //System.out.println(sql);

        return queryForList(H_resources.class, sql);

    }//展示房源信息

    public List<Lodge> ShowMyHouse(int user_id){//展示我的租房

        String sql="select lodge.lodge_id,lodge.h_id,h_name,lodge_limit,lodge.lodge_price,lodge_stime,lodge_etime,lodge_psta,lodge_pway\n" +
                "from lodge,h_resources\n" +
                "where lodge.h_id=h_resources.h_id and lodge_otime is null and lodge.user_id=?;";

        return queryForList(Lodge.class, sql,user_id);

    }

    public List<H_resources> ShowMyCollection(int user_id){//展示我的收藏
        String sql="select collection.h_id,h_name,h_location,h_price,h_layout,h_type,h_area\n" +
                "     ,h_elevator,h_toward,h_traffic,h_status,h_floor,photo_name\n" +
                "from collection,h_resources,photo\n" +
                "where h_resources.h_id=photo.h_id and collection.h_id=h_resources.h_id and collection.user_id=?";

        return queryForList(H_resources.class,sql,user_id);
    }

//    @Test
//    public void test() {
//        String sql="select collection.h_id,h_name,h_location,h_price,h_layout,h_type,h_area\n" +
//                "     ,h_elevator,h_toward,h_traffic,h_status,h_floor,photo_name\n" +
//                "from collection,h_resources,photo\n" +
//                "where h_resources.h_id=photo.h_id and collection.h_id=h_resources.h_id and collection.user_id=1";
//        System.out.println(queryForList(H_resources.class, sql));
//    }

}
