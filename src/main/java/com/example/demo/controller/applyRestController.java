package com.example.demo.controller;

import com.example.demo.mapper.PostMapper;
import com.example.demo.mapper.User_applicantsMapper;
import com.example.demo.model.Post;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class applyRestController {

    @Autowired
    private PostMapper postMapper;

    @Autowired
    private User_applicantsMapper userApplicantsMapper;

    @PostMapping("/applyRestController")
    String applyId(HttpSession session,
                   @RequestParam("proposal_id") String proposal_id)
    {
        System.out.println("hit apply controller");
        long pro_id;

        pro_id = Long.parseLong(proposal_id);
        Post post = postMapper.findPostByProposal_Id(pro_id);
        String user_id;

        user_id = (String)session.getAttribute("user_id");
        if (user_id == null)
        {
            return ("fail");
        }
        else if (post.getApply_count() >= post.getApply_limit())
        {
            return ("limit_over");
        }
        else if(isApplicantsExists(pro_id, user_id))
        {
            return("already applied");
        }
        userApplicantsMapper.insertUser_applicants(user_id, pro_id);
        postMapper.applyCountPlus(pro_id);
        return ("true");
    }

    //Post apply_count ++;
    //user_application insert

    public boolean isApplicantsExists(long proposalId, String userId) {
        long count = userApplicantsMapper.countApplicants(proposalId, userId);
        return count > 0;
    }


}
