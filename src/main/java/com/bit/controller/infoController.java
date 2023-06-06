package com.bit.controller;

import com.bit.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class infoController {

    @Autowired
    private CartService cartService;

    @GetMapping("/delete/{no}")
    public String deleteProduct(@PathVariable("no")int no){
        cartService.productDelete(no);
        return "redirect:/productList";
    }
}
