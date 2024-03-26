package com.example.demo.controller.post.model;

import lombok.Data;

import java.math.BigInteger;
import java.sql.Timestamp;

@Data
public class Comment {
    BigInteger comment_id;
    String user_id;
    BigInteger proposal_id;
    String content;
    Timestamp reg_time;
}
