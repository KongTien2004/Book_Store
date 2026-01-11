package vn.edu.hcmuaf.fit.bookstore.servlet.admin;

import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.service.UserService;
import vn.edu.hcmuaf.fit.bookstore.utils.HashingUtils;
import vn.edu.hcmuaf.fit.bookstore.utils.Protector;
import vn.edu.hcmuaf.fit.bookstore.utils.Validator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@WebServlet(name = "SigninAdminServlet", value = "/admin/signin")
public class SigninAdminServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/signinAdminView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> values = new HashMap<>();
        values.put("username", request.getParameter("username"));
        values.put("password", request.getParameter("password"));

        Map<String, List<String>> violations = new HashMap<>();
        Optional<User> userFromServer = Protector.of(() -> userService.getByUsername(values.get("username")))
                .get(Optional::empty);
        violations.put("usernameViolations", Validator.of(values.get("username"))
                .isNotNullAndEmpty()
                .isNotBlankAtBothEnds()
                .isAtMostOfLength(25)
                .isExistent(userFromServer.isPresent(), "Tên đăng nhập")
                .toList());
        violations.put("passwordViolations", Validator.of(values.get("password"))
                .isNotNullAndEmpty()
                .isNotBlankAtBothEnds()
                .isAtMostOfLength(32)
                .changeTo(HashingUtils.hash(values.get("password")))
                .isEqualTo(userFromServer.map(User::getPassword).orElse(""), "Mật khẩu")
                .toList());

        int sumOfViolations = violations.values().stream().mapToInt(List::size).sum();

        if (sumOfViolations == 0 && userFromServer.isPresent()) {
            User user = userFromServer.get();
            if (Arrays.asList("ADMIN", "EMPLOYEE").contains(user.getRole())) {
                request.getSession().setAttribute("currentUser", user);
                response.sendRedirect(request.getContextPath() + "/admin");
            } else {
                String errorMessage = "Người dùng không có quyền đăng nhập Admin!";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/WEB-INF/views/signinAdminView.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("values", values);
            request.setAttribute("violations", violations);
            request.getRequestDispatcher("/WEB-INF/views/signinAdminView.jsp").forward(request, response);
        }
    }
}
