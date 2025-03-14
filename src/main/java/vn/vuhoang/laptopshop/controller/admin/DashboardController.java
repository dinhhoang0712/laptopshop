package vn.vuhoang.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.vuhoang.laptopshop.service.ProductService;

@Controller
public class DashboardController {

    private final ProductService productService;

    public DashboardController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUser", productService.countUser());
        model.addAttribute("countProduct", productService.countProduct());
        model.addAttribute("countOrder", productService.countOrder());
        return "admin/dashboard/show";
    }

}
