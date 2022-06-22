package JavaBean;

import Model.User;
import org.junit.Test;

import java.util.List;

public class LT_SavePhoto extends BaseDao{
    public void ShowUser(int h_id, String photoname){
        update("insert into photo values(?,?)",h_id,photoname);
    }
    @Test
    public void test(){
        int h_id=1;
        String photoname = "10002.png";
        update("insert into photo values(?,?)",h_id,photoname);
    }
}
