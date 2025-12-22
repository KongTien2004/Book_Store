package vn.edu.hcmuaf.fit.bookstore.DAO.client;

import vn.edu.hcmuaf.fit.bookstore.DB.DBConnect;
import vn.edu.hcmuaf.fit.bookstore.model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    //Kiểm tra tên người dùng (username) có tồn tại không?
    public Users checkUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ?";

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Users(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        Users.Role.valueOf(rs.getString("role").toUpperCase())
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    //Kiểm tra người dùng có đăng nhập tài khoản thành công không?
    public Users checkLogin(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Users(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        Users.Role.valueOf(rs.getString("role"))
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    //Kiểm tra người dùng có đăng ký tài khoản thành công không? (Dưới quyền truy cập CLIENT)
    public boolean registerUser(Users user) {
        String query = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getPassword());
            statement.setString(3, Users.Role.CLIENT.toString());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    //Thay đổi mật khẩu người dùng
    public boolean updatePassword(int userId, String newPassword) {
        String query = "UPDATE users SET password = ? WHERE user_id = ?";

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, newPassword);
            statement.setInt(2, userId);

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
