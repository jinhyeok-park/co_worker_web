package com.example.demo.controller;

import com.example.demo.mapper.PostMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewPostController {

    @Autowired
    private PostMapper postMapper;
    @GetMapping("/newpost")
    public ModelAndView showNewPostPage()
    {
        ModelAndView mav = new ModelAndView("/newpost");
        return mav;
    }

    @PostMapping("/newpost")
    public ModelAndView posting(HttpSession session,
                                @RequestParam("title") String title,
                                @RequestParam("content") String content,
                                @RequestParam("address") String address,
                                @RequestParam("axis_x") String axis_x,
                                @RequestParam("axis_y") String axis_y)
    {
        postMapper.insertPost((String)session.getAttribute("user_id"), title, content, address, Double.parseDouble(axis_x), Double.parseDouble(axis_y));
        System.out.println("hit new post");
        ModelAndView mav = new ModelAndView("redierct:/posts_Collection");
        return mav;
    }
}
