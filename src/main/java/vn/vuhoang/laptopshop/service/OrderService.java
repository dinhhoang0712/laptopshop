package vn.vuhoang.laptopshop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.vuhoang.laptopshop.domain.Order;
import vn.vuhoang.laptopshop.domain.OrderDetail;
import vn.vuhoang.laptopshop.domain.User;
import vn.vuhoang.laptopshop.repository.OrderRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<OrderDetail> getAllOrderDetail(User user) {
        Order order = orderRepository.findByUser(user);
        return order == null ? new ArrayList<>() : order.getOrderDetail();
    }

    public Page<Order> getAllOrder(Pageable pageable) {
        return orderRepository.findAll(pageable);
    }

    public Order getOrder(long id) {
        return orderRepository.findById(id).orElse(null);
    }

    public void savaOrder(Order order) {
        orderRepository.save(order);
    }

    public void deleteOrder(long id) {
        orderRepository.deleteById(id);
    }

    public List<Order> getAllOrderUser(User user) {
        return orderRepository.findAllByUser(user);
    }
}
