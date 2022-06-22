package JavaBean;

import Model.H_resources;
import Model.User;
import org.junit.Test;

import java.util.List;
import java.util.Objects;

public class Kp_ShowHouseBean extends BaseDao{

    public List<H_resources> ShowHouse(String location,String price,String type,String layout,String toward,String elevator){

        String sql="select * from h_resources,photo where h_resources.h_id=photo.h_id";

        if(!Objects.equals(location, "全部")&&location!=null){//添加位置搜素
            sql=sql+" and h_location='%"+location+"%'";
        }
        if(!Objects.equals(price, "全部")&&price!=null){//添加价格搜素
            if(Objects.equals(price, "1"))
                sql=sql+" and h_price<=000";
            else if(Objects.equals(price, "2"))
                sql=sql+" and h_price>=1000 and h_price<=3000";
            else if(Objects.equals(price, "3"))
                sql=sql+" and h_price>=3000 and h_price<=5000";
            else if(Objects.equals(price, "4"))
                sql=sql+" and h_price>=5000 and h_price<=8000";
            else if(Objects.equals(price, "5"))
                sql=sql+" and h_price>=8000";
        }
        if(!Objects.equals(type, "全部")&&type!=null){//添加类型搜素
            sql=sql+" and h_type='"+type+"'";
        }
        if(!Objects.equals(layout, "全部")&&layout!=null){//添加房型搜素
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
        if(!Objects.equals(toward, "全部")&&toward!=null){//添加朝向搜素
            sql=sql+" and h_toward='"+toward+"'";
        }
        if(Objects.equals(elevator, "on")){//添加有无电梯搜素
            sql=sql+" and h_elevator=1";
        }
        System.out.println(sql);

        return queryForList(H_resources.class, sql);
    }

    @Test
    public void test() {
        String sql="select * from h_resources,photo where h_resources.h_id=photo.h_id;";
        System.out.println(queryForList(H_resources.class, sql));
    }

}
