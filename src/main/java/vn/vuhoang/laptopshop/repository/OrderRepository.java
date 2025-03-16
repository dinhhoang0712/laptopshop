package vn.vuhoang.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.vuhoang.laptopshop.domain.Order;
import vn.vuhoang.laptopshop.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order findByUser(User user);

    Page<Order> findAll(Pageable pageable);

    List<Order> findAllByUser(User user);
}
