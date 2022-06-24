package Model;

public class Collection {

    private int h_id;
    private int user_id;
    private H_resources h_resources;
    private User user;

    public int getH_id() {
        return h_id;
    }

    public void setH_id(int h_id) {
        this.h_id = h_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public H_resources getH_resources() {
        return h_resources;
    }

    public void setH_resources(H_resources h_resources) {
        this.h_resources = h_resources;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String toString() {
        return "USer{" +
                "h_id=" + h_id +
                "user_id=" + user_id +
                '}'+"\n";
    }

}
