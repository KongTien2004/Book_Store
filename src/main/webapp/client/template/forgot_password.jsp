<%--
  Created by IntelliJ IDEA.
  User: KongTien
  Date: 07/10/2025
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="client/layout/forgot_password.css">
</head>
<body>
    <form action="forgot_password" method="post">
        <h1>Quên mật khẩu</h1>

        <div class="input-group">
            <input type="email" name="email" placeholder="Email khôi phục">
        </div>

        <button type="submit" class="btn">Gửi</button>
    </form>
</body>
</html>
