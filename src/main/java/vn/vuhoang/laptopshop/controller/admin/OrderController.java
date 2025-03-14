package vn.vuhoang.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.vuhoang.laptopshop.domain.Order;
import vn.vuhoang.laptopshop.service.OrderService;

@Controller
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getDashboard(Model model) {

        model.addAttribute("orders", orderService.getAllOrder());
        return "admin/order/show";
    }

    @GetMapping("/admin/order/view/{id}")
    public String getDetailOrder(@PathVariable("id") Long id, Model model) {
        Order order = orderService.getOrder(id);
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", order.getOrderDetail());
        return "admin/order/detail";
    }

    @GetMapping("admin/order/update/{id}")
    public String getUpdateOrder(@PathVariable("id") long id, Model model) {
        model.addAttribute("order", orderService.getOrder(id));

        return "admin/order/update";
    }

    @GetMapping("admin/order/delete/{id}")
    public String getDeleteOrder(Model model, @PathVariable("id") long id) {
        model.addAttribute("order", orderService.getOrder(id));
        return "admin/order/delete";
    }

    @PostMapping("admin/order/update")
    public String postUpdateOrder(@RequestParam("status") String status, @RequestParam("id") Long id) {
        Order order = orderService.getOrder(id);
        order.setStatus(status);
        orderService.savaOrder(order);

        return "redirect:/admin/order";
    }

    @PostMapping("admin/order/delete")
    public String postDeleteOrder(@ModelAttribute("order") Order order) {
        orderService.deleteOrder(order.getId());

        return "redirect:/admin/order";
    }

}
