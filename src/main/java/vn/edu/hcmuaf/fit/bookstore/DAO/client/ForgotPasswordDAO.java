package vn.edu.hcmuaf.fit.bookstore.DAO.client;

import vn.edu.hcmuaf.fit.bookstore.DB.DBConnect;
import vn.edu.hcmuaf.fit.bookstore.model.ForgetPasswordTokens;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ForgotPasswordDAO {
    public boolean insertToken(ForgetPasswordTokens token) {
        String query = "INSERT INTO forget_password_tokens (user_id, token, expiry_time, is_used) VALUES (?, ?, ?, ?)";

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, token.getUserId());
            statement.setString(2, token.getToken());
            statement.setTimestamp(3, java.sql.Timestamp.valueOf(token.getExpiryTime()));
            statement.setBoolean(4, token.isUsed());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
