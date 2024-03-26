package com.example.demo.controller.alarm.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Alarm {
    String check_satus;
    String activity;
    String  message;
    String  user_id;
    Timestamp reg_time;
}
