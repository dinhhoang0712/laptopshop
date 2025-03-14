package vn.vuhoang.laptopshop.controller.client;

import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.vuhoang.laptopshop.domain.CartDetail;
import vn.vuhoang.laptopshop.domain.Order;
import vn.vuhoang.laptopshop.domain.User;
import vn.vuhoang.laptopshop.repository.ProductRepository;
import vn.vuhoang.laptopshop.domain.Cart;
import vn.vuhoang.laptopshop.service.CartDetailService;
import vn.vuhoang.laptopshop.service.OrderService;
import vn.vuhoang.laptopshop.service.ProductService;
import vn.vuhoang.laptopshop.service.UserService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ItemController {

    private final ProductRepository productRepository;

    private final CartDetailService cartDetailService;
    private final ProductService productService;
    private final UserService userService;
    private final OrderService orderService;

    public ItemController(ProductService productService, UserService userService,
            CartDetailService cartDetailService, OrderService orderService, ProductRepository productRepository) {
        this.productService = productService;
        this.userService = userService;
        this.cartDetailService = cartDetailService;
        this.orderService = orderService;
        this.productRepository = productRepository;
    }

    @GetMapping("/product/{id}")
    public String showProductDetail(@PathVariable("id") long id, Model model) {
        model.addAttribute("product", productService.findId(id));
        return "client/product/detail";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User user = new User();
        HttpSession session = request.getSession(false);
        user.setId((long) session.getAttribute("id"));

        Cart cart = productService.getCartUser(user);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();
        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        User user = new User();
        HttpSession session = request.getSession(false);
        user.setId((long) session.getAttribute("id"));

        Cart cart = productService.getCartUser(user);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();
        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @GetMapping("/thanks")
    public String getThanksPage() {
        return "client/cart/place-order";
    }

    @GetMapping("order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest http) {
        User user = new User();
        HttpSession session = http.getSession(false);
        user.setId((long) session.getAttribute("id"));

        List<Order> orders = orderService.getAllOrderUser(user);
        model.addAttribute("orders", orders);
        return "client/cart/order-history";
    }

    @PostMapping("/add-product-form-view-detail")
    public String postAddProductFromViewDetail(@RequestParam("id") long id, @RequestParam("quantity") int quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        productService.addProductToCart(email, id, session, quantity);

        return "redirect:/product/" + id;
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String postAddProductToCart(@PathVariable("id") long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        productService.addProductToCart((String) session.getAttribute("email"), id, session, 1);

        return "redirect:/";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String postDeleteCart(@PathVariable("id") long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        productService.deleteCartDetail(id, session);

        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String postConfirmCheckout(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();
        productService.updateCartBeforeCheckOut(cartDetails);

        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String placeOrder(HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {
        HttpSession session = request.getSession(false);
        User user = new User();
        user.setId((long) session.getAttribute("id"));
        productService.placeCart(user, session, receiverName, receiverAddress, receiverPhone);
        return "redirect:/thanks";
    }
}
