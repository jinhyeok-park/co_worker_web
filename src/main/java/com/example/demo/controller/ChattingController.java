package com.example.demo.controller;

import com.example.demo.mapper.Chat_roomMapper;
import com.example.demo.model.ChatDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class ChattingController {

    @Autowired
    private Chat_roomMapper chatRoomMapper;

    @SendTo("/room/{roomId}")
    @MessageMapping("/{roomId}")
    public ChatDTO chatRoomCreate(@DestinationVariable long roomId, ChatDTO message)
    {
        //room exsist?
        //yes do not make room
        //no make the room
        System.out.println(message.getMessage());
        return message;
    }
}
