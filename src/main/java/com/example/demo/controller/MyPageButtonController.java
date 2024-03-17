package com.example.demo.controller;

import com.example.demo.mapper.AlarmMapper;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.mapper.PostMapper;
import com.example.demo.mapper.User_applicantsMapper;
import com.example.demo.model.Post;
import org.apache.ibatis.annotations.Delete;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MyPageButtonController {

    @Autowired
    private PostMapper postMapper;

    @Autowired
    private User_applicantsMapper userApplicantsMapper;

    @Autowired
    private AlarmMapper alarmMapper;

    @Autowired
    private MemberMapper memberMapper;

    @PostMapping("/MyPageButtonController")
    public ModelAndView ButtonAction(@RequestParam("action") String action,
                                     @RequestParam("proposal_id") long proposal_id,
                                     @RequestParam("user_id") String user_id)
    {
        Post post = postMapper.findPostByProposal_Id(proposal_id);
        String title = post.getTitle();
        String message;
        if (action.equals("accept"))
        {
            postMapper.applyAcceptCountPlus(proposal_id);
            userApplicantsMapper.acceptApplier(proposal_id, user_id);
            memberMapper.insertMemeber(user_id, proposal_id);
            message =  title + " 제안에 수락 되셨습니다.";
            alarmMapper.insertAlarm(user_id, "3", message);
        }
        else if (action.equals("reject"))
        {
            message = title + "제안에 거절 되셨습니다.";
            userApplicantsMapper.rejectApplier(proposal_id, user_id);
            alarmMapper.insertAlarm(user_id, "3", message);
        }
        ModelAndView mav = new ModelAndView("redirect:/mypage");
        return mav;

        /// Post aaply_accept ++ ;
        // user_applicants status chagne 1 or 2;
        // chat room created.. or  to be member of the proposal_id chattingroom
    }
    @DeleteMapping("/exitButton")
    @ResponseBody
    public ResponseEntity exitButton(@RequestParam("user_id") String user_id,
                                     @RequestParam("proposal_id") long proposal_id)
    {
        ResponseEntity<Boolean> ret;
        try {
            userApplicantsMapper.deleteUser_applicantsByUserIdProposalId(user_id, proposal_id);
            memberMapper.deleteMemberByUser_id(user_id);
            ret = new ResponseEntity<Boolean>(true, HttpStatus.OK);
        } catch (Exception e) {
            // 예외 처리 로직을 작성합니다.
            ret = new ResponseEntity<Boolean>(false, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return ret;
    }
}
