package vn.edu.hcmuaf.fit.bookstore.service.client;

import vn.edu.hcmuaf.fit.bookstore.DAO.client.ProfileDAO;
import vn.edu.hcmuaf.fit.bookstore.model.UserProfiles;

import java.sql.Connection;
import java.time.LocalDate;

public class ProfileService {
    static ProfileDAO profileDAO = new ProfileDAO();

    public ProfileService(Connection connection) {
    }

    public UserProfiles getProfileById(int userId) {
        return profileDAO.getProfileById(userId);
    }

    public boolean createProfile(UserProfiles profile) {
        return profileDAO.createProfile(profile);
    }

    public boolean updateProfile(UserProfiles profile) {
        return profileDAO.updateProfile(profile);
    }

    public boolean saveProfile(UserProfiles profile) {
        return profileDAO.saveProfile(profile);
    }

    public boolean deleteProfile(int userId) {
        return profileDAO.deleteProfile(userId);
    }
}
