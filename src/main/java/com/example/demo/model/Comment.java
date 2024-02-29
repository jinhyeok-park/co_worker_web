package com.example.demo.model;

import lombok.Data;

import java.math.BigInteger;

@Data
public class Comment {
    BigInteger comment_id;
    String user_id;
    BigInteger proposal_id;
    String content;
}
