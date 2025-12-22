package vn.edu.hcmuaf.fit.bookstore.service.client;

import vn.edu.hcmuaf.fit.bookstore.DAO.client.UserDAO;
import vn.edu.hcmuaf.fit.bookstore.model.Users;

public class UserService {
    static UserDAO userDAO = new UserDAO();

    public Users checkUsername(String username) {
        return userDAO.checkUsername(username);
    }

    public Users checkLogin(String username, String password) {
        return userDAO.checkLogin(username, password);
    }

    public boolean registerUser(Users user) {
        return userDAO.registerUser(user);
    }

    public boolean updatePassword(int userId, String newPassword) {
        return userDAO.updatePassword(userId, newPassword);
    }
}
