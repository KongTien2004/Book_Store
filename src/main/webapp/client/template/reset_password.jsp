<%--
  Created by IntelliJ IDEA.
  User: KongTien
  Date: 1/3/2026
  Time: 11:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Cài đặt mật khẩu</title>
    <link rel="stylesheet" href="client/layout/reset_password.css">
</head>
<body>
    <form action="reset_password" method="post">
        <h1>Cài đặt mật khẩu</h1>

        <div class="input-group">
            <input type="password" name="new-password" placeholder="Nhập mật khẩu mới">
        </div>

        <div class="input-group">
            <input type="password" name="confirm-new-password" placeholder="Xác nhận lại mật khẩu mới">
        </div>

        <button type="submit" class="btn">Xác nhận</button>
    </form>
</body>
</html>
