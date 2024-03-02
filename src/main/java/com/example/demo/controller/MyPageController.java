package com.example.demo.controller;

import com.example.demo.mapper.PostMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.mapper.User_applicantsMapper;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class MyPageController {


    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PostMapper postMapper;
    @Autowired
    private User_applicantsMapper  userApplicantsMapper;
    @GetMapping("/mypage")
    ModelAndView showMyaPage(HttpSession session)
    {
        String userId = (String)session.getAttribute("user_id");
        User user = userMapper.findUserByUsername(userId);
        ArrayList<Post> myPosts = postMapper.findPostsByUserID(userId);
        ArrayList<Long> myApplyProposalId = userApplicantsMapper.selectPostsByUserId(userId);
        ArrayList<Post> myApplyPosts = new ArrayList<Post>();
        for (Long num : myApplyProposalId)
        {
            myApplyPosts.add(postMapper.findPostByProposal_Id(num));
        }
        ModelAndView mav = new ModelAndView("mypage");
        mav.addObject("userData", user);
        mav.addObject("mypostdata", myPosts);
        mav.addObject("myapplydata", myApplyPosts);
        return mav;
    }
}
