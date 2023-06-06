package com.bit.controller;

import com.bit.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
public class SearchController {

    @Autowired
    private CartService cartService;

    @PostMapping("/search")
    public String goSearch(@RequestParam(value = "query",required = false)String query,
                           @RequestParam(value = "data",required = false)String data, Model model){

        HashMap<String,String>map = new HashMap<>();
        map.put("query",query);
        map.put("data",data);

        model.addAttribute("productList",cartService.searchProduct(map));
        return "cart/productList";
    }

}
