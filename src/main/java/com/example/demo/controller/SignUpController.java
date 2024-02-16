package com.example.demo.controller;

import com.example.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.model.User;

import java.util.Map;

@Controller
public class SignUpController {
    @Autowired
    private UserMapper userMapper;

    @GetMapping("/signup")
    public ModelAndView showSignUpForm() {
        ModelAndView mav = new ModelAndView("SignUpForm");
        mav.addObject("user", new User());
        return mav;
    }

    @PostMapping("signup")
    public ModelAndView registerUser(@RequestParam("username") String username,
                                     @RequestParam("password") String password,
                                     @RequestParam("email") String email) {

        ModelAndView mav = new ModelAndView("redirect:/"); // 로그인 페이지로 리다이렉트
        return mav;
    }
}
