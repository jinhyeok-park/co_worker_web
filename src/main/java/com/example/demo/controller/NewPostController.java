package com.example.demo.controller;

import com.example.demo.mapper.MemberMapper;
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
    @Autowired
    private MemberMapper memberMapper;
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
                                @RequestParam("axis_y") String axis_y,
                                @RequestParam("apply_limit") long apply_limit)
    {
        double x = !axis_x.isEmpty() ? Double.parseDouble(axis_x) : 0.0;
        double y = !axis_y.isEmpty() ? Double.parseDouble(axis_y) : 0.0;
        String userId = (String)session.getAttribute("user_id");
        postMapper.insertPost(userId, title, content, address, x, y, (int)apply_limit);
        memberMapper.insertMemeber(userId, postMapper.selectProposal_idByTitleUser_id(userId, title));
        ModelAndView mav = new ModelAndView("redirect:/posts_Collection");
        return mav;
    }
}
