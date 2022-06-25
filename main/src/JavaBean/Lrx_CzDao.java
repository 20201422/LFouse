package JavaBean;

import Model.*;

import java.util.List;

public class Lrx_CzDao extends BaseDao{
    public List<Lrx_AlreadyCz>getAlreadyCz(String user_id){    //得到已经被租了的房子与租客信息
        return  queryForList(Lrx_AlreadyCz.class,"SELECT h_resources.h_id,h_name,h_location,h_price,user.uname,user.tel,user.email,lodge.lodge_limit,lodge.lodge_stime,lodge.lodge_etime,lodge.lodge_otime,lodge.lodge_psta,lodge.lodge_pway\n" +
                                                    "FROM h_resources,lodge,USER\n" +
                                                    "WHERE h_status=3 AND h_resources.user_id="+Integer.parseInt(user_id)+" AND h_resources.h_id=lodge.h_id AND lodge.user_id=user.user_id;");
    }
    public List<Lrx_NotCz>getNotCz(String user_id){  //得到没被租的房子的信息
        return queryForList(Lrx_NotCz.class,"SELECT h_id,h_name,h_location,h_status\n" +
                                                "FROM h_resources\n" +
                                                "WHERE h_status!=3 AND user_id="+user_id+";");
    }
    //查找一条未出租房子详细信息
    public Lrx_NotCzMoreInforms getNorCzMoreInforms(String h_id){
        return queryForOne(Lrx_NotCzMoreInforms.class,"SELECT h_id,h_name,h_location,h_price,h_layout,h_type,h_area,h_elevator,h_toward,h_traffic,h_floor\n" +
                                                        "FROM h_resources\n" +
                                                        "WHERE h_id="+h_id+";");

    }
    //添加房源信息
    public void AddHouse(String user_id,String h_name,String h_location,String h_price,String h_layout,String h_type,String area,
                            String h_elevator,String h_toward,String h_traffic,String h_floor){
        update("insert into h_resources values(null,"+Integer.parseInt(user_id)+",'"+h_name+"','"+h_location+"',"+Double.parseDouble(h_price) +",'"+h_layout+"','"+h_type+"',"+Double.parseDouble(area)+ ",'"+h_elevator+"','"+h_toward+"','"+h_traffic+"',0,'"+h_floor+"')");
        update("UPDATE USER \n" +
                "SET lodge_num=lodge_num+1\n" +
                "WHERE user_id="+Integer.parseInt(user_id)+";");
    }
    //添加房源图片
    public  void AddPhoto(String name,String photo){
        update("INSERT INTO photo VALUES((SELECT h_id FROM h_resources WHERE h_name='"+name+"'),'"+photo+"') ");
        //System.out.println(update("INSERT INTO photo VALUES((SELECT h_id FROM h_resources WHERE h_name='"+name+"'),'"+photo+"') "));
    }
    //添加房源配套信息
    public  void Addfacilities(String name,int a,int b,int c,int d,int e,int f){
        update("insert into h_facilities values((SELECT h_id FROM h_resources WHERE h_name='"+name+"'),"+a+","+b+","+c+","+d+","+e+","+f+")");
    }
    //修改未被租的房子信息
    public void Modify(String h_id,String h_name,String h_location,String h_price,String h_layout,String h_type,String h_area,String h_elevator,String h_toward,String h_traffic,String h_floor ){
        update("UPDATE h_resources\n" +
                "SET h_name='"+h_name+"',h_location='"+h_location+"',h_price="+Double.parseDouble(h_price)+",h_layout='"+h_layout+"',h_type='"+h_type+"',h_area="+Double.parseDouble(h_area)+",h_elevator="+Integer.parseInt(h_elevator)+",h_toward='"+h_toward+"',h_traffic='"+h_traffic+"',h_status=0,h_floor='"+h_floor+"'\n" +
                "WHERE h_id="+h_id+";");
    }
    //将未出租且审核通过的房源状态改为上架
    public void PutOn(String h_id){
        update("UPDATE h_resources\n" +
                "SET h_status=2\n" +
                "WHERE h_id="+Integer.parseInt(h_id)+" AND h_status=1;");
    }
    //将未出租且上架了的房源状态改为下架
    public  void PutOff(String h_id){
        update("UPDATE h_resources\n" +
                "SET h_status=1\n" +
                "WHERE h_id="+Integer.parseInt(h_id)+" AND h_status=2;");
    }
    //删除房源信息及其相关信息
    public void DelAll(String user_id,String h_id){
        update("UPDATE USER \n" +
                "SET lodge_num=lodge_num-1\n" +
                "WHERE user_id="+user_id+";");
        update("DELETE FROM photo\n" +
                "WHERE h_id="+h_id+";");
        update("DELETE FROM h_facilities\n" +
                "WHERE h_id="+h_id+";\n");
        update("DELETE FROM h_resources\n" +
                "WHERE h_id="+h_id+";");
    }
}
