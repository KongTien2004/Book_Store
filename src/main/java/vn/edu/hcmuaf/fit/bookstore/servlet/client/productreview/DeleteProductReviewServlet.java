package vn.edu.hcmuaf.fit.bookstore.servlet.client.productreview;

import vn.edu.hcmuaf.fit.bookstore.service.ProductReviewService;
import vn.edu.hcmuaf.fit.bookstore.utils.Protector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteProductReviewServlet", value = "/deleteProductReview")
public class DeleteProductReviewServlet extends HttpServlet {
    private final ProductReviewService productReviewService = new ProductReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long productReviewId = Protector.of(() -> Long.parseLong(request.getParameter("productReviewId"))).get(0L);
        String productId = request.getParameter("productId");

        String successMessage = "Đã xóa đánh giá thành công!";
        String errorDeleteReviewMessage = "Đã có lỗi truy vấn!";

        Protector.of(() -> productReviewService.delete(productReviewId))
                .done(r -> request.getSession().setAttribute("successMessage", successMessage))
                .fail(e -> request.getSession().setAttribute("errorDeleteReviewMessage", errorDeleteReviewMessage));

        response.sendRedirect(request.getContextPath() + "/product?id=" + productId + "#review");
    }
}
