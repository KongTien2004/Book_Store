<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài khoản</title>
    <link rel="stylesheet" href="client/layout/profile.css">
</head>
<body>
    <div class="container">
        <h1>Thông tin tài khoản</h1>

        <c:if test="${not empty errorMessage}">
            <div style="padding: 12px 20px; background: #fee; color: #c33; border-left: 4px solid #c33; border-radius: 8px; margin-bottom: 20px;">
                    ${errorMessage}
            </div>
        </c:if>
        <c:if test="${not empty successMessage}">
            <div style="padding: 12px 20px; background: #efe; color: #3c3; border-left: 4px solid #3c3; border-radius: 8px; margin-bottom: 20px;">
                    ${successMessage}
            </div>
        </c:if>

        <form action="profile" method="post">
            <div class="input-group">
                <label for="fullName">Họ tên</label>
                <input type="text" id="fullName" name="fullName" value="${userProfile.fullName}">
            </div>

            <div class="input-group">
                <label for="birthDate">Ngày sinh</label>
                <input type="date" id="birthDate" name="birthDate" value="${userProfile.birthDate}">
            </div>

            <div class="input-group">
                <label>Giới tính</label>
                <div class="radio-group">
                    <input type="radio" id="male" name="gender" value="MALE" ${userProfile.gender == 'MALE' ? 'checked' : ''}>
                    <label for="male">Nam</label>
                    <input type="radio" id="female" name="gender" value="FEMALE" ${userProfile.gender == 'FEMALE' ? 'checked' : ''}>
                    <label for="female">Nữ</label>
                </div>
            </div>

            <div class="input-group">
                <label for="phone">Số điện thoại</label>
                <input type="text" id="phone" name="phone" value="${userProfile.phone}">
            </div>

            <button type="submit" class="btn"><i class="fa-solid fa-floppy-disk"></i> Lưu thay đổi</button>
        </form>

        <script src="https://kit.fontawesome.com/4ba9c94b5c.js" crossorigin="anonymous"></script>
    </div>
</body>
</html>