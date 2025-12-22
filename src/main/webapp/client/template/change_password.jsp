<%--
  Created by IntelliJ IDEA.
  User: KongTien
  Date: 07/10/2025
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu</title>
    <link rel="stylesheet" href="client/layout/change_password.css">
</head>
<body>
    <form action="change_password" method="post">
        <h1>Đổi mật khẩu</h1>

        <!--Hiển thị thông báo-->
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message"><%= request.getAttribute("error") %></div>
        <% } %>

        <% if (request.getAttribute("success") != null) { %>
            <div class="success-message"><%= request.getAttribute("success") %></div>
        <% } %>

        <div class="input-group">
            <input type="password" name="current-password" placeholder="Nhập mật khẩu hiện tại">
        </div>

        <div class="input-group">
            <input type="password" name="new-password" placeholder="Nhập mật khẩu mới">
        </div>

        <div class="input-group">
            <input type="password" name="confirm-new-password" placeholder="Xác nhận lại mật khẩu mới">
        </div>

        <button type="submit" class="btn">Thay đổi mật khẩu</button>
    </form>
</body>
</html>
