package JavaBean;

import Model.Admin;
import Model.User;

import java.util.List;

public class Lhq_LoginBean extends BaseDao{
    public User findUserNoAndPassword(String tel, String upwd){
        String sql="select tel,upwd,user_id,uname from user where tel=? and upwd=?";
        return (User) queryForOne(User.class,sql,tel,upwd);
    }
    public Admin findAdminNoAndPassword(String admin_id, String apwd){
        String sql="select admin_id,apwd from admin where admin_id=? and apwd=?";
        return (Admin) queryForOne(Admin.class,sql,admin_id,apwd );
    }
}
