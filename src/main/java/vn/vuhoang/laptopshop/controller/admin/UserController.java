package vn.vuhoang.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import vn.vuhoang.laptopshop.domain.User;
import vn.vuhoang.laptopshop.service.UploadService;
import vn.vuhoang.laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
        this.uploadService = uploadService;
    }

    // Get

    @GetMapping("/admin/user")
    public String getAdminUser(Model model) {
        List<User> users = userService.getAllUser();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String getAdminLogin(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @GetMapping("/admin/user/view/{id}")
    public String getUserDetail(@PathVariable("id") long id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUser(@PathVariable("id") long id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("updateUser", user);
        return "admin/user/update";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String deleteUser(@PathVariable("id") long id, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("deleteUser", new User());
        return "admin/user/delete";
    }

    // Post

    @PostMapping("/admin/user/create")
    public String postCreateUser(@ModelAttribute("newUser") @Valid User user,
            BindingResult bindingResult,
            @RequestParam("img-file") MultipartFile file) {

        if (bindingResult.hasErrors()) {
            return "/admin/user/create";
        }
        String avatar = uploadService.uploadFile(file, "avatar");
        String hashPassword = passwordEncoder.encode(user.getPassword());
        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(userService.getRoleByName(user.getRole().getName()));
        userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(@ModelAttribute("updateUser") User user,
            @RequestParam("img-file") MultipartFile file) {
        String avatar = uploadService.uploadFile(file, "avatar");
        User newUser = userService.getUserById(user.getId());
        if (newUser != null) {
            newUser.setFullName(user.getFullName());
            newUser.setAddress(user.getAddress());
            newUser.setPhone(user.getPhone());
            newUser.setAvatar(avatar);
            newUser.setRole(userService.getRoleByName(user.getRole().getName()));
            userService.handleSaveUser(newUser);
        }
        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(@ModelAttribute("deleteUser") User user) {
        userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
    }
}
