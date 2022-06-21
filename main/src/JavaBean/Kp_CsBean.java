package JavaBean;

import Model.User;
import org.junit.Test;

import java.util.List;

public class Kp_CsBean extends BaseDao{

    public List<User> ShowUser(String sex,String user_id){
        update("update User set sex=? where user_id=?;","男",1);
        return queryForList(User.class, "select * from user");
    }

    @Test
    public void test() {
        System.out.println(queryForList(User.class, "select * from user"));
    }

}
