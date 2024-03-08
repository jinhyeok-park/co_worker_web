package com.example.demo.controller;

import com.example.demo.mapper.PostMapper;
import com.example.demo.model.Post;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Objects;
import java.util.concurrent.ExecutionException;

@Controller
public class MainController {

    @Autowired
    private PostMapper postMapper;

    @GetMapping("/")
    public ModelAndView mainp()
    {
        ArrayList<Post> post    = postMapper.selectAllPostsExceptZeroLocations();
        ModelAndView mav        = new ModelAndView("index");
        String json             = "";

        json = toJson(post);
        json = json.replace("\\n", "<br>");
        mav.addObject("postdata", json);
        return mav;
    }
    public static String toJson(ArrayList<Post> post)
    {
        String json                 = "";
        ObjectMapper objectMapper   = new ObjectMapper();

        try
        {
            json = objectMapper.writeValueAsString(post);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return json;
    }
}
