package vn.vuhoang.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.vuhoang.laptopshop.domain.*;
import vn.vuhoang.laptopshop.repository.*;

@Service
public class ProductService {

    private final OrderService orderService;

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserRepository userRepository;

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            UserRepository userRepository,
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository, OrderService orderService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.orderService = orderService;
    }

    public void createProduct(Product product) {
        productRepository.save(product);
    }

    public List<Product> getAllProduct() {
        return productRepository.findAll();
    }

    public Product findId(long id) {
        return productRepository.findById(id).orElse(null);
    }

    public void deleteById(long id) {
        productRepository.deleteById(id);
    }

    public void addProductToCart(String email, long idProduct, HttpSession session, long quantity) {
        User user = userRepository.findByEmail(email);

        if (user != null) {
            Cart cart = cartRepository.findByUser(user);
            if (cart == null) {
                cart = new Cart();
                cart.setSum(0);
                cart.setUser(user);
                cartRepository.save(cart);
            }

            Product product = findId(idProduct);
            CartDetail cartDetail = cartDetailRepository.findByCartAndProduct(cart, product);

            if (cartDetail == null) {
                cartDetail = new CartDetail();
                cartDetail.setPrice(product.getPrice());
                cartDetail.setProduct(product);
                cartDetail.setQuantity((int) quantity);
                cartDetail.setCart(cart);
                cartDetailRepository.save(cartDetail);

                int sum = cart.getSum() + 1;
                cart.setSum(sum);
                cartRepository.save(cart);
                session.setAttribute("sum", sum);
            } else {
                cartDetail.setQuantity(cartDetail.getQuantity() + (int) quantity);
                cartDetailRepository.save(cartDetail);
            }

        }
    }

    public Cart getCartUser(User user) {
        return cartRepository.findByUser(user);
    }

    public void deleteCartDetail(long id, HttpSession session) {
        Optional<CartDetail> obj = cartDetailRepository.findById(id);
        if (obj.isPresent()) {
            CartDetail cartDetail = obj.get();
            Cart cart = cartDetail.getCart();
            cartDetailRepository.deleteById(id);

            if (cart.getSum() > 1) {
                int sum = cart.getSum() - 1;
                cart.setSum(sum);
                cartRepository.save(cart);
                session.setAttribute("sum", sum);
            } else {
                cartRepository.deleteCartById(cart.getId());
                session.setAttribute("sum", 0);
            }

        }
    }

    public void updateCartBeforeCheckOut(List<CartDetail> cartDetailList) {
        for (CartDetail cartDetail : cartDetailList) {
            CartDetail cdOptional = cartDetailRepository.findById(cartDetail.getId()).orElse(null);
            cdOptional.setQuantity(cartDetail.getQuantity());
            cartDetailRepository.save(cdOptional);
            cartDetailRepository.save(cdOptional);
        }
    }

    public void placeCart(User user, HttpSession session, String name, String address, String phone) {
        Cart cart = cartRepository.findByUser(user);

        List<CartDetail> cartDetails = cart.getCartDetails();
        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(name);
        order.setReceiverAddress(address);
        order.setReceiverPhone(phone);
        order.setTotalPrice(totalPrice);
        order.setStatus("PENDING");
        order = orderRepository.save(order);

        for (CartDetail cartDetail : cartDetails) {
            OrderDetail od = new OrderDetail();
            od.setOrder(order);
            od.setProduct(cartDetail.getProduct());
            od.setQuantity(cartDetail.getQuantity());
            od.setPrice(cartDetail.getPrice());
            orderDetailRepository.save(od);
        }

        for (CartDetail cartDetail : cartDetails) {
            cartDetailRepository.deleteById(cartDetail.getId());
        }

        cartRepository.deleteCartById(cart.getId());
        session.setAttribute("sum", 0);
    }

    public long countUser() {
        return userRepository.count();
    }

    public long countProduct() {
        return productRepository.count();
    }

    public long countOrder() {
        return orderRepository.count();
    }
}
