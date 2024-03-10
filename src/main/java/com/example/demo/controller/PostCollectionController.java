package com.example.demo.controller;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.mapper.PostMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

import static com.example.demo.controller.MainController.toJson;

@Controller
public class PostCollectionController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private  PostMapper postMapper;

    @Autowired
    private MemberMapper memberMapper;

    @GetMapping("/posts_Collection")
    public ModelAndView showPosts(HttpSession session)
    {
        String userId = (String)session.getAttribute("user_id");
        ArrayList<Post> post    = postMapper.selectAllPost();
        String json             = "";

        json = MainController.toJson(post);
        json = json.replace("\\n", "<br>");
        ModelAndView mav = new ModelAndView("/postsCollection");
        mav.addObject("postdata", post);
        ArrayList<Long> roomIds = memberMapper.selectProposal_idByUser_id(userId);
        mav.addObject("roomIds", roomIds);
        return mav;
    }
}
