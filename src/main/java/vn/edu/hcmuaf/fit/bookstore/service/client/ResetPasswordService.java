package vn.edu.hcmuaf.fit.bookstore.service.client;

import jakarta.mail.Message;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.UUID;

public class ResetPasswordService {
    private final int LIMIT_EXPIRY_TIME = 15;
    private final String from = "tongduykien6a1@gmail.com";
    private final String password = "sjytkajxkqqqpylo";

    public String generateTokens() {
        return UUID.randomUUID().toString();
    }

    public LocalDateTime expiryTime() {
        return LocalDateTime.now().plusMinutes(LIMIT_EXPIRY_TIME);
    }

    public boolean isExpired(LocalDateTime expiryTine) {
        return LocalDateTime.now().isAfter(expiryTine);
    }

    public boolean sendResetEmail(String email, String link, String name) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.user", from);

        Authenticator auth = new Authenticator() {
            @Override
            protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);

        try {
            msg.addHeader("Content-Type", "text/html; charset=UTF-8");
            msg.setFrom(new InternetAddress(from, "Book Store"));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
            msg.setSubject("Cài đặt mật khẩu mới", "UTF-8");
            String content = "<h1>Xin chào " + name + "</h1>"
                    + "<p>Hãy click vào link này để cài đặt mật khẩu mới cho tài khoản"
                    + "<a href='" + link + "'> Click đây</a></p>";
            msg.setContent(content, "text/html; charset=UTF-8");
            Transport.send(msg);
            System.out.println("Gửi yêu cầu thành công!");
            return true;
        } catch (Exception e) {
            System.out.println("Lỗi gửi email.");
            System.out.println(e);
            return false;
        }
    }
}
