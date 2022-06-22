package JavaBean;

import Model.H_resources;
import Model.User;
import org.junit.Test;

import java.util.List;

public class Kp_ShowHouseBean extends BaseDao{

    public List<H_resources> ShowHouse(){

        String sql="select * from h_resources";

        return queryForList(H_resources.class, sql);
    }

    @Test
    public void test() {
        String sql="select * from h_resources";
        System.out.println(queryForList(H_resources.class, sql));
    }

}
