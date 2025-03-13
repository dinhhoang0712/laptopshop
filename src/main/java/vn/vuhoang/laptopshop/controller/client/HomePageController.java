package vn.vuhoang.laptopshop.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import vn.vuhoang.laptopshop.domain.User;
import vn.vuhoang.laptopshop.domain.dto.RegisterDTO;
import vn.vuhoang.laptopshop.service.ProductService;
import vn.vuhoang.laptopshop.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("products", productService.getAllProduct());
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("register", new RegisterDTO());

        return "client/auth/register";
    }

    @GetMapping("/login")
    public String getLogicPage() {
        return "client/auth/login";
    }

    @GetMapping("/deny")
    public String getDenyPage() {
        return "client/auth/deny";
    }

    @PostMapping("/register")
    public String postRegisterPage(@ModelAttribute("register") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "/client/auth/register";
        }
        User user = userService.registerDTO(registerDTO);
        user.setPassword(passwordEncoder.encode(registerDTO.getPassword()));
        user.setRole(userService.getRoleByName("USER"));
        userService.handleSaveUser(user);
        return "redirect:/login";
    }
}
