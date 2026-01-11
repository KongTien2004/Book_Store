package vn.edu.hcmuaf.fit.bookstore.servlet.admin.productreview;

import vn.edu.hcmuaf.fit.bookstore.service.ProductReviewService;
import vn.edu.hcmuaf.fit.bookstore.utils.Protector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateProductReviewServlet", value = "/admin/reviewManager/update")
public class UpdateProductReviewServlet extends HttpServlet {
    private final ProductReviewService productReviewService = new ProductReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Protector.of(() -> Long.parseLong(request.getParameter("id"))).get(0L);
        String action = request.getParameter("action");

        String errorMessage = "Đã có lỗi truy vấn!";

        if ("HIDE".equals(action)) {
            String successMessage = String.format("Đã ẩn đánh giá #%s thành công!", id);
            Protector.of(() -> productReviewService.hide(id))
                    .done(r -> request.getSession().setAttribute("successMessage", successMessage))
                    .fail(e -> request.getSession().setAttribute("errorMessage", errorMessage));
        }

        if ("SHOW".equals(action)) {
            String successMessage = String.format("Đã hiện đánh giá #%s thành công!", id);
            Protector.of(() -> productReviewService.show(id))
                    .done(r -> request.getSession().setAttribute("successMessage", successMessage))
                    .fail(e -> request.getSession().setAttribute("errorMessage", errorMessage));
        }

        response.sendRedirect(request.getContextPath() + "/admin/reviewManager");
    }
}
