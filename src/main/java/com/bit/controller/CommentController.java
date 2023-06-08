package com.bit.controller;

import com.bit.dto.Comment2DTO;
import com.bit.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CartService cartService;

    @PostMapping("/firstadd")
    @ResponseBody
    public String firstaddcomment(String user_id,String contents,int board_no){
        cartService.addComment(new Comment2DTO(user_id,contents,board_no));
        return "success";
    }

    @GetMapping("getcomment")
    @ResponseBody
    public List<Comment2DTO> getcomment(int board_no){
        return cartService.getComment(board_no);
    }

}
