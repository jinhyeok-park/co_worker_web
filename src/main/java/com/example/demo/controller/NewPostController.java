package com.example.demo.controller;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.mapper.PostMapper;
import com.example.demo.model.Post;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewPostController {

    @Autowired
    private PostMapper postMapper;
    @Autowired
    private MemberMapper memberMapper;
    @GetMapping("/newpost")
    public ModelAndView showPostForm(@RequestParam(value = "isEditMode", defaultValue = "false") boolean isEditMode,
                                     @RequestParam(value = "proposal_id", defaultValue = "0") long proposal_id) {
        ModelAndView mav = new ModelAndView("/newpost");
        mav.addObject("isEditMode", isEditMode);
        Post post  = postMapper.findPostByProposal_Id(proposal_id);

        long    applyLimit;
        if (post != null)
        {
            mav.addObject("title", post.getTitle());
            mav.addObject("content" ,post.getContent());
            mav.addObject("apply-limit", post.getApply_limit());
            mav.addObject("proposal_id", proposal_id);
        }
        // 추가 로직, 예를 들어, isEditMode가 true일 경우 수정할 게시글의 데이터를 모델에 추가
        return mav;
    }

    @PostMapping("/editpost")
    public ModelAndView editPost(@RequestParam("title") String title,
                                 @RequestParam("content") String content,
                                 @RequestParam("address") String address,
                                 @RequestParam("axis_x") String axis_x,
                                 @RequestParam("axis_y") String axis_y,
                                 @RequestParam("apply_limit") long apply_limit,
                                 @RequestParam("proposal_id") long proposal_id)
    {
        double x = !axis_x.isEmpty() ? Double.parseDouble(axis_x) : 0.0;
        double y = !axis_y.isEmpty() ? Double.parseDouble(axis_y) : 0.0;
        ModelAndView mav = new ModelAndView("redirect:/posts_Collection");
        postMapper.updatePostByProposal_id(title,content,address,x,y,apply_limit, proposal_id);
        return mav;
    }

    @PostMapping("/newpost")
    public ModelAndView posting(HttpSession session,
                                @RequestParam("title") String title,
                                @RequestParam("content") String content,
                                @RequestParam("address") String address,
                                @RequestParam("axis_x") String axis_x,
                                @RequestParam("axis_y") String axis_y,
                                @RequestParam("apply_limit") long apply_limit)
    {
        double x = !axis_x.isEmpty() ? Double.parseDouble(axis_x) : 0.0;
        double y = !axis_y.isEmpty() ? Double.parseDouble(axis_y) : 0.0;
        String userId = (String)session.getAttribute("user_id");
        postMapper.insertPost(userId, title, content, address, x, y, (int)apply_limit);
        memberMapper.insertMemeber(userId, postMapper.selectProposal_idByTitleUser_id(userId, title));
        ModelAndView mav = new ModelAndView("redirect:/posts_Collection");
        return mav;
    }
}
