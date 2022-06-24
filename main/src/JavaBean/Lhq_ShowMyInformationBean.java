package JavaBean;

import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Lhq_ShowMyInformationBean extends BaseDao{
    public User findUser(String tel){
        String sql="select * from user where tel=?";
        return queryForOne(User.class,sql,tel);
    }
    public void editor(int user_id,String tel,String uname,String email,String sex,int age){
        String sql= "update user set tel='"+tel+"',uname='"+uname+"',email='"+email+"',age='"+age+"' where user_id='"+user_id+"'";
        update(sql);
    }
    public void Modificate(String tel,String upwd){
        String sql= "update user set upwd='"+upwd+"'where tel='"+tel+"'";
        update(sql);
    }
    public User check(String tel){
        String sql="select tel,upwd,user_id,uname from user where tel=?";
        return (User) queryForOne(User.class,sql,tel);
    }
}

