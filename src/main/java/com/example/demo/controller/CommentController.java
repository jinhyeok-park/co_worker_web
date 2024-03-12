package com.example.demo.controller;

import com.example.demo.mapper.AlarmMapper;
import com.example.demo.mapper.CommentMapper;
import com.example.demo.mapper.PostMapper;
import com.example.demo.model.Post;
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

    @Autowired
    PostMapper postMapping;

    @Autowired
    AlarmMapper alarmMapper;

    @PostMapping("/post/{proposal_id}/setComment")
    public ModelAndView setComment(HttpSession session,
                                   @PathVariable("proposal_id") long proposal_id,
                                   @RequestParam("content") String content)
    {
        String userId = (String)session.getAttribute("user_id");
        commentMapper.insertComment(userId, proposal_id, content);
        Post post = postMapping.findPostByProposal_Id(proposal_id);
        String message = "{"+userId+"}" + " 님이 "+ "{" +post.getTitle()+"}" + "에 뎃글을 남기셨습니다.";
        alarmMapper.insertAlarm(post.getUser_id(), "2", message);
        // 리다이렉트 경로를 동적으로 생성
        ModelAndView mav = new ModelAndView("redirect:/post/" + proposal_id);
        return mav;
    }
}
