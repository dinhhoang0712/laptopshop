package vn.vuhoang.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.vuhoang.laptopshop.domain.Product;
import vn.vuhoang.laptopshop.service.ProductService;
import vn.vuhoang.laptopshop.service.UploadService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getDashboard(Model model) {
        List<Product> products = productService.getAllProduct();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProduct(@PathVariable("id") long id, Model model) {
        model.addAttribute("product", productService.findId(id));
        return "admin/product/update";
    }

    @GetMapping("/admin/product/view/{id}")
    public String getDetailProduct(@PathVariable("id") long id, Model model) {
        model.addAttribute("product", productService.findId(id));

        return "admin/product/detail";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProduct(@PathVariable("id") long id, Model model) {
        model.addAttribute("product", productService.findId(id));
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProduct(@ModelAttribute("product") @Valid Product product,
            BindingResult bindingResult,
            @RequestParam("img-file") MultipartFile image) {

        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }
        String img = uploadService.uploadFile(image, "product");
        product.setImage(img);
        productService.createProduct(product);
        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(@ModelAttribute("product") @Valid Product product,
            BindingResult bindingResult, @RequestParam("img-file") MultipartFile iFile) {

        if (bindingResult.hasErrors()) {
            return "admin/product/update";
        }

        Product newProduct = productService.findId(product.getId());
        if (newProduct != null) {
            if (!iFile.isEmpty()) {
                String img = uploadService.uploadFile(iFile, "product");
                newProduct.setImage(img);
            }
            newProduct.setName(product.getName());
            newProduct.setPrice(product.getPrice());
            newProduct.setDetailDesc(product.getDetailDesc());
            newProduct.setShortDesc(product.getShortDesc());
            newProduct.setFactory(product.getFactory());
            newProduct.setQuantity(product.getQuantity());
            newProduct.setTarget(product.getTarget());
            productService.createProduct(newProduct);
        }

        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(@ModelAttribute("product") Product product) {
        productService.deleteById(product.getId());

        return "redirect:/admin/product";
    }
}
