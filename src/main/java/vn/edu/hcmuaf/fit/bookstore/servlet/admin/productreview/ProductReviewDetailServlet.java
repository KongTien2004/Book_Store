package vn.edu.hcmuaf.fit.bookstore.servlet.admin.productreview;

import vn.edu.hcmuaf.fit.bookstore.beans.ProductReview;
import vn.edu.hcmuaf.fit.bookstore.service.ProductReviewService;
import vn.edu.hcmuaf.fit.bookstore.service.ProductService;
import vn.edu.hcmuaf.fit.bookstore.service.UserService;
import vn.edu.hcmuaf.fit.bookstore.utils.Protector;
import vn.edu.hcmuaf.fit.bookstore.utils.TextUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "ProductReviewDetailServlet", value = "/admin/reviewManager/detail")
public class ProductReviewDetailServlet extends HttpServlet {
    private final ProductReviewService productReviewService = new ProductReviewService();
    private final UserService userService = new UserService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Protector.of(() -> Long.parseLong(request.getParameter("id"))).get(0L);
        Optional<ProductReview> productReviewFromServer = Protector.of(() -> productReviewService.getById(id))
                .get(Optional::empty);

        if (productReviewFromServer.isPresent()) {
            ProductReview productReview = productReviewFromServer.get();
            productReview.setContent(TextUtils.toParagraph(productReview.getContent()));
            Protector.of(() -> userService.getById(productReview.getUserId())).get(Optional::empty)
                    .ifPresent(productReview::setUser);
            Protector.of(() -> productService.getById(productReview.getProductId())).get(Optional::empty)
                    .ifPresent(productReview::setProduct);
            request.setAttribute("productReview", productReview);
            request.getRequestDispatcher("/WEB-INF/views/productReviewDetailView.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/reviewManager");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
