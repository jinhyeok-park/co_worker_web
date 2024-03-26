package com.example.demo.controller.post.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Post {
    public long proposal_id;
    public String user_id;
    public String title;
    public String content;
    public String address;
    public double axis_x;
    public double axis_y;
    public long apply_limit;
    public long apply_count;
    public String chatroom_status;
    public String teampage_status;
    public long apply_accept_count;
    public Timestamp reg_time;
}
