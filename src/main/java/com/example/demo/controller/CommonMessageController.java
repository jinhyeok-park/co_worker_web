package com.example.demo.controller;

import com.example.demo.model.ChatDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommonMessageController {


    @MessageMapping("/common")
    @SendTo("/room/common")
    public ChatDTO CommonMessageSend(ChatDTO message)
    {
        return message;
    }
}
