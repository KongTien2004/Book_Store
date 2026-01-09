package vn.edu.hcmuaf.fit.bookstore.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class ForgetPasswordTokens implements Serializable {
    private int tokenId;
    private int userId;
    private String token;
    private LocalDateTime expiryTime;
    private boolean isUsed;

    public ForgetPasswordTokens() {
    }

    public ForgetPasswordTokens(int tokenId, int userId, String token, LocalDateTime expiryTime, boolean isUsed) {
        this.tokenId = tokenId;
        this.userId = userId;
        this.token = token;
        this.expiryTime = expiryTime;
        this.isUsed = isUsed;
    }

    public ForgetPasswordTokens(int userId, String token, LocalDateTime expiryTime, boolean isUsed) {
        this.userId = userId;
        this.token = token;
        this.expiryTime = expiryTime;
        this.isUsed = isUsed;
    }

//Getter
    public int getTokenId() {
        return tokenId;
    }

    public int getUserId() {
        return userId;
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

    public void setUserId(int userId) {
        this.userId = userId;
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
