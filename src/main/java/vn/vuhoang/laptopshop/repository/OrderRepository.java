package vn.vuhoang.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.vuhoang.laptopshop.domain.Order;
import vn.vuhoang.laptopshop.domain.OrderDetail;
import vn.vuhoang.laptopshop.domain.User;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order findByUser(User user);
}
