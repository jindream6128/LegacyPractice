package com.bit.controller;

import com.bit.dto.CommentDTO;
import com.bit.service.CartService;
import com.mysql.cj.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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

    @PostMapping("/addinsert")
    public String addinsertcomment(HttpSession session,String BOARD_NO,String PARENT_NO,String session_USER_ID,String CONTENTS,Model model){

        String USER_ID = (String) session.getAttribute("id");
        CommentDTO commentDTO= new CommentDTO(Integer.parseInt(BOARD_NO),Integer.parseInt(PARENT_NO),USER_ID,CONTENTS);
        System.out.println(commentDTO);
        System.out.println("--------------------");
        System.out.println(BOARD_NO);
        System.out.println(PARENT_NO);
        System.out.println(USER_ID);
        System.out.println(CONTENTS);
        System.out.println("--------------------");

        cartService.addinsertcomment(commentDTO);
        model.addAttribute("list", cartService.productInfo(Integer.parseInt(BOARD_NO)));
        model.addAttribute("cnt_no",BOARD_NO);
        return "cart/productInfo";
    }

    @DeleteMapping("/commentdelete/{no}")
    public void deleteComment(@PathVariable int no){
        System.out.println(no);
        cartService.deletecomment(no);
    }

}
