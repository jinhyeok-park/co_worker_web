package com.example.demo.model;

import lombok.Data;

@Data
public class Chat_msg {

    String  user_id;
    long    room_id;
    String  message;
}
