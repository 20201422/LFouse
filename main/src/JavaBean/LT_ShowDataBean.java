package JavaBean;

import Model.H_resources;
import Model.User;
import org.junit.Test;

import java.awt.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class LT_ShowDataBean extends BaseDao{

    public Object queryBillPageSize() {
        String sql="SELECT COUNT(h_id) FROM h_resources";
        return queryForSingleValue(sql);
    }

    public List<H_resources> queryBillPage(String PageNo) {
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from h_resources limit "+pageIndex+","+2;
        return queryForList(H_resources.class, sql);
    }

    public Object queryBillPageSize1() {
        String sql="SELECT COUNT(h_id) FROM h_resources WHERE h_status = 0";
        return queryForSingleValue(sql);
    }

    public List<H_resources> queryBillPage1(String PageNo) {
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from h_resources WHERE h_status = 0 limit "+pageIndex+","+2;
        return queryForList(H_resources.class, sql);
    }

    public Object queryBillPageSize2() {
        String sql="SELECT COUNT(h_id) FROM h_resources WHERE h_status = 2";
        return queryForSingleValue(sql);
    }

    public List<H_resources> queryBillPage2(String PageNo) {
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from h_resources WHERE h_status = 2 limit "+pageIndex+","+2;
        return queryForList(H_resources.class, sql);
    }

    public Object queryBillPageSize3() {
        String sql="SELECT COUNT(h_id) FROM h_resources WHERE h_status = 3";
        return queryForSingleValue(sql);
    }

    public List<H_resources> queryBillPage3(String PageNo) {
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from h_resources WHERE h_status = 3 limit "+pageIndex+","+2;
        return queryForList(H_resources.class, sql);
    }

    public Object queryBillPageSize4() {
        String sql="SELECT COUNT(user_id) FROM user";
        return queryForSingleValue(sql);
    }

    public List<User> queryBillPage4(String PageNo) {
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from user limit "+pageIndex+","+2;
        return queryForList(User.class, sql);
    }
}
