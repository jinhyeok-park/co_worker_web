package com.example.demo.controller.chat;

import com.example.demo.controller.alarm.mapper.AlarmMapper;
import com.example.demo.controller.chat.mapper.ChatMsgMapper;
import com.example.demo.controller.chat.mapper.ChatRoomMapper;
import com.example.demo.controller.post.mapper.MemberMapper;
import com.example.demo.controller.post.mapper.PostMapper;
import com.example.demo.controller.chat.model.ChatDTO;
import com.example.demo.controller.chat.model.ChatMsg;
import com.example.demo.controller.post.mapper.UserApplicantsMapper;
import com.example.demo.controller.post.model.Post;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@RestController
@RequiredArgsConstructor
public class ChattingController {

    private final ChatMsgMapper chatMsgMapper;
    private final PostMapper postMapper;
    private final MemberMapper membermapper;
    private final AlarmMapper alarmMapper;
    private final UserApplicantsMapper userApplicantsMapper;
    private final MemberMapper memberMapper;

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

    @GetMapping("/chatstart/{proposal_id}")
    public ModelAndView showchat(@PathVariable("proposal_id") long proposal_id)
    {
        ArrayList<ChatMsg> msgs = chatMsgMapper.selectAllByRoomId(proposal_id);
        ModelAndView mav = new ModelAndView("/chat/chat_room");
        mav.addObject("proposal_id", proposal_id);
        mav.addObject("msgs", msgs);

        return mav;
    }

    @MessageMapping("/common")
    @SendTo("/room/common")
    public ChatDTO CommonMessageSend(ChatDTO message)
    {
        return message;
    }

    // 채팅방 나가기
    @DeleteMapping("chat_exit.do")
    public @ResponseBody
    ResponseEntity exitButton(@RequestParam("user_id") String user_id,
                              @RequestParam("proposal_id") long proposal_id)
    {
        ResponseEntity<Boolean> ret;

        try {
            userApplicantsMapper.deleteUser_applicantsByUserIdProposalId(user_id, proposal_id);
            memberMapper.deleteMemberByUser_id(user_id);
            ret = new ResponseEntity<>(true, HttpStatus.OK);
        } catch (Exception e) {
            ret = new ResponseEntity<>(false, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return ret;
    }
}
