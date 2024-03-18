package com.example.demo.controller.chat.mapper;

import com.example.demo.controller.chat.model.ChatMsg;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface ChatMsgMapper {

    @Insert("INSERT INTO chat_msg(user_id, room_id, message)" + "VALUES(#{user_id}, #{room_id}, #{message})")
    void insertChatMsg(@Param("user_id") String user_id,
                       @Param("room_id") long room_id,
                       @Param("message") String message);

    @Select("SELECT * FROM chat_msg WHERE room_id = #{room_id}")
    ArrayList<ChatMsg> selectAllByRoomId(@Param("room_id") long room_id);

    @Delete("DELETE FROM chat_msg WHERE room_id = #{proposal_id}")
    void    deleteChat_msgByProposal_id(@Param("proposal_id") long proposal_id);
}
