package com.example.demo.controller.user;

import com.example.demo.controller.post.mapper.MemberMapper;
import com.example.demo.controller.post.mapper.PostMapper;
import com.example.demo.controller.post.mapper.UserApplicantsMapper;
import com.example.demo.controller.user.mapper.UserMapper;
import com.example.demo.controller.post.model.Post;
import com.example.demo.controller.user.model.User;
import com.example.demo.controller.post.model.UserApplicants;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/mypage/")
public class MyPageController {

    private final UserMapper userMapper;
    private final PostMapper postMapper;
    private final MemberMapper memberMapper;
    private final UserApplicantsMapper userApplicantsMapper;

    @GetMapping("my_page.html")
    ModelAndView showMyaPage(HttpSession session)
    {
        String userId = (String)session.getAttribute("user_id");
        User user = userMapper.findUserByUsername(userId);
        ArrayList<Post> myPosts = postMapper.findPostsByUserID(userId);
        ArrayList<Long> myApplyProposalId = userApplicantsMapper.selectProposal_idByUserId(userId);
        ArrayList<Post> myApplyPosts = new ArrayList<>();
        ArrayList<UserApplicants> appliers = new ArrayList<>();
        ArrayList<UserApplicants> myApplyStatus = userApplicantsMapper.selectUser_applicantsByUser_id(userId);

        for (Long num : myApplyProposalId)
        {
            myApplyPosts.add(postMapper.findPostByProposal_Id(num));
        }
        for (Post num : myPosts)
        {
            appliers.addAll(userApplicantsMapper.selectUser_applicantsByProposal_id(num.getProposal_id()));
        }
        //chatting room
        ArrayList<Long> roomIds = memberMapper.selectProposal_idByUser_id(userId);
        ModelAndView mav = new ModelAndView("/mypage/my_page");
        mav.addObject("userData", user);
        mav.addObject("mypostdata", myPosts);
        mav.addObject("myapplydata", myApplyPosts);
        mav.addObject("appliers", appliers);
        mav.addObject("myapplystatus", myApplyStatus);
        mav.addObject("roomIds", roomIds);

        return mav;
    }

    @GetMapping("user_edit.html")
    public ModelAndView showSignUpForm(HttpSession session,
                                       @RequestParam(value = "isEditMode", defaultValue = "false") boolean isEditMode) {
        ModelAndView mav = new ModelAndView("/login/sign_up");

        if (isEditMode)
        {
            String userId = (String)session.getAttribute("user_id");
            User user = userMapper.findUserByUsername(userId);
            mav.addObject("isEditMode", isEditMode);
            mav.addObject("user_id", user.getUser_id());
            mav.addObject("email", user.getEmail());
            mav.addObject("nickname", user.getNickname());
            mav.addObject("phonenum", user.getPhone_num());
            mav.addObject("user_name", user.getUser_name());
        }
        return mav;
    }

    @PostMapping("user_edit.do")
    public ModelAndView editUser(HttpSession session,
                                 @RequestParam("username") String username,
                                 @RequestParam("password") String password,
                                 @RequestParam("email") String email,
                                 @RequestParam("nickname") String nickname,
                                 @RequestParam("phoneNum") String phoneNum) {
        String oldUserId = (String)session.getAttribute("user_id");
        session.invalidate();
        userMapper.updateUserById(username, password, nickname, email, phoneNum, 0, oldUserId);
        return new ModelAndView("redirect:/");
    }

    @GetMapping("get_member.do")
    public @ResponseBody ResponseEntity getMembers(@RequestParam("proposal_id") long proposal_id)
    {
        //List<String> ret = memberMapper.select(proposal_id); // 가정: select 메서드가 적절한 로직을 수행한다고 가정
        ArrayList<String> members = memberMapper.selectUser_idByProposal_id(proposal_id);
        return ResponseEntity.ok(members);
    }

    @PostMapping("userkick.do")
    public @ResponseBody ResponseEntity userKick(@RequestParam("user_id") String user_id,
                                                 @RequestParam("proposal_id") long proposal_id)
    {
        //mapper 제작 해야함
        memberMapper.deleteMemberByProposal_idUser_id(user_id, proposal_id);
        return ResponseEntity.ok("true");
    }
}
