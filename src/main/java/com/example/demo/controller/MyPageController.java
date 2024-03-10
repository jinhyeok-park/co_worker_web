package com.example.demo.controller;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.mapper.PostMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.mapper.User_applicantsMapper;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.model.User_applicants;
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
    private MemberMapper memberMapper;
    @Autowired
    private User_applicantsMapper  userApplicantsMapper;
    @GetMapping("/mypage")
    ModelAndView showMyaPage(HttpSession session)
    {
        String userId = (String)session.getAttribute("user_id");
        User user = userMapper.findUserByUsername(userId);
        ArrayList<Post> myPosts = postMapper.findPostsByUserID(userId);
        ArrayList<Long> myApplyProposalId = userApplicantsMapper.selectProposal_idByUserId(userId);
        ArrayList<Post> myApplyPosts = new ArrayList<Post>();
        ArrayList<User_applicants> appliers = new ArrayList<User_applicants>();
        ArrayList<User_applicants> myApplyStatus;
        myApplyStatus = userApplicantsMapper.selectUser_applicantsByUser_id(userId);
        for (Long num : myApplyProposalId)
        {
            myApplyPosts.add(postMapper.findPostByProposal_Id(num));
        }
        for (Post num : myPosts)
        {
            appliers.addAll(userApplicantsMapper.selectUser_applicantsByProposal_id(num.getProposal_id()));
        }
        ArrayList<Long> roomIds = memberMapper.selectProposal_idByUser_id(userId);
        ModelAndView mav = new ModelAndView("mypage");
        mav.addObject("userData", user);
        mav.addObject("mypostdata", myPosts);
        mav.addObject("myapplydata", myApplyPosts);
        mav.addObject("appliers", appliers);
        mav.addObject("myapplystatus", myApplyStatus);
        mav.addObject("roomIds", roomIds);
        return mav;
    }
}
