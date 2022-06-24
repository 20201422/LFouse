package JavaBean;

import Model.Collection;
import org.junit.Test;

public class Kp_CollectionBean extends BaseDao{

    public void addCollection(int h_id,int user_id){//加入收藏

        String sql="insert into collection values(?,?)";

        update(sql,h_id,user_id);

    }

    public void subtractCollection(int h_id,int user_id){//取消收藏

        String sql="delete from collection where h_id=? and user_id=?";

        update(sql,h_id,user_id);

    }

    public Collection findCollection(int h_id, int user_id){//查找收藏

        String sql="select * from collection where h_id=? and user_id=?";

        return queryForOne(Collection.class,sql,h_id,user_id);

    }

//    @Test
//    public void test(){
//        String sql="select * from collection where h_id=? and user_id=?";
//
//        System.out.println(queryForOne(Collection.class,sql,1,1));
//    }

}
