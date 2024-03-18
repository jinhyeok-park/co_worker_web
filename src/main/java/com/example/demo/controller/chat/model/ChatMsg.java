package com.example.demo.controller.chat.model;

import lombok.Data;

@Data
public class ChatMsg {

    String  user_id;
    long    room_id;
    String  message;
}
