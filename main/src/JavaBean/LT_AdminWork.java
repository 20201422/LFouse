package JavaBean;

public class LT_AdminWork extends BaseDao{
    public void ChangeHouseStatus(int str,int Type){
        if(Type==1){
            update("UPDATE h_resources SET h_status = -1 WHERE h_id = ?",str);
        }
        else if(Type==2) {
            update("UPDATE h_resources SET h_status = 3 WHERE h_id = ?",str);
        }
    }
}
