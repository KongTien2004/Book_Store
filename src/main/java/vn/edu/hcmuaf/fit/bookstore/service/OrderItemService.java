package vn.edu.hcmuaf.fit.bookstore.service;

import vn.edu.hcmuaf.fit.bookstore.beans.OrderItem;
import vn.edu.hcmuaf.fit.bookstore.DAO.OrderItemDAO;

import java.util.List;

public class OrderItemService extends Service<OrderItem, OrderItemDAO> implements OrderItemDAO {
    public OrderItemService() {
        super(OrderItemDAO.class);
    }

    @Override
    public void bulkInsert(List<OrderItem> orderItems) {
        jdbi.useExtension(OrderItemDAO.class, dao -> dao.bulkInsert(orderItems));
    }

    @Override
    public List<String> getProductNamesByOrderId(long orderId) {
        return jdbi.withExtension(OrderItemDAO.class, dao -> dao.getProductNamesByOrderId(orderId));
    }

    @Override
    public List<OrderItem> getByOrderId(long orderId) {
        return jdbi.withExtension(OrderItemDAO.class, dao -> dao.getByOrderId(orderId));
    }
}
