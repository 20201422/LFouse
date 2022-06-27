package JavaBean;

import Model.Lodge;
import Model.User;

import java.util.List;

public class Lhq_LogoutBean extends BaseDao{
    public void DeleteCollection(String user_id){
        String sql="delete from collection where user_id=?";
        update(sql,Integer.parseInt(user_id));
    }
    public void DeleteUser_id(String user_id){
        String sql="delete from user where user_id=?";
        update(sql,Integer.parseInt(user_id));
    }
    public User checkUser(String user_id){
        String sql="select * from user where user_id=? and lodge_num<=0 and rent_num<=0";
        return queryForOne(User.class,sql,Integer.parseInt(user_id));
    }
}
