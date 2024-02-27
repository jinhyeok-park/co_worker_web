package com.example.demo.controller;

import com.example.demo.mapper.PostMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostCollectionController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private  PostMapper postMapper;

    @GetMapping("/posts_Collection")
    public ModelAndView showPosts()
    {
        ModelAndView mav = new ModelAndView("/postsCollection");
        return mav;
    }
}
