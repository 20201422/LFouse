package JavaBean;

import Model.H_resources;
import Model.Lodge;
import Model.User;
import org.junit.Test;

import java.util.List;

public class Kp_OrderBean  extends BaseDao{

    public Lodge FindMylodgeHouse(int user_id,int h_id){//Bug修复（点击我要租房后跳转到的我的租房界面，此时刷新界面会出现多条数据插入）

        String sql="select * from lodge where lodge_otime is null and user_id=? and h_id=?";

        return queryForOne(Lodge.class,sql,user_id,h_id);//查询租房表，按照用户id和房源id锁定租房信息，再通过结束租房时间判断

    }

    public H_resources FindMyresourcesHouse(int user_id,int h_id){//查找房源表

        String sql="select * from h_resources where user_id=? and h_id=?";

        return queryForOne(H_resources.class,sql,user_id,h_id);

    }

    public List<Lodge> lodgeCount(int user_id){//查找用户已租房的数量

        String sql="select * from lodge where lodge_otime is null and user_id=?";

        return queryForList(Lodge.class,sql,user_id);

    }

    public void createorder(int user_id, int h_id, int lodge_limit, int lodge_pway, float lodge_price){//创建订单

        if(FindMylodgeHouse(user_id, h_id) == null){
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
            else if(lodge_pway==2){//支付方式为分期
                String lodge_psta="分期支付中";//更新租房表，添加租房信息
                String lodge_payway="分期";
                update(InsertLodgeSql,user_id,h_id,lodge_limit,lodge_price,lodge_limit,lodge_psta,lodge_payway);
            }
        }

    }

    public void goonorder(int user_id, int h_id, int lodge_limit, int lodge_pway, float lodge_price){//续租

        String sql="update lodge \n" +
                "set lodge_limit=lodge_limit+? , lodge_price=lodge_price+? , lodge_etime=DATE_ADD(now(), INTERVAL ? Month) \n" +
                "                    , lodge_psta=? , lodge_pway=? \n" +
                "where h_id=? and user_id=?";

        if(lodge_pway==1){//支付方式为全款
            String lodge_psta="已支付";//更新租房表，添加租房信息
            String lodge_payway="全款";
            update(sql,lodge_limit,lodge_price,lodge_limit,lodge_psta,lodge_payway,h_id,user_id);
        }
        else if(lodge_pway==2){//支付方式为分期
            String lodge_psta="分期支付中";//更新租房表，添加租房信息
            String lodge_payway="分期";
            update(sql,lodge_limit,lodge_price,lodge_limit,lodge_psta,lodge_payway,h_id,user_id);
        }

    }

    public User checkrentnum(int user_id){//检查用户

        String sql="select * from user where user_id=?";

        return queryForOne(User.class,sql,user_id);
    }

    public void cancelorder(int user_id, int h_id){//取消订单

        if(checkrentnum(user_id).getRent_num()>0){//修改bug，如果租房数量大于0才可以减少
            String UpdateUserRent_numSql="update user set rent_num=rent_num-1 where user_id=?";
            update(UpdateUserRent_numSql,user_id);//修改用户租房数量
        }
        else{//否则租房数量变为零
            String UpdateUserRent_numSql="update user set rent_num=0 where user_id=?";
            update(UpdateUserRent_numSql,user_id);//修改用户租房数量
        }
        String UpdateH_resourcesH_statusSql="update h_resources set h_status=0 where h_id=?";
        String UpdateLodge_otime="update lodge set lodge_otime=now() , lodge_psta='订单结束' where h_id=? and user_id=?";

        update(UpdateH_resourcesH_statusSql,h_id);//修改房源状态
        update(UpdateLodge_otime,h_id,user_id);//修改租房表的截止时间

    }

//    @Test
//    public void test(){
//       FindMyresourcesHouse(51,24);
//       System.out.println(FindMyresourcesHouse(24,51));
//    }

}
