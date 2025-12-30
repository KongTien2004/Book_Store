<%--
  Created by IntelliJ IDEA.
  User: KongTien
  Date: 12/20/2025
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layout/footer.css">
</head>
<body>
    <footer class="footer">
        <!-- Footer Top Section -->
        <section class="footer-top">
            <div class="footer-container">
                <div class="footer-row">
                    <!-- Giới thiệu -->
                    <aside class="footer-col">
                        <h6>Giới thiệu</h6>
                        <ul class="footer-list">
                            <li><a href="#">Về Shop</a></li>
                            <li><a href="#">Tuyển dụng</a></li>
                            <li><a href="#">Chính sách thanh toán</a></li>
                            <li><a href="#">Chính sách bảo mật</a></li>
                            <li><a href="#">Giải quyết khiếu nại</a></li>
                            <li><a href="#">Hợp tác</a></li>
                        </ul>
                    </aside>

                    <!-- Hỗ trợ khách hàng -->
                    <aside class="footer-col">
                        <h6>Hỗ trợ khách hàng</h6>
                        <ul class="footer-list">
                            <li>📞 Hotline: <strong>0329-769-915</strong></li>
                            <li>📧 Mail: <strong>20130468@st.hcmuaf.edu.vn</strong></li>
                            <li><a href="#">Câu hỏi thường gặp</a></li>
                            <li><a href="#">Hướng dẫn đặt hàng</a></li>
                            <li><a href="#">Phương thức vận chuyển</a></li>
                            <li><a href="#">Chính sách đổi trả</a></li>
                        </ul>
                    </aside>

                    <!-- Newsletter -->
                    <aside class="footer-col">
                        <h6>Đăng ký nhận tin</h6>
                        <p style="color: #666; font-size: 14px; margin-bottom: 15px;">
                            Nhận thông tin về sản phẩm mới và ưu đãi đặc biệt
                        </p>
                        <form action="#" class="newsletter-form">
                            <div class="newsletter-input-group">
                                <input
                                        type="email"
                                        placeholder="Email của bạn ..."
                                        required
                                >
                                <button class="newsletter-btn" type="submit">
                                    Đăng ký
                                </button>
                            </div>
                        </form>
                    </aside>
                </div>
            </div>
        </section>

        <!-- Footer Bottom Section -->
        <section class="footer-bottom">
            <div class="footer-bottom-content">
                © 2026 — <strong>BiBiCa Shop</strong> | Website kinh doanh sách<br>
                20130468 - Lê Phi Vũ<br>
                22130131 - Tống Duy Kiên<br>
                Khoa Công nghệ Thông tin - Trường Đại học Nông Lâm TP.HCM
            </div>
        </section>
    </footer>
</body>
</html>
