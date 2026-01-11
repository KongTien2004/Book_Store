package vn.edu.hcmuaf.fit.bookstore.servlet.admin.order;

import vn.edu.hcmuaf.fit.bookstore.service.OrderService;
import vn.edu.hcmuaf.fit.bookstore.utils.Protector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateOrderServlet", value = "/admin/orderManager/update")
public class UpdateOrderServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Protector.of(() -> Long.parseLong(request.getParameter("id"))).get(0L);
        String action = request.getParameter("action");

        String errorMessage = "Đã có lỗi truy vấn!";

        if ("CONFIRM".equals(action)) {
            String successMessage = String.format("Đã xác nhận đã giao đơn hàng #%s thành công!", id);
            Protector.of(() -> orderService.confirm(id))
                    .done(r -> request.getSession().setAttribute("successMessage", successMessage))
                    .fail(e -> request.getSession().setAttribute("errorMessage", errorMessage));
        }

        if ("CANCEL".equals(action)) {
            String successMessage = String.format("Đã hủy đơn hàng #%s thành công!", id);
            Protector.of(() -> orderService.cancel(id))
                    .done(r -> request.getSession().setAttribute("successMessage", successMessage))
                    .fail(e -> request.getSession().setAttribute("errorMessage", errorMessage));
        }

        if ("RESET".equals(action)) {
            String successMessage = String.format("Đã đặt lại trạng thái là đang giao hàng cho đơn hàng #%s thành công!", id);
            Protector.of(() -> orderService.reset(id))
                    .done(r -> request.getSession().setAttribute("successMessage", successMessage))
                    .fail(e -> request.getSession().setAttribute("errorMessage", errorMessage));
        }

        response.sendRedirect(request.getContextPath() + "/admin/orderManager");
    }
}
