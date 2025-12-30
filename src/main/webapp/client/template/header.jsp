<%--
  Created by IntelliJ IDEA.
  User: KongTien
  Date: 12/20/2025
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layout/header.css">
</head>
<body>
    <header class="header">
        <section class="header-main">
            <div class="container">
                <div class="header-row">
                    <div class="logo">
                        <a href="${pageContext.request.contextPath}/">
                            <h3>BiBiCa Shop</h3>
                        </a>
                    </div>

                    <div class="search-form">
                        <form action="${pageContext.request.contextPath}/search" method="post">
                            <div class="search-input-group">
                                <input type="text"
                                       placeholder="Nhập từ khóa cần tìm ..."
                                       name="q"
                                       value="${requestScope.query}">
                                <button class="search-btn" type="submit">
                                    <i class="bi bi-search">🔍</i>
                                </button>
                            </div>
                        </form>
                    </div>

                    <c:if test="${not empty sessionScope.currentUser}">
                        <ul class="user-nav">
                            <li>
                                <a href="${pageContext.request.contextPath}/user">
                                    <i>👤</i>
                                    Tài khoản
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/order">
                                    <i>📋</i>
                                    Đơn hàng
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/cart" class="cart-link">
                                    <span id="total-cart-items-quantity" class="cart-badge">...</span>
                                    <i>🛒</i>
                                    Giỏ hàng
                                </a>
                            </li>
                        </ul>
                    </c:if>
                </div>
            </div>
        </section>
    </header>

    <nav class="navbar">
        <div class="container">
            <button class="navbar-toggle" onclick="toggleMenu()">
                <span class="navbar-toggle-icon"></span>
            </button>
            <div class="navbar-content">
                <ul class="navbar-menu" id="navbarMenu">
                    <li class="dropdown">
              <span class="dropdown-toggle">
                <strong>📑 Danh mục sản phẩm</strong>
              </span>
                        <ul class="dropdown-menu">
                            <li><a href="#">Sách giáo khoa</a></li>
                            <li><a href="#">Sách khoa học</a></li>
                            <li><a href="#">Truyện tranh</a></li>
                            <li><a href="#">Tiểu thuyết</a></li>
                            <li><div class="dropdown-divider"></div></li>
                            <li><a href="#">Tất cả danh mục</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Sản phẩm mới</a></li>
                    <li><a href="#">Sản phẩm bán chạy</a></li>
                    <li><a href="#">Khuyến mãi</a></li>
                </ul>

                <div class="auth-section">
                    <c:choose>
                        <c:when test="${not empty sessionScope.currentUser}">
                            <span>Xin chào <strong>${sessionScope.currentUser.fullname}</strong>!</span>
                            <a class="btn btn-light" href="${pageContext.request.contextPath}/signout">
                                Đăng xuất
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-light" href="${pageContext.request.contextPath}/signup">
                                Đăng ký
                            </a>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/signin">
                                Đăng nhập
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <script>
        function toggleMenu() {
            const menu = document.getElementById('navbarMenu');
            menu.classList.toggle('active');
        }
    </script>
</body>
</html>
