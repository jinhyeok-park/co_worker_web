package com.example.demo.controller;


import com.example.demo.mapper.CommentMapper;
import com.example.demo.mapper.PostMapper;
import com.example.demo.model.Comment;
import com.example.demo.model.Post;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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

    @PostMapping("/comment_edit")
    @ResponseBody
    public ResponseEntity<String> editCommentValue(@RequestParam("updateContent") String updateContent,
                                                    @RequestParam("comment_id") long comment_id)
    {
        commentMapper.updateCommentByCommentId(comment_id, updateContent);
        return ResponseEntity.ok("true");
    }

    @DeleteMapping("/post/comment_delete/{comment_id}")
    @ResponseBody
    public ResponseEntity<String> deleteComment(@PathVariable("comment_id") long comment_id)
    {
        commentMapper.deleteCommentByCommentId(comment_id);
        return ResponseEntity.ok("true");
    }
}
