package vn.edu.hcmuaf.fit.bookstore.model;

import java.io.Serializable;

public class Users implements Serializable {
    public enum Role {CLIENT, ADMIN}

    private int userId;
    private String userName;
    private String password;
    private Role role;

    public Users() {}

    public Users(int userId, String userName, String password, Role role) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.role = role;
    }

    public Users(String userName, String password, Role role) {
        this.userName = userName;
        this.password = password;
        this.role = role;
    }

    //Getter
    public int getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public Role getRole() {
        return role;
    }

    //Setter
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(Role role) {
        this.role = role;
    }

}
