package JavaBean;

import Model.User;

public class Lhq_SearchBean extends BaseDao{
    public User findEmail(String email){
        String sql="select email,uname,upwd from user where email=?";
        return queryForOne(User.class,sql,email);
    }
}
