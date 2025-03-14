package vn.vuhoang.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.vuhoang.laptopshop.domain.Order;
import vn.vuhoang.laptopshop.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order findByUser(User user);

    List<Order> findAllByUser(User user);
}
