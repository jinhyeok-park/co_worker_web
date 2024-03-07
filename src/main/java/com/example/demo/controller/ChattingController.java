package com.example.demo.controller;

import com.example.demo.mapper.Chat_msgMapper;
import com.example.demo.mapper.Chat_roomMapper;
import com.example.demo.model.ChatDTO;
import com.example.demo.model.Chat_msg;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ChattingController {

    @Autowired
    private Chat_roomMapper chatRoomMapper;

    @Autowired
    private Chat_msgMapper chatMsgMapper;

    // load all db chatting data ;
    @SendTo("/room/{roomId}")
    @MessageMapping("/{roomId}")
    public ChatDTO chatRoomCreate(@DestinationVariable long roomId,
                                  ChatDTO message)
    {
        chatMsgMapper.insertChatMsg(message.getSender(), roomId, message.getMessage());

        //room exsist?000
        //yes do not make room
        //no make the room

        return message;
    }
}
