package com.example.demo.model;

import lombok.Data;

@Data
public class chat_room {
    long    room_id;
    long    proposal_id; //equal socket url room_id;
    String  room_title;
    String  master_user_id; // master id;
}
