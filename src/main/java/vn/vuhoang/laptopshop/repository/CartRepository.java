package vn.vuhoang.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.vuhoang.laptopshop.domain.Cart;

import vn.vuhoang.laptopshop.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {

    void deleteById(Long id);
    Cart findByUser(User user);

}
