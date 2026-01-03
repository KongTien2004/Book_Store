<%--
  Created by IntelliJ IDEA.
  User: KongTien
  Date: 07/10/2025
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="client/layout/sign_up.css">
</head>
<body>
    <form action="sign_up" method="post">
        <h1>Đăng ký tài khoản</h1>

        <!--Hiển thị thông báo-->
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message"><%= request.getAttribute("error") %></div>
        <% } %>

        <div class="input-group">
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
        </div>

        <div class="input-group">
            <input type="email" name="email" placeholder="Email" required>
        </div>

        <div class="input-group">
            <input type="password" name="password" placeholder="Mật khẩu" required>
        </div>

        <div class="input-group">
            <input type="password" name="confirm-password" placeholder="Nhập lại mật khẩu" required>
        </div>

        <button type="submit" class="btn">Đăng ký</button>
    </form>

    <div class="sign-in-link">
        Bạn đã có tài khoản? <a href="sign_in"> Đăng nhập </a>
    </div>
</body>
</html>
