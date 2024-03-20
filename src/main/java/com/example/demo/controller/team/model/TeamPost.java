package com.example.demo.controller.team.model;

import lombok.Data;

@Data
public class TeamPost {
    long    teamPost_id;
    long    proposal_id;
    String  title;
    String  contents;
}
