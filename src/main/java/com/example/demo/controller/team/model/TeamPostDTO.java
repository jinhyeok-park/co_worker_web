package com.example.demo.controller.team.model;

import lombok.Data;

@Data
public class TeamPostDTO {
    String  user_id;
    String  contents;
    String  title;
    long    proposal_id;
    long    teamPost_id;
}
