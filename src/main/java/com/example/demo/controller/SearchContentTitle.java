package com.example.demo.controller;

import com.example.demo.mapper.PostMapper;
import com.example.demo.model.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Array;
import java.util.ArrayList;

@RestController
public class SearchContentTitle {
    @Autowired
    private PostMapper postMapper;

    @GetMapping("/searchContent")
    public ArrayList<Post> test(@RequestParam("keyword") String keyword)
    {

        System.out.println("SearchContenttielt function called");
        ArrayList<Post> posts = postMapper.findByTitleOrContentContaining(keyword);
        return posts;
    }
}
