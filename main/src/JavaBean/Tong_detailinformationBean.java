package JavaBean;

import Model.H_facilities;
import Model.H_resources;
import Model.Photo;
import Model.User;
import org.junit.Test;

import java.util.List;

public class Tong_detailinformationBean extends BaseDao{

    public H_resources detailinformation(int h_id){//根据id显示房源信息

        String sql="select * from h_resources where h_id = ?;";

        return queryForOne(H_resources.class, sql, h_id);
    }

    public H_facilities detailinformationfac(int h_id){//根据id显示房源配置

        String sql="select * from H_facilities where h_id = ?;";

        return queryForOne(H_facilities.class, sql, h_id);
    }

    public User detailinformationuser(int h_id){//根据id显示房源主任信息

        String sql="select uname,sex,age,tel from user,h_resources where h_resources.user_id=user.user_id and h_id=?;";

        return queryForOne(User.class, sql, h_id);
    }

    public List<Photo> detailinformationphoto(int h_id){//根据id显示房源主任信息

        String sql="select Photo_name from photo where h_id=?;";

        return queryForList(Photo.class, sql, h_id);
    }

//    @Test
//    public void test() {
//
//        String sql="select * from h_resources,photo where h_resources.h_id=photo.h_id and h_resources.h_id = ?;";
//        String h_id="1";
//        System.out.println(queryForList(H_resources.class, sql, h_id));
//    }

}
