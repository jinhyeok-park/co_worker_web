package com.example.demo.controller;

import com.example.demo.mapper.*;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DeleteController {
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private Chat_msgMapper chatMsgMapper;

    @Autowired
    private Chat_roomMapper chatRoomMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private User_applicantsMapper userApplicantsMapper;

    @DeleteMapping("/post/{proposal_id}/delete")
    public ResponseEntity<Boolean> deleteDetailPage(@PathVariable("proposal_id") long proposal_id)
    {
        chatMsgMapper.deleteChat_msgByProposal_id(proposal_id);
        chatRoomMapper.deleteChat_roomByProposal_id(proposal_id);
        commentMapper.deleteCommentByProposal_id(proposal_id);
        userApplicantsMapper.deleteUser_applicantsByProposal_id(proposal_id);
        postMapper.deletePostByProposal_id(proposal_id);
        return (ResponseEntity.ok(true));
    }
}
