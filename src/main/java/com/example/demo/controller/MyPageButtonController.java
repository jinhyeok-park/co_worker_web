package com.example.demo.controller;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.mapper.PostMapper;
import com.example.demo.mapper.User_applicantsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MyPageButtonController {

    @Autowired
    private PostMapper postMapper;

    @Autowired
    private User_applicantsMapper userApplicantsMapper;

    @Autowired
    private MemberMapper memberMapper;

    @PostMapping("/MyPageButtonController")
    public ModelAndView ButtonAction(@RequestParam("action") String action,
                                     @RequestParam("proposal_id") long proposal_id,
                                     @RequestParam("user_id") String user_id)
    {
        if (action.equals("accept"))
        {
            System.out.println("hit accppt");
            postMapper.applyAcceptCountPlus(proposal_id);
            userApplicantsMapper.acceptApplier(proposal_id, user_id);
            memberMapper.insertMemeber(user_id, proposal_id);
        }
        else if (action.equals("reject"))
        {
            userApplicantsMapper.rejectApplier(proposal_id, user_id);
        }
        ModelAndView mav = new ModelAndView("redirect:/mypage");
        return mav;

        /// Post aaply_accept ++ ;
        // user_applicants status chagne 1 or 2;
        // chat room created.. or  to be member of the proposal_id chattingroom

    }
}
