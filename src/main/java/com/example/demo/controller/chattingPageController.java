package com.example.demo.controller;

import com.example.demo.mapper.Chat_msgMapper;
import com.example.demo.model.Chat_msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.SpringProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class chattingPageController {


    @Autowired
    private Chat_msgMapper chatMsgMapper;

    @GetMapping("/chatstart/{proposal_id}")
    public ModelAndView showchat(@PathVariable("proposal_id") long proposal_id)
    {
        ArrayList<Chat_msg> msgs = chatMsgMapper.selectAllByRoomId(proposal_id);
        ModelAndView mav = new ModelAndView("chatroom");
        mav.addObject("proposal_id", proposal_id);
        mav.addObject("msgs", msgs);

        return mav;
    }
}
