package vn.edu.hcmuaf.fit.bookstore.filter;

import vn.edu.hcmuaf.fit.bookstore.beans.User;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;
import java.util.stream.Stream;

@WebFilter(filterName = "AuthorizationFilter", value = "/admin/*")
public class AuthorizationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String loginURI = request.getContextPath() + "/admin/signin";
        String admin401URI = request.getContextPath() + "/admin/401";

        Optional<String> userRole = Optional.ofNullable(session)
                .map(s -> (User) s.getAttribute("currentUser"))
                .map(User::getRole);

        boolean isAdmin = userRole.map("ADMIN"::equals).orElse(false);
        boolean isEmployee = userRole.map("EMPLOYEE"::equals).orElse(false);
        boolean loginRequest = request.getRequestURI().equals(loginURI);

        Stream<String> restrictedPathsForEmployee = Stream.of("/admin/userManager")
                .map(path -> request.getContextPath() + path);

        boolean isNotAccessibleForEmployee = restrictedPathsForEmployee.anyMatch(p -> request.getRequestURI().startsWith(p));

        if (isAdmin || isEmployee || loginRequest) {
            if (isEmployee && isNotAccessibleForEmployee) {
                response.sendRedirect(admin401URI);
            } else {
                chain.doFilter(request, response);
            }
        } else {
            response.sendRedirect(loginURI);
        }
    }
}
