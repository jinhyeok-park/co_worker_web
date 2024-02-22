package com.example.demo.model;

import lombok.Data;

import java.math.BigInteger;

@Data
public class Post {
    public BigInteger proposal_id;
    public String user_id;
    public String title;
    public String content;
    public String address;
    public double axis_x;
    public double axis_y;
}
