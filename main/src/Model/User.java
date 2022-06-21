package Model;

public class User {

    private int user_id;
    private String tel;
    private String uname;
    private String upwd;
    private String sex;
    private int age;
    private int lodge_num;
    private int rent_num;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getLodge_num() {
        return lodge_num;
    }

    public void setLodge_num(int lodge_num) {
        this.lodge_num = lodge_num;
    }

    public int getRent_num() {
        return rent_num;
    }

    public void setRent_num(int rent_num) {
        this.rent_num = rent_num;
    }

}
