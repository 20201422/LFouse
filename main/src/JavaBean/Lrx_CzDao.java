package JavaBean;

import Model.H_resources;
import Model.Lodge;

import java.util.List;

public class Lrx_CzDao extends BaseDao{
    public List<Lodge>getAll(String user_id){
        return  queryForList(Lodge.class,"SELECT * FROM lodge WHERE USER_ID="+Integer.parseInt(user_id)+"");
    }
    public void AddHouse(String user_id,String h_name,String h_location,String h_price,String h_layout,String h_type,String area,
                            String h_elevator,String h_toward,String h_traffic,String h_floor){
        update("insert into h_resources values(null,"+Integer.parseInt(user_id)+",'"+h_name+"','"+h_location+"',"+Double.parseDouble(h_price) +",'"+h_layout+"','"+h_type+"',"+Double.parseDouble(area)+ ",'"+h_elevator+"','"+h_toward+"','"+h_traffic+"',0,'"+h_floor+"')");
    }
    public  void AddPhoto(String name,String photo){
        update("INSERT INTO photo VALUES((SELECT h_id FROM h_resources WHERE h_name='"+name+"'),'"+photo+"') ");
        //System.out.println(update("INSERT INTO photo VALUES((SELECT h_id FROM h_resources WHERE h_name='"+name+"'),'"+photo+"') "));
    }
    public  void Addfacilities(String name,int a,int b,int c,int d,int e,int f){
        update("insert into h_facilities values((SELECT h_id FROM h_resources WHERE h_name='"+name+"'),"+a+","+b+","+c+","+d+","+e+","+f+")");
    }
}
