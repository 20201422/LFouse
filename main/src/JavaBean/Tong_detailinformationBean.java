package JavaBean;

import Model.H_resources;
import org.junit.Test;

import java.util.List;

public class Tong_detailinformationBean extends BaseDao{

    public List<H_resources> detailinformation(String h_id){

        String sql="select * from h_resources,photo where h_resources.h_id=photo.h_id and h_resources.h_id = ?;";

        return queryForList(H_resources.class, sql, h_id);
    }

    @Test
    public void test() {

        String sql="select * from h_resources,photo where h_resources.h_id=photo.h_id and h_resources.h_id = ?;";
        String h_id="1";
        System.out.println(queryForList(H_resources.class, sql, h_id));
    }

}
