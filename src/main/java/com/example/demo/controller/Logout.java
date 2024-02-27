package com.example.demo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class Logout {

    @PostMapping("/logout")
    public ModelAndView logout(HttpSession session)
    {
        session.invalidate();
        return new ModelAndView("redirect:/");
    }
}
