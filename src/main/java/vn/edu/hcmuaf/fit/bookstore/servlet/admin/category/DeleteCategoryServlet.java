package vn.edu.hcmuaf.fit.bookstore.servlet.admin.category;

import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.service.CategoryService;
import vn.edu.hcmuaf.fit.bookstore.utils.ImageUtils;
import vn.edu.hcmuaf.fit.bookstore.utils.Protector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "DeleteCategoryServlet", value = "/admin/categoryManager/delete")
public class DeleteCategoryServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Protector.of(() -> Long.parseLong(request.getParameter("id"))).get(0L);
        Optional<Category> categoryFromServer = Protector.of(() -> categoryService.getById(id)).get(Optional::empty);

        if (categoryFromServer.isPresent()) {
            String successMessage = String.format("Xóa thể loại #%s thành công!", id);
            String errorMessage = String.format("Xóa thể loại #%s thất bại!", id);

            Protector.of(() -> {
                        categoryService.delete(id);
                        Optional.ofNullable(categoryFromServer.get().getImageName()).ifPresent(ImageUtils::delete);
                    })
                    .done(r -> request.getSession().setAttribute("successMessage", successMessage))
                    .fail(e -> request.getSession().setAttribute("errorMessage", errorMessage));
        }

        response.sendRedirect(request.getContextPath() + "/admin/categoryManager");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
