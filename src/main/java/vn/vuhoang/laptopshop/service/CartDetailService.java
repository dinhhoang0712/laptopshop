package vn.vuhoang.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.vuhoang.laptopshop.domain.Cart;
import vn.vuhoang.laptopshop.domain.CartDetail;
import vn.vuhoang.laptopshop.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    public List<CartDetail> getAllDetails(Cart cart) {
        return cartDetailRepository.findByCart(cart);
    }
}
