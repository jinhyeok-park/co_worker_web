package com.example.demo.controller.post;

import com.example.demo.controller.alarm.mapper.AlarmMapper;
import com.example.demo.controller.post.mapper.CommentMapper;
import com.example.demo.controller.post.mapper.PostMapper;
import com.example.demo.controller.post.model.Post;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/comment/")
public class CommentController {

    private final PostMapper postMapper;
    private final CommentMapper commentMapper;
    private final AlarmMapper alarmMapper;

    @PostMapping("{proposal_id}/set_comment.do")
    public ModelAndView setComment(HttpSession session,
                                   @PathVariable("proposal_id") long proposal_id,
                                   @RequestParam("content") String content)
    {
        String userId = (String)session.getAttribute("user_id");
        commentMapper.insertComment(userId, proposal_id, content);
        Post post = postMapper.findPostByProposal_Id(proposal_id);
        String message = "{"+userId+"}" + " 님이 "+ "{" +post.getTitle()+"}" + "에 댓글을 작성했습니다.";
        alarmMapper.insertAlarm(post.getUser_id(), "2", message);

        return new ModelAndView("redirect:/post/" + proposal_id + "/post_detail_form.html");
    }

    @PostMapping("edit_comment.do")
    public @ResponseBody
    ResponseEntity<String> editCommentValue(@RequestParam("updateContent") String updateContent,
                                            @RequestParam("comment_id") long comment_id)
    {
        commentMapper.updateCommentByCommentId(comment_id, updateContent);
        return ResponseEntity.ok("true");
    }

    @DeleteMapping("delete_comment.do/{comment_id}")
    public @ResponseBody ResponseEntity<String> deleteComment(@PathVariable("comment_id") long comment_id)
    {
        commentMapper.deleteCommentByCommentId(comment_id);
        return ResponseEntity.ok("true");
    }
}
