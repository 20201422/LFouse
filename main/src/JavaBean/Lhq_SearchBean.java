package JavaBean;

import Model.User;

public class Lhq_SearchBean extends BaseDao{
    public User findEmail(String email,String tel){
        String sql="select email,uname,upwd from user where email=? and tel=?";
        return queryForOne(User.class,sql,email,tel);
    }
    public User sendEmail(String email){
        String sql="select email,uname,upwd from user where email=?";
        return queryForOne(User.class,sql,email);
    }
    public User findTel(String tel){
        String sql="select tel from user where tel=?";
        return (User) queryForOne(User.class,sql,tel);
    }
    public User findmail(String email){
        String sql="select email from user where email=?";
        return (User) queryForOne(User.class,sql,email);
    }
}
