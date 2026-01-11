package vn.edu.hcmuaf.fit.bookstore.servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SignoutAdminServlet", value = "/admin/signout")
public class SignoutAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xóa các attribute trong session
        request.getSession().invalidate();

        // Trở về Trang đăng nhập Admin
        response.sendRedirect(request.getContextPath() + "/admin/signin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
