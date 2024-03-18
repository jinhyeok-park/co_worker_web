package com.example.demo.controller.chat.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ChatRoomMapper {

    @Insert("INSERT INTO chat_room(room_name, user_id)" + " VALUES( #{room_name}, #{user_id})")
    void insertChat_room(@Param("room_name") String room_name,
                         @Param("user_id") String user_id);

    @Delete("DELETE FROM chat_room WHERE proposal_id = #{proposal_id}")
    void    deleteChat_roomByProposal_id(@Param("proposal_id") long proposal_id);
}
