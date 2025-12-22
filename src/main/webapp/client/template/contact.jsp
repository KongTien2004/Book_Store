<%--
  Created by IntelliJ IDEA.
  User: KongTien
  Date: 07/10/2025
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ</title>
    <link rel="stylesheet" href="/client/layout/contact.css">
</head>
<body>
    <form action="contact" method="post">
        <div class="form-group">
            <label for="full-name">Họ và tên <span class="required">*</span></label>
            <input type="text" name="full-name" placeholder="Nhập họ và tên">
        </div>

        <div class="form-group">
            <label for="birth-date">Ngày sinh <span class="required">*</span></label>
            <input type="date" name="birth-date" placeholder="Chọn ngày sinh">
        </div>

        <div class="form-group">
            <label for="phone">Số điện thoại <span class="required">*</span></label>
            <input type="number" name="phone" placeholder="Nhập số điện thoại">
        </div>

        <div class="form-group">
            <label for="email">Email <span class="required">*</span></label>
            <input type="email" name="email" placeholder="Nhập email">
        </div>

        <div class="form-group">
            <label for="message">Nội dung tin nhắn <span class="required">*</span></label>
            <input type="text" name="message" placeholder="Nhập nội dung liên hệ của bạn...">
        </div>
    </form>
</body>
</html>
