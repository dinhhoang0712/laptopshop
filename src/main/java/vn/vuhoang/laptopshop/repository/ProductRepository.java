package vn.vuhoang.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.vuhoang.laptopshop.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
