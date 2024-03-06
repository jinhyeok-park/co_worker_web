package com.example.demo.model;

import lombok.Data;

@Data
public class chat_room {
    long room_id;
    String user_id; // master id;
    String room_name;
}
