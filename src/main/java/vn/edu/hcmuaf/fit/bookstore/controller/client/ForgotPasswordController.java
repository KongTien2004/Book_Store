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

        if (user != null) {
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
                request.setAttribute("error", "Không thể thêm token trong server.");
                request.getRequestDispatcher("/client/template/forgot_password.jsp").forward(request, response);
            }

            boolean isSent = resetPasswordService.sendResetEmail(email, resetLink, user.getUserName());
            if (!isSent) {
                request.setAttribute("error", "Không thể gửi link reset mật khẩu.");
                request.getRequestDispatcher("/client/template/forgot_password.jsp").forward(request, response);
            }

            request.setAttribute("success", "Gửi yêu cầu thành công!");

            request.getRequestDispatcher("/client/template/reset_password.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Tên email yêu cầu không đúng.");
            request.getRequestDispatcher("/client/template/forgot_password.jsp").forward(request, response);
        }
    }
}
