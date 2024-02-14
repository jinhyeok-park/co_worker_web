package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HelloController {
    @GetMapping("/hello")
    public ModelAndView hello()
    {
        System.out.println("hit this is hello controller");

        ModelAndView mv =new ModelAndView("hello");
        mv.addObject("name","홍길동");

        List<String> jspSample= new ArrayList<>();
        jspSample.add("국어 : 100점");
        jspSample.add("수학 : 90점");
        jspSample.add("영어 : 75점");
        jspSample.add("중꿔 : 75점");
        mv.addObject("list",jspSample);
        return mv;
    }
}
