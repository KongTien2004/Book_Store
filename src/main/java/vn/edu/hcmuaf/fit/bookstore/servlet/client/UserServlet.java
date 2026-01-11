package vn.edu.hcmuaf.fit.bookstore.servlet.client;

import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.service.CartService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {

    private final CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user != null) {
            int countCartItemQuantityByUserId = cartService.countCartItemQuantityByUserId(user.getId());
            request.setAttribute("countCartItemQuantity", countCartItemQuantityByUserId);

            int countOrderByUserId = cartService.countOrderByUserId(user.getId());
            request.setAttribute("countOrder", countOrderByUserId);

            int countOrderDeliverByUserId = cartService.countOrderDeliverByUserId(user.getId());
            request.setAttribute("countOrderDeliver", countOrderDeliverByUserId);

            int countOrderReceivedByUserId = cartService.countOrderReceivedByUserId(user.getId());
            request.setAttribute("countOrderReceived", countOrderReceivedByUserId);
        }

        request.getRequestDispatcher("/WEB-INF/views/userView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
