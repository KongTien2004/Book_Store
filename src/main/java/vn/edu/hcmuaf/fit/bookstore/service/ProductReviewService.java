package vn.edu.hcmuaf.fit.bookstore.service;

import vn.edu.hcmuaf.fit.bookstore.beans.ProductReview;
import vn.edu.hcmuaf.fit.bookstore.DAO.ProductReviewDAO;

import java.util.List;

public class ProductReviewService extends Service<ProductReview, ProductReviewDAO> implements ProductReviewDAO {
    public ProductReviewService() {
        super(ProductReviewDAO.class);
    }

    @Override
    public List<ProductReview> getOrderedPartByProductId(int limit, int offset, String orderBy, String orderDir, long productId) {
        return jdbi.withExtension(ProductReviewDAO.class, dao -> dao.getOrderedPartByProductId(limit, offset, orderBy, orderDir, productId));
    }

    @Override
    public int countByProductId(long productId) {
        return jdbi.withExtension(ProductReviewDAO.class, dao -> dao.countByProductId(productId));
    }

    @Override
    public int sumRatingScoresByProductId(long productId) {
        return jdbi.withExtension(ProductReviewDAO.class, dao -> dao.sumRatingScoresByProductId(productId));
    }

    @Override
    public int count() {
        return jdbi.withExtension(ProductReviewDAO.class, ProductReviewDAO::count);
    }

    @Override
    public void hide(long id) {
        jdbi.useExtension(ProductReviewDAO.class, dao -> dao.hide(id));
    }

    @Override
    public void show(long id) {
        jdbi.useExtension(ProductReviewDAO.class, dao -> dao.show(id));
    }
}
