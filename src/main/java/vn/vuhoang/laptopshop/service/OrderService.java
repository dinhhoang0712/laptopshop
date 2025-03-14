package vn.vuhoang.laptopshop.service;

import org.springframework.stereotype.Service;
import vn.vuhoang.laptopshop.domain.Order;
import vn.vuhoang.laptopshop.domain.OrderDetail;
import vn.vuhoang.laptopshop.domain.User;
import vn.vuhoang.laptopshop.repository.OrderDetailRepository;
import vn.vuhoang.laptopshop.repository.OrderRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<OrderDetail> getAllOrderDetail(User user) {
        Order order = orderRepository.findByUser(user);
        return order == null ? new ArrayList<>() : order.getOrderDetail();
    }

    public List<Order> getAllOrder() {
        return orderRepository.findAll();
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
