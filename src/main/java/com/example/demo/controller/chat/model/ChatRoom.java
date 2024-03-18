package com.example.demo.controller.chat.model;

import lombok.Data;

@Data
public class ChatRoom {
    long    room_id;
    long    proposal_id; //equal socket url room_id;
    String  room_title;
    String  master_user_id; // master id;
}
