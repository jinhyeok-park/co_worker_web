package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TeamPageController {

    @GetMapping("/teampage/{proposal_id}")
    public ModelAndView showTeamPage(@PathVariable("proposal_id") long proposal_id) {
        System.out.println("hit temapage");
        return new ModelAndView("team_page");
    }
}

