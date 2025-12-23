package vn.edu.hcmuaf.fit.bookstore.model;

import java.io.Serializable;
import java.time.LocalDate;

public class UserProfiles implements Serializable {
    public enum Gender {MALE, FEMALE}

    private int profileId;
    private int userId;
    private String fullName;
    private LocalDate birthDate;
    private Gender gender;
    private String phone;

    public UserProfiles() {
    }

    public UserProfiles(int profileId, int userId, String fullName, LocalDate birthDate, Gender gender, String phone) {
        this.profileId = profileId;
        this.userId = userId;
        this.fullName = fullName;
        this.birthDate = birthDate;
        this.gender = gender;
        this.phone = phone;
    }

    public UserProfiles(int userId, String fullName, LocalDate birthDate, Gender gender, String phone) {
        this.userId = userId;
        this.fullName = fullName;
        this.birthDate = birthDate;
        this.gender = gender;
        this.phone = phone;
    }

    //Getter
    public int getProfileId() {
        return profileId;
    }

    public int getUserId() {
        return userId;
    }

    public String getFullName() {
        return fullName;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public Gender getGender() {
        return gender;
    }

    public String getPhone() {
        return phone;
    }

//Setter
    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
