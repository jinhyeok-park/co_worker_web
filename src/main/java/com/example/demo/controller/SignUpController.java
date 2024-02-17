package com.example.demo.controller;

import ch.qos.logback.core.encoder.EchoEncoder;
import com.example.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
                                     @RequestParam("email") String email,
                                     @RequestParam("nickname") String nickname,
                                     @RequestParam("phoneNum") String phoneNum) {
        try
        {
            userMapper.insertUser(username, password, nickname, email, phoneNum, 0);
        }
        catch (Exception e)
        {
            ModelAndView mav = new ModelAndView("SignUpForm");
            mav.addObject("user", new User());
//            mav.addObject("error", e.getMessage());
            return mav;
        }
        return new ModelAndView("redirect:/");
    }
}