package com.example.demo.controller;

import com.example.demo.mapper.*;
import com.example.demo.model.ChatDTO;
import com.example.demo.model.Chat_msg;
import com.example.demo.model.Post;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class ChattingController {

    @Autowired
    private Chat_roomMapper chatRoomMapper;

    @Autowired
    private Chat_msgMapper chatMsgMapper;

    @Autowired
    private PostMapper  postMapper;
    @Autowired
    private MemberMapper membermapper;

    @Autowired
    private AlarmMapper alarmMapper;

    // load all db chatting data ;
    @SendTo("/room/{roomId}")
    @MessageMapping("/{roomId}")
    public ChatDTO chatRoomCreate(@DestinationVariable long roomId,
                                  ChatDTO message)
    {
        chatMsgMapper.insertChatMsg(message.getSender(), roomId, message.getMessage());
        ArrayList<String> ids = membermapper.selectUser_idByProposal_id(roomId);
        Post post = postMapper.findPostByProposal_Id(roomId);
        String message1 = post.getTitle() + "에 메시지 도착";
        for (int i = 0 ; i < ids.size() ; i++)
        {
            alarmMapper.insertAlarm(ids.get(i), "1", message1 );
        }
        //room exsist?000
        //yes do not make room
        //no make the room

        return message;
    }
}
