<%--
  Created by IntelliJ IDEA.
  User: KongTien
  Date: 07/10/2025
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="client/layout/sign_in.css" />
</head>
<body>
    <form action="sign_in" method="post">
        <h1>Đăng nhập tài khoản</h1>

        <!--Hiển thị thông báo-->
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message"><%= request.getAttribute("error") %></div>
        <% } %>

        <% if (request.getAttribute("success") != null) { %>
            <div class="success-message"><%= request.getAttribute("success") %></div>
        <% } %>

        <div class="input-group">
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
        </div>
        <div class="input-group">
            <input type="password" name="password" placeholder="Mật khẩu" required>
        </div>

        <div class="remember-forgot">
            <label><input type="checkbox">Ghi nhớ</label>
            <a href="forgot_password.jsp">Quên mật khẩu?</a>
        </div>

        <button type="submit" class="btn">Đăng nhập</button>
    </form>

    <div class="sign-up-link">
        Chưa có tài khoản? <a href="sign_up.jsp"> Đăng ký ngay </a>
    </div>
</body>
</html>
