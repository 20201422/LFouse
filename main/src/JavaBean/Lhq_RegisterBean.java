package JavaBean;

public class Lhq_RegisterBean extends BaseDao{
    public void add(int user_id,String tel,String uname,String email,String upwd,String sex,int age,int lodge_num,int rent_num){
        String sql= "insert into user values(null,'"+tel+"','"+uname+"','"+email+"','"+upwd+"','"+sex+"','"+age+"','"+lodge_num+"','"+rent_num+"')";
        update(sql);
    }
}
