package vn.edu.hcmuaf.fit.bookstore.controller.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.bookstore.DAO.client.ForgotPasswordDAO;
import vn.edu.hcmuaf.fit.bookstore.DAO.client.UserDAO;
import vn.edu.hcmuaf.fit.bookstore.model.ForgetPasswordTokens;
import vn.edu.hcmuaf.fit.bookstore.service.client.ResetPasswordService;

import java.io.IOException;

@WebServlet(name = "ResetPasswordController", value = "/reset_password")
public class ResetPasswordController extends HttpServlet {
    private ForgotPasswordDAO forgotPasswordDAO = new ForgotPasswordDAO();
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");

        HttpSession session = request.getSession();

        if (token != null) {
            ForgetPasswordTokens passwordToken = forgotPasswordDAO.getToken(token);
            ResetPasswordService resetService = new ResetPasswordService();

            if (passwordToken == null) {
                request.setAttribute("notification", "Token không hợp lệ.");
                request.getRequestDispatcher("/client/template/reset_password.jsp").forward(request, response);
            }

            if (passwordToken.isUsed()) {
                request.setAttribute("notification", "Token đã được dùng.");
                request.getRequestDispatcher("/client/template/reset_password.jsp").forward(request, response);
            }

            if (resetService.isExpired(passwordToken.getExpiryTime())) {
                request.setAttribute("notification", "Token đã hết hạn.");
                request.getRequestDispatcher("/client/template/reset_password.jsp").forward(request, response);
            }

            session.setAttribute("passwordToken", passwordToken.getToken());

            request.getRequestDispatcher("/client/template/reset_password.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/client/template/forgot_password.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPassword = request.getParameter("new-password");
        String confirmNewPassword = request.getParameter("confirm-new-password");

        if (!newPassword.equalsIgnoreCase(confirmNewPassword)) {
            request.setAttribute("notification", "Mật khẩu mới phải trùng với mật khẩu xác nhận.");
            request.getRequestDispatcher("/client/template/reset_password.jsp").forward(request, response);
        }

        HttpSession session = request.getSession();
        ForgetPasswordTokens token = new ForgetPasswordTokens();
        token.setToken((String) session.getAttribute("token"));
        token.setUsed(true);

        userDAO.updatePassword(newPassword);
        forgotPasswordDAO.updateTokenStatus(token);

        request.getRequestDispatcher("/client/template/sign_in.jsp").forward(request, response);
    }
}
