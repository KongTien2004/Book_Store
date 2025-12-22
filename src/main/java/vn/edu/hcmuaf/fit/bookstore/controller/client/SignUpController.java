package vn.edu.hcmuaf.fit.bookstore.controller.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.bookstore.model.Users;
import vn.edu.hcmuaf.fit.bookstore.service.client.UserService;

import java.io.IOException;

@WebServlet(name = "SignUpController", value = "/sign_up")
public class SignUpController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/client/template/sign_up.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        // Kiểm tra dữ liệu đầu vào có rỗng không
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                confirmPassword == null || confirmPassword.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
            request.getRequestDispatcher("/client/template/sign_up.jsp").forward(request, response);
            return;
        }

        // Trim dữ liệu
        username = username.trim();

        // Kiểm tra username có ít nhất 3 ký tự
        if (username.length() < 3) {
            request.setAttribute("error", "Tên đăng nhập phải có ít nhất 3 ký tự!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/client/template/sign_up.jsp").forward(request, response);
            return;
        }

        // Kiểm tra password có ít nhất 6 ký tự
        if (password.length() < 6) {
            request.setAttribute("error", "Mật khẩu phải có ít nhất 6 ký tự!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/client/template/sign_up.jsp").forward(request, response);
            return;
        }

        // Kiểm tra password và confirm password có khớp nhau không
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/client/template/sign_up.jsp").forward(request, response);
            return;
        }

        // Kiểm tra username đã tồn tại chưa
        Users existingUser = userService.checkUsername(username);
        if (existingUser != null) {
            request.setAttribute("error", "Tên đăng nhập đã tồn tại!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/client/template/sign_up.jsp").forward(request, response);
            return;
        }

        // Tạo user mới với role CLIENT
        Users newUser = new Users(username, password, Users.Role.CLIENT);

        // Đăng ký user
        boolean isRegistered = userService.registerUser(newUser);

        if (isRegistered) {
            // Đăng ký thành công -> chuyển về trang đăng nhập với thông báo
            request.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("/client/template/sign_in.jsp").forward(request, response);
        } else {
            // Đăng ký thất bại
            request.setAttribute("error", "Đăng ký thất bại! Vui lòng thử lại.");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/client/template/sign_up.jsp").forward(request, response);
        }
    }

}
