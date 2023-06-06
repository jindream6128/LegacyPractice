package com.bit.controller;

import com.bit.dto.SignupDTO;
import com.bit.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    @Autowired
    private CartService service;

    @PostMapping("/usersignup")
    @ResponseBody //이렇게하면 리턴값이 바디로
    public String goUserSignup(String signid, String signname, String signpass){
        System.out.println(signid);
        //여기서 회원가입 하거나 만약 존재하는 아이디이면 다시 해당페이지로 가기
        String nickname = service.idDuplicationchk(signid);

        String failmessage ="<script>alert('Fail SignUp Check Your ID');location.href='/gosignup';</script>";
        String successmessage ="<script>alert('Success SignUp');location.href='/login';</script>";

        if(nickname == null){
            //회원가입
            SignupDTO signupDTO = new SignupDTO(signid,signname,signpass);
            service.signup(signupDTO);
            return successmessage;
        }
            //회원가입 실패
            return failmessage;
    }

}
