package com.example.demo.model;

import lombok.Data;

@Data
public class ChatDTO {

    long    room_id;
    String  sender;
    String  message;
}
