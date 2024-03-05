package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface Chat_roomMapper {

    @Insert("INSERT INTO chat_room(room_name)" + "VALUES(#{room_name})")
    void InsertChat_room(@Param("room_name") String room_name);


}
