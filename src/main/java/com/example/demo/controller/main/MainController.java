package com.example.demo.controller.main;

import com.example.demo.controller.post.mapper.MemberMapper;
import com.example.demo.controller.post.mapper.PostMapper;
import com.example.demo.controller.post.model.Post;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final PostMapper postMapper;
    private final MemberMapper memberMapper;

    @GetMapping("/")
    public ModelAndView mainp(HttpSession session)
    {

        ArrayList<Post> post    = postMapper.selectAllPostsExceptZeroLocations();
        ModelAndView mav        = new ModelAndView("index");
        String json             = "";

        json = toJson(post);
        json = json.replace("\\n", "<br>");
        mav.addObject("postdata", json);
        String userId = (String)session.getAttribute("user_id");
        if (userId != null)
        {
            ArrayList<Long> roomIds = memberMapper.selectProposal_idByUser_id(userId);
            mav.addObject("roomIds", roomIds);
            for (int i = 0 ; i < roomIds.size() ; i++)
            {
                System.out.println(roomIds.get(i));
            }
        }
        return mav;
    }
    public static String toJson(ArrayList<Post> post)
    {
        String json                 = "";
        ObjectMapper objectMapper   = new ObjectMapper();

        try
        {
            json = objectMapper.writeValueAsString(post);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return json;
    }
}
