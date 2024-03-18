package com.example.demo.controller.team;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/teampage/")
public class TeamPageController {

    @GetMapping("{proposal_id}/teampage.html")
    public ModelAndView showTeamPage(@PathVariable("proposal_id") long proposal_id) {
        System.out.println("hit temapage");
        return new ModelAndView("/team/team_page");
    }
}

