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

@WebServlet(name = "SignInController", value = "/sign_in")
public class SignInController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/client/template/sign_in.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
            request.getRequestDispatcher("/client/template/sign_in.jsp").forward(request, response);
            return;
        }

        Users user = userService.checkLogin(username.trim(), password);

        if (user != null) { //Đăng nhập thành công -> chuyển qua trang Home
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("role", user.getRole());

            //Nếu tài khoản là ADMIN -> chuyển qua trang dashboard của ADMIN
            if (user.getRole() == Users.Role.ADMIN) {
                response.sendRedirect(request.getContextPath() + "/admin/template/dashboard.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/client/template/home.jsp");
            }
        } else { //Đăng nhập thất bại -> Yêu cầu người dùng đăng nhập lại
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("/client/template/sign_in.jsp").forward(request, response);
        }
    }

}
