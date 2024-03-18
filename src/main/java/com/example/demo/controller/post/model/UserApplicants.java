package com.example.demo.controller.post.model;

import lombok.Data;

@Data
public class UserApplicants {

    long    userApplicants_id;
    String  user_id;
    long    proposal_id;
    String  status;
}
