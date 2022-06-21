package JavaBean;

import Model.User;
import org.junit.Test;

import java.util.List;

public class KpBean extends BaseDao{

    public List<User> ShowUser(){
        return queryForList(User.class, "select * from user");
    }

    @Test
    public void test() {
        System.out.println(queryForList(User.class, "select * from user"));
    }

}
