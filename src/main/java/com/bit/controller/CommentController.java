package com.bit.controller;

import com.bit.dto.CommentDTO;
import com.bit.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CartService cartService;

    @RequestMapping("/insertcomment")
    public String insertcomment(String BOARD_NO,String USER_ID,String CONTENTS,String cnt_no,Model model){
        System.out.println("------------------------");
        // BOARD_NO 게시글 번호
        // USER_ID 작성자
        // CONTENTS 댓글 내용

        //insert
        cartService.insertcomment(new CommentDTO(Integer.parseInt(BOARD_NO),USER_ID,CONTENTS));

        //받아오기
        //List<CommentDTO> selectallcomment = cartService.selectallcomment(Integer.parseInt(BOARD_NO));
        //System.out.println(selectallcomment);

        //여기에서 board_no 알고있으니까 -> list로 넣어줘라 뭐를? 인포를
        model.addAttribute("list", cartService.productInfo(Integer.parseInt(BOARD_NO)));
        model.addAttribute("cnt_no",cnt_no);

        //model.addAttribute("commentlist",selectallcomment);

        return "cart/productInfo";
    }

    @PostMapping("/selectallcomment")
    @ResponseBody
    public List<CommentDTO> selectallcomment(int board_no){
        List<CommentDTO> selectallcomment = cartService.selectallcomment(board_no);
        return selectallcomment;
    }

 /*   @GetMapping("/productInfo/{no}/{cnt_no}")
    public String productInfoProcess(@PathVariable("no")int no, @PathVariable("cnt_no")int cnt_no, Model model){
        //해당 게시글 번호의 데이터 가져오기
        model.addAttribute("list", cartService.productInfo(no));
        //no <- 이게 실질적인 제품 번호 ~! cnt_no <- 이거는 상품의 갯수
        model.addAttribute("cnt_no",cnt_no);
        return "cart/productInfo";
    }*/

}
