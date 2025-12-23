package vn.edu.hcmuaf.fit.bookstore.DAO.client;

import vn.edu.hcmuaf.fit.bookstore.DB.DBConnect;
import vn.edu.hcmuaf.fit.bookstore.model.UserProfiles;

import java.sql.*;

public class ProfileDAO {
    //Lấy thông tin profile theo userId trong session của client
    public UserProfiles getProfileById(int userId) {
        String query = "SELECT * FROM user_profiles WHERE user_id = ?";

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new UserProfiles(
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getDate("birth_date").toLocalDate(),
                        UserProfiles.Gender.valueOf(rs.getString("gender")),
                        rs.getString("phone")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Tạo profile mới
    public boolean createProfile(UserProfiles profile) {
        String query = "INSERT INTO user_profiles (user_id, full_name, birth_date, gender, phone) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, profile.getUserId());
            ps.setString(2, profile.getFullName());
            ps.setDate(3, Date.valueOf(profile.getBirthDate()));
            ps.setString(4, profile.getGender().name());
            ps.setString(5, profile.getPhone());

            int affected = ps.executeUpdate();
            if (affected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    profile.setProfileId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật profile
    public boolean updateProfile(UserProfiles profile) {
        String query = "UPDATE user_profiles SET full_name = ?, birth_date = ?, gender = ?, phone = ? WHERE user_id = ?";
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, profile.getFullName());
            ps.setDate(2, Date.valueOf(profile.getBirthDate()));
            ps.setString(3, profile.getGender().name());
            ps.setString(4, profile.getPhone());
            ps.setInt(5, profile.getUserId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lưu profile (tự động create hoặc update)
    public boolean saveProfile(UserProfiles profile) {
        UserProfiles existingProfile = getProfileById(profile.getUserId());

        if (existingProfile == null) {
            // Chưa có profile -> tạo mới
            return createProfile(profile);
        } else {
            // Đã có profile -> cập nhật
            profile.setProfileId(existingProfile.getProfileId());
            return updateProfile(profile);
        }
    }

    // Xóa profile
    public boolean deleteProfile(int userId) {
        String query = "DELETE FROM user_profiles WHERE user_id = ?";
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
