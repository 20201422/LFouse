package JavaBean;

import Model.H_facilities;
import Model.H_resources;
import Model.Photo;
import Model.User;
import org.junit.Test;

import java.awt.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class LT_ShowDataBean extends BaseDao{

    public Object queryBillPageSize() {//拿到除待上架房源总数
        String sql="SELECT COUNT(h_id) FROM h_resources WHERE h_status != -1 and h_status!=1";
        return queryForSingleValue(sql);
    }

    public List<H_resources> queryBillPage(String PageNo) {//拿到除待上架房源信息，每页两条
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from h_resources WHERE h_status != -1 and h_status!=1 limit "+pageIndex+","+2;
        return queryForList(H_resources.class, sql);
    }

    public Object queryBillPageSize1() {//拿到待审批房源总数
        String sql="SELECT COUNT(h_id) FROM h_resources WHERE h_status = 0";
        return queryForSingleValue(sql);
    }

    public List<H_resources> queryBillPage1(String PageNo) {//拿到待审批房源信息，每页两条
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from h_resources WHERE h_status = 0 limit "+pageIndex+","+2;
        return queryForList(H_resources.class, sql);
    }

    public Object queryBillPageSize2() {//拿到未出租房源总数
        String sql="SELECT COUNT(h_id) FROM h_resources WHERE h_status = 2";
        return queryForSingleValue(sql);
    }

    public List<H_resources> queryBillPage2(String PageNo) {//拿到未出租信息，每页三条
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from h_resources WHERE h_status = 2 limit "+pageIndex+","+2;
        return queryForList(H_resources.class, sql);
    }

    public Object queryBillPageSize3() {//拿到已出租房源总数
        String sql="SELECT COUNT(h_id) FROM h_resources WHERE h_status = 3";
        return queryForSingleValue(sql);
    }

    public List<H_resources> queryBillPage3(String PageNo) {//拿到已出租信息，每页三条
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from h_resources WHERE h_status = 3 limit "+pageIndex+","+2;
        return queryForList(H_resources.class, sql);
    }

    public Object queryBillPageSize4() {//拿到用户数
        String sql="SELECT COUNT(user_id) FROM user";
        return queryForSingleValue(sql);
    }

    public List<User> queryBillPage4(String PageNo) {//拿到用户信息，每页两条
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from user limit "+pageIndex+","+2;
        return queryForList(User.class, sql);
    }

    public List<H_facilities> queryBillPage5(int H_id) {//拿到配置信息
        String sql="select * from h_facilities where h_id = ?";
        return queryForList(H_facilities.class, sql,H_id);
    }

    public List<Photo> queryBillPage6(int H_id) {
        String sql="select * from photo where h_id = ?";
        return queryForList(Photo.class, sql,H_id);
    }

    public List<User> queryBillPage7(String PageNo) {//拿到用户信息，每页两条
        int pageIndex=(Integer.parseInt(PageNo) -1)*2;
        String sql="select * from user limit "+pageIndex+","+2;
        return queryForList(User.class, sql);
    }

    public List<H_resources> queryBillPage8(int H_id) {//拿到特定房源信息
        String sql="select * from h_resources where h_id = ? and h_status != -1 and h_status!=1";
        return queryForList(H_resources.class, sql,H_id);
    }

    public List<User> queryBillPage9(int User_id) {//拿到特定用户信息
        String sql="select * from user where user_id = ?";
        return queryForList(User.class, sql,User_id);
    }

}
