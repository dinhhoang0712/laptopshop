package vn.vuhoang.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.vuhoang.laptopshop.domain.Cart;

import vn.vuhoang.laptopshop.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {

    @Modifying
    @Transactional
    @Query("DELETE FROM Cart c WHERE c.id = :id")
    void deleteCartById(@Param("id") Long id);

    Cart findByUser(User user);

}
