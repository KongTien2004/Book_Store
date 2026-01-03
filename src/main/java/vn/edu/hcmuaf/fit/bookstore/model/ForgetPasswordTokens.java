package vn.edu.hcmuaf.fit.bookstore.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class ForgetPasswordTokens implements Serializable {
    private int tokenId;
    private int user_id;
    private String token;
    private LocalDateTime expiryTime;
    private boolean isUsed;

    public ForgetPasswordTokens() {
    }

    public ForgetPasswordTokens(int tokenId, int user_id, String token, LocalDateTime expiryTime, boolean isUsed) {
        this.tokenId = tokenId;
        this.user_id = user_id;
        this.token = token;
        this.expiryTime = expiryTime;
        this.isUsed = isUsed;
    }

    public ForgetPasswordTokens(int user_id, String token, LocalDateTime expiryTime, boolean isUsed) {
        this.user_id = user_id;
        this.token = token;
        this.expiryTime = expiryTime;
        this.isUsed = isUsed;
    }

//Getter
    public int getTokenId() {
        return tokenId;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getToken() {
        return token;
    }

    public LocalDateTime getExpiryTime() {
        return expiryTime;
    }

    public boolean isUsed() {
        return isUsed;
    }

//Setter
    public void setTokenId(int tokenId) {
        this.tokenId = tokenId;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void setExpiryTime(LocalDateTime expiryTime) {
        this.expiryTime = expiryTime;
    }

    public void setUsed(boolean used) {
        isUsed = used;
    }
}
