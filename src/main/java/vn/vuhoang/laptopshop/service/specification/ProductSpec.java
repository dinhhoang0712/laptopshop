package vn.vuhoang.laptopshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.vuhoang.laptopshop.domain.Product;
import vn.vuhoang.laptopshop.domain.Product_;

public class ProductSpec {
    public static Specification<Product> findInFactory(List<String> factory) {
        return (root, query, builder) -> builder.in(root.get(Product_.FACTORY)).value(factory);
    }

    public static Specification<Product> findInTarget(List<String> target) {
        return (root, query, builder) -> builder.in(root.get(Product_.TARGET)).value(target);
    }

    public static Specification<Product> findPrice(double min, double max) {
        return (root, query, builder) -> builder.between(root.get(Product_.PRICE), min, max);
    }

    public static Specification<Product> minPrice(double price) {
        return (root, query, builder) -> builder.ge(root.get(Product_.PRICE), price);
    }
}
