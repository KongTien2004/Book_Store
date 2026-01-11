package vn.edu.hcmuaf.fit.bookstore.servlet.admin.order;

import vn.edu.hcmuaf.fit.bookstore.beans.Order;
import vn.edu.hcmuaf.fit.bookstore.beans.OrderItem;
import vn.edu.hcmuaf.fit.bookstore.service.OrderItemService;
import vn.edu.hcmuaf.fit.bookstore.service.OrderService;
import vn.edu.hcmuaf.fit.bookstore.service.UserService;
import vn.edu.hcmuaf.fit.bookstore.utils.Protector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "OrderManagerServlet", value = "/admin/orderManager")
public class OrderManagerServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();
    private final UserService userService = new UserService();
    private final OrderItemService orderItemService = new OrderItemService();

    private static final int ORDERS_PER_PAGE = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int totalOrders = Protector.of(orderService::count).get(0);
        int totalPages = totalOrders / ORDERS_PER_PAGE + (totalOrders % ORDERS_PER_PAGE != 0 ? 1 : 0);

        String pageParam = Optional.ofNullable(request.getParameter("page")).orElse("1");
        int page = Protector.of(() -> Integer.parseInt(pageParam)).get(1);
        if (page < 1 || page > totalPages) {
            page = 1;
        }

        int offset = (page - 1) * ORDERS_PER_PAGE;

        List<Order> orders = Protector.of(() -> orderService.getOrderedPart(
                ORDERS_PER_PAGE, offset, "id", "DESC"
        )).get(ArrayList::new);

        for (Order order : orders) {
            Protector.of(() -> userService.getById(order.getUserId())).get(Optional::empty).ifPresent(order::setUser);
            List<OrderItem> orderItems = Protector.of(() -> orderItemService.getByOrderId(order.getId())).get(ArrayList::new);
            order.setOrderItems(orderItems);
            order.setTotalPrice(calculateTotalPrice(orderItems, order.getDeliveryPrice()));
        }

        request.setAttribute("totalPages", totalPages);
        request.setAttribute("page", page);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/WEB-INF/views/orderManagerView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    public static double calculateTotalPrice(List<OrderItem> orderItems, double deliveryPrice) {
        double totalPrice = deliveryPrice;

        for (OrderItem orderItem : orderItems) {
            if (orderItem.getDiscount() == 0) {
                totalPrice += orderItem.getPrice() * orderItem.getQuantity();
            } else {
                totalPrice += (orderItem.getPrice() * (100 - orderItem.getDiscount()) / 100) * orderItem.getQuantity();
            }
        }

        return totalPrice;
    }
}
