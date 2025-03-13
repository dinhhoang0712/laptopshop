package vn.vuhoang.laptopshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import vn.vuhoang.laptopshop.repository.CartRepository;

@Controller
public class DashboardController {


    @GetMapping("/admin")
    public String getDashboard() {
        return "admin/dashboard/show";
    }


}
