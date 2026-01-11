package vn.edu.hcmuaf.fit.bookstore.controller.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.bookstore.DAO.client.ForgotPasswordDAO;
import vn.edu.hcmuaf.fit.bookstore.model.ForgetPasswordTokens;
import vn.edu.hcmuaf.fit.bookstore.model.Users;
import vn.edu.hcmuaf.fit.bookstore.service.client.ResetPasswordService;
import vn.edu.hcmuaf.fit.bookstore.service.client.UserService;

import java.io.IOException;

@WebServlet(name = "ForgotPasswordController", value = "/forgot_password")
public class ForgotPasswordController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/client/template/forgot_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        Users user = userService.checkEmail(email);

        if (user == null) {
            request.setAttribute("error", "Email không tồn tại trong hệ thống.");
            request.getRequestDispatcher("/client/template/forgot_password.jsp").forward(request, response);
            return;
        }

        ResetPasswordService resetPasswordService = new ResetPasswordService();
        String token = resetPasswordService.generateTokens();
        String resetLink = "http://localhost:8080/bookstore/reset_password?token=" + token;

        ForgetPasswordTokens newToken = new ForgetPasswordTokens(
                user.getUserId(),
                token,
                resetPasswordService.expiryTime(),
                false
        );

        ForgotPasswordDAO forgotPasswordDAO = new ForgotPasswordDAO();
        boolean isInserted = forgotPasswordDAO.insertToken(newToken);

        if (!isInserted) {
            request.setAttribute("error", "Không thể tạo token trong hệ thống.");
            request.getRequestDispatcher("/client/template/forgot_password.jsp").forward(request, response);
            return;
        }

        boolean isSent = resetPasswordService.sendResetEmail(email, resetLink, user.getUsername());

        if (!isSent) {
            request.setAttribute("error", "Không thể gửi link reset mật khẩu.");
            request.getRequestDispatcher("/client/template/forgot_password.jsp").forward(request, response);
            return;
        }

        request.setAttribute("success", "Link reset mật khẩu đã được gửi tới email của bạn. Vui lòng kiểm tra hộp thư!");
        request.getRequestDispatcher("/client/template/forgot_password.jsp").forward(request, response);
    }
}
