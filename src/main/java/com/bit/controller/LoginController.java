package com.bit.controller;

import com.bit.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.HashMap;

@Controller
public class LoginController {
    @Autowired
    private CartService service;

}
