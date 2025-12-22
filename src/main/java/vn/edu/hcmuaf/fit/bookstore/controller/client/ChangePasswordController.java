package vn.edu.hcmuaf.fit.bookstore.controller.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.bookstore.model.Users;
import vn.edu.hcmuaf.fit.bookstore.service.client.UserService;

import java.io.IOException;

@WebServlet(name = "ChangPasswordController", value = "/change_password")
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/client/template/change_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");
        String confirmNewPassword = request.getParameter("confirm-new-password");

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        UserService userService = new UserService();

        if (user == null) {
            session.setAttribute("error", "Bạn cần đăng nhập để đổi mật khẩu.");
            response.sendRedirect(request.getContextPath() + "/sign_in");
            return;
        }

        if (currentPassword == null || currentPassword.isEmpty() ||
                newPassword == null || newPassword.isEmpty() ||
                confirmNewPassword == null || confirmNewPassword.isEmpty()) {
            request.setAttribute("error", "Vui lòng điền đầy đủ các trường.");
            request.getRequestDispatcher("/client/template/change_password.jsp").forward(request, response);
            return;
        }

        if (!user.getPassword().equals(currentPassword)) {
            request.setAttribute("error", "Mật khẩu hiện tại không đúng.");
            request.getRequestDispatcher("/client/template/change_password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmNewPassword)) {
            request.setAttribute("error", "Mật khẩu mới và xác nhận mật khẩu mới không khớp.");
            request.getRequestDispatcher("/client/template/change_password.jsp").forward(request, response);
            return;
        }

        if (newPassword.equals(currentPassword)) {
            request.setAttribute("error", "Mật khẩu mới không được trùng với mật khẩu hiện tại.");
            request.getRequestDispatcher("/client/template/change_password.jsp").forward(request, response);
            return;
        }

        if (userService.updatePassword(user.getUserId(), newPassword)) {
            user.setPassword(newPassword); // Update password in session
            session.setAttribute("auth", user); // Re-set the updated user in session
            request.setAttribute("success", "Đổi mật khẩu thành công!");
        } else {
            request.setAttribute("error", "Đổi mật khẩu thất bại. Vui lòng thử lại.");
        }

        request.getRequestDispatcher("/client/template/change_password.jsp").forward(request, response);
    }

}
