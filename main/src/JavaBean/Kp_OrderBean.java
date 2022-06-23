package JavaBean;

import org.junit.Test;

public class Kp_OrderBean  extends BaseDao{

    public void createorder(int user_id, int h_id, int lodge_limit, int lodge_pway, float lodge_price){

        String UpdateUserRent_numSql="update user set rent_num=rent_num+1 where user_id=?";
        String UpdateH_resourcesH_statusSql="update h_resources set h_status=3 where h_id=?";
        String InsertLodgeSql=
                "insert into lodge values (null,?,?,?,?,now(),DATE_ADD(now(), INTERVAL ? Month),null,?,?);";

        update(UpdateUserRent_numSql,user_id);//更新用户表，增加租房数
        update(UpdateH_resourcesH_statusSql,h_id);//更新房源表，改变房子状态

        if(lodge_pway==1){//支付方式为全款
            String lodge_psta="已支付";//更新租房表，添加租房信息
            String lodge_payway="全款";
            update(InsertLodgeSql,user_id,h_id,lodge_limit,lodge_price,lodge_limit,lodge_psta,lodge_payway);
        }
        else{//支付方式为分期
            String lodge_psta="分期支付中";//更新租房表，添加租房信息
            String lodge_payway="分期";
            update(InsertLodgeSql,user_id,h_id,lodge_limit,lodge_price,lodge_limit,lodge_psta,lodge_payway);
        }

    }

//    @Test
//    public void test(){
//        String lodge_psta="分期支付中";//更新租房表，添加租房信息
//        String InsertLodgeSql=
//                "insert into lodge values (null,?,?,?,?,now(),DATE_ADD(now(), INTERVAL ? Month),null,?,?);";
//        update(InsertLodgeSql,1,2,3,4,4,"lodge_psta","lodge_pway");
//    }

}
