package vn.edu.hcmuaf.fit.bookstore.filter;

import vn.edu.hcmuaf.fit.bookstore.dto.ErrorMessage;
import vn.edu.hcmuaf.fit.bookstore.utils.JsonUtils;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "ExceptionFilter", value = "/*")
public class ExceptionFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        try {
            chain.doFilter(request, response);
        } catch (RuntimeException e) {
            ErrorMessage errorMessage = new ErrorMessage(400, e.toString());
            JsonUtils.out(response, errorMessage, HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
