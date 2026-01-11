package vn.edu.hcmuaf.fit.bookstore.servlet.client;

import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.beans.Product;
import vn.edu.hcmuaf.fit.bookstore.service.CategoryService;
import vn.edu.hcmuaf.fit.bookstore.service.ProductService;
import vn.edu.hcmuaf.fit.bookstore.utils.Protector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "")
public class HomeServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = Protector.of(() -> categoryService.getPart(12, 0))
                .get(ArrayList::new);
        List<Product> products = Protector.of(() -> productService.getOrderedPart(12, 0, "createdAt", "DESC"))
                .get(ArrayList::new);
        request.setAttribute("categories", categories);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/views/homeView.jsp").forward(request, response);
        //test
        System.out.println("Chạy project thành công. Đang ở HomeServlet và homeView.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
