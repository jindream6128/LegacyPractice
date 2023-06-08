package com.bit.controller;

import com.bit.dto.BasketDTO;
import com.bit.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;

@Controller
public class ShoppingCartController {

    @Autowired
    private CartService cartService;

    //장바구니 누르면 장바구니 userid랑 상품번호 db에넣기
    @GetMapping("/basket/{no}/{id}")
    public String basketProcess(@PathVariable("no")int no, @PathVariable("id")String id, Model model){
        //no는 실질적인 제품의 번호이다

        BasketDTO basketDTO = new BasketDTO(id,no);
        if(cartService.checkBasketdata(basketDTO)){
            //true이면 데이터가 없다
            cartService.addBasket(basketDTO);
        }else{
            //그렇지 않으면 cnt를 update해라
            cartService.upcntBasket(basketDTO);
        }
        //System.out.println(cartService.selectBasketAll(basketDTO));
        //model.addAttribute("list",cartService.selectBasketAll(id));
        return "redirect:/gocartList";
    }

    //상품 번호랑 로그인되어 있는 아이디만 가지고오면 해당 상품을 장바구니에서 삭제할수 있음
    @GetMapping("/cartdelete/{no}/{id}")
    public String cartdelete(@PathVariable("no")int no, @PathVariable("id")String id){
        //no 는  product no
        //id 는 로그인되어있는 user id

        cartService.deleteBasketproduct(new BasketDTO(id,no));
        return "redirect:/gocartList";
    }

    @GetMapping("/gocartList")
    public String goCartList(Model model, HttpSession session){
        String id = (String) session.getAttribute("id");
        model.addAttribute("listsize",cartService.selectBasketAll(id).size());
        model.addAttribute("list",cartService.selectBasketAll(id));
        return "cart/cartList";
    }


}
