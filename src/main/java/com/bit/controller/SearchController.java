package com.bit.controller;

import com.bit.dto.ProductDTO;
import com.bit.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

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

    @PostMapping("/cartListSearch")
    public String goCartListSearch(@RequestParam(value = "cartlistquery")String cartlistquery, Model model, HttpSession session){
        //맵에다가 아이디랑, 동시에 넣고 가져가자
        String id = (String) session.getAttribute("id");

        HashMap<String,String > map = new HashMap<>();
        map.put("id",id);
        map.put("cartlistquery",cartlistquery);

        model.addAttribute("listsize",cartService.cartSearchProduct(map).size());
        model.addAttribute("list",cartService.cartSearchProduct(map));
        //아이디랑, 검색어 가지고가서, id에 해당하는것들 중 검색어에 해당하는거 뽑아내기
        return "cart/cartList";
    }


}
