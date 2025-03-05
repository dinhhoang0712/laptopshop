package vn.vuhoang.laptopshop;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        return "Hello hoang dz";
    }

    @GetMapping("/user")
    public String userPage() {
        return "Nguoi dung";
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "Admin";
    }
}
