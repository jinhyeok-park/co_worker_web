package com.example.demo.controller.chat.model;

import lombok.Data;

@Data
public class ChatDTO {

    long    room_id;
    String  sender;
    String  message;
    String  room_title;
}
