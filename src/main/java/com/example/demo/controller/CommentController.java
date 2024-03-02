package com.example.demo.controller;

import com.example.demo.mapper.CommentMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigInteger;

@RestController
public class CommentController {
    @Autowired
    CommentMapper commentMapper;

    @PostMapping("/post/{proposal_id}/setComment")
    public ModelAndView setComment(HttpSession session,
                                   @PathVariable("proposal_id") BigInteger proposal_id,
                                   @RequestParam("content") String content) {
        commentMapper.insertComment((String)session.getAttribute("user_id"), proposal_id, content);
        System.out.println("hit set comment controoller");
        // 리다이렉트 경로를 동적으로 생성
        ModelAndView mav = new ModelAndView("redirect:/post/" + proposal_id);
        return mav;
    }
}
