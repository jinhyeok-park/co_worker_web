package com.example.demo.controller;


import com.example.demo.mapper.CommentMapper;
import com.example.demo.mapper.PostMapper;
import com.example.demo.model.Comment;
import com.example.demo.model.Post;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigInteger;
import java.util.ArrayList;

import static com.example.demo.controller.MainController.toJson;

@Controller
public class PostDetailController {

    @Autowired
    PostMapper postMapper;

    @Autowired
    CommentMapper commentMapper;

    @GetMapping("/post/{postid}")
    public ModelAndView showPostDetail(@PathVariable("postid") long postId)
    {
        Post detailPost = postMapper.findPostByProposal_Id(postId);
        ArrayList<Comment> comments = commentMapper.selectCommentByProposal_id(postId);
        ModelAndView mav = new ModelAndView("postDetailPage");
        mav.addObject("detailPost", detailPost);
        mav.addObject("comments", comments);
        return mav;
    }

}
