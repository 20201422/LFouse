package Model;

public class Lodge {

    private int lodge_id;
    private int lodge_limit;
    private float lodge_price;
    private String lodge_stime;
    private String lodge_etime;
    private String lodge_otime;
    private String lodge_psta;
    private String lodge_pway;
    private User user;
    private H_resources h_resources;

    public int getLodge_id() {
        return lodge_id;
    }

    public void setLodge_id(int lodge_id) {
        this.lodge_id = lodge_id;
    }

    public int getLodge_limit() {
        return lodge_limit;
    }

    public void setLodge_limit(int lodge_limit) {
        this.lodge_limit = lodge_limit;
    }

    public float getLodge_price() {
        return lodge_price;
    }

    public void setLodge_price(float lodge_price) {
        this.lodge_price = lodge_price;
    }

    public String getLodge_stime() {
        return lodge_stime;
    }

    public void setLodge_stime(String lodge_stime) {
        this.lodge_stime = lodge_stime;
    }

    public String getLodge_etime() {
        return lodge_etime;
    }

    public void setLodge_etime(String lodge_etime) {
        this.lodge_etime = lodge_etime;
    }

    public String getLodge_otime() {
        return lodge_otime;
    }

    public void setLodge_otime(String lodge_otime) {
        this.lodge_otime = lodge_otime;
    }

    public String getLodge_psta() {
        return lodge_psta;
    }

    public void setLodge_psta(String lodge_psta) {
        this.lodge_psta = lodge_psta;
    }

    public String getLodge_pway() {
        return lodge_pway;
    }

    public void setLodge_pway(String lodge_pway) {
        this.lodge_pway = lodge_pway;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public H_resources getH_resources() {
        return h_resources;
    }

    public void setH_resources(H_resources h_resources) {
        this.h_resources = h_resources;
    }

}
