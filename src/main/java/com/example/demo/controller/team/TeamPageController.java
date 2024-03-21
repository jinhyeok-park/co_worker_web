package com.example.demo.controller.team;

import com.example.demo.controller.chat.model.ChatDTO;
import com.example.demo.controller.post.mapper.PostMapper;
import com.example.demo.controller.post.model.Post;
import com.example.demo.controller.team.mapper.TeamPostMapper;
import com.example.demo.controller.team.model.TeamPost;
import com.example.demo.controller.team.model.TeamPostDTO;
import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.databind.ObjectMapper;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping(value = "/teampage/")
@RequiredArgsConstructor
public class TeamPageController {

    private final PostMapper postMapper;
    private final TeamPostMapper teamPostMapper;

    @PostMapping("saveTeamPost.do")
    public @ResponseBody ResponseEntity saveTeamPost(@RequestParam("title") String title,
                                                     @RequestParam("contents") String contents,
                                                     @RequestParam("proposal_id") long proposal_id,
                                                     @RequestParam("teamPost_id") long teamPost_id)
    {
        teamPostMapper.updateTeamPost(title,contents,proposal_id,teamPost_id);
        return ResponseEntity.ok("true");
    }
    @GetMapping("{proposal_id}/{teampost_id}/getPageContents.do")
    public @ResponseBody ResponseEntity showTitleContents(@PathVariable("proposal_id") long proposal_id,
                                                          @PathVariable("teampost_id") long teampost_id)
    {
        TeamPost teamPost = teamPostMapper.selectTeamPost(proposal_id, teampost_id);
        Map<String, String> responseData = new HashMap<>();
        responseData.put("title", teamPost.getTitle());
        responseData.put("contents", teamPost.getContents());
        responseData.put("teampost_id", Long.toString(teamPost.getTeamPost_id()));

        return ResponseEntity.ok(responseData);
    }

    @GetMapping("{proposal_id}/teampage.html")
    public ModelAndView showTeamPage(@PathVariable("proposal_id") long proposal_id) {

        ModelAndView        mav;
        Post                post;
        ArrayList<TeamPost> teamPostArray;

        mav = new ModelAndView("/team/team_page");
        post = postMapper.findPostByProposal_Id(proposal_id);
        teamPostArray = teamPostMapper.selectByProposal_id(proposal_id);
        if (teamPostArray.isEmpty())
        {
            TeamPost default_page;

            default_page = new TeamPost();
            default_page.setContents("# 웹사이트 제목\n" +
                    "\n" +
                    "## 소개\n" +
                    "\n" +
                    "안녕하세요! 여기는 나의 웹사이트입니다.\n" +
                    "\n" +
                    "이 웹사이트에서는 다양한 프로젝트와 취미에 대해 이야기하고자 합니다.\n" +
                    "\n" +
                    "### 내 프로젝트\n" +
                    "\n" +
                    "- **프로젝트 1**: 프로젝트에 대한 간략한 설명\n" +
                    "- **프로젝트 2**: 또 다른 프로젝트에 대한 간략한 설명\n" +
                    "\n" +
                    "### 취미\n" +
                    "\n" +
                    "저는 여러 가지 취미를 가지고 있습니다:\n" +
                    "\n" +
                    "1. 취미 1에 대한 설명\n" +
                    "2. 취미 2에 대한 설명\n" +
                    "\n" +
                    "## 연락하기\n" +
                    "\n" +
                    "질문이나 더 알고 싶은 내용이 있다면 [이메일 주소](mailto:your.email@example.com)로 연락주세요.\n" +
                    "\n" +
                    "---\n" +
                    "\n" +
                    "© 2024 웹사이트 제작자. 모든 권리 보유.\n");
            default_page.setProposal_id(proposal_id);
            default_page.setTitle("기본페이지");
            teamPostMapper.insertTeamPost(default_page);
            teamPostArray.add(default_page);
        }

        mav.addObject("post", post);
        mav.addObject("teamPostArray", teamPostArray);

        return mav;
    }

    @PostMapping("{proposal_id}/teampage_insert.do")
    @ResponseBody
    public ResponseEntity newTeamPost(@PathVariable("proposal_id") long proposal_id)
    {
        TeamPost teamPost;

        teamPost = new TeamPost();
        teamPost.setProposal_id(proposal_id);
        teamPost.setTitle("제목을 지정해 주세요");
        teamPost.setContents("");
        teamPostMapper.insertTeamPost(teamPost);
        return ResponseEntity.ok(teamPost);
    }

    @DeleteMapping("delete_teampage.do")
    public @ResponseBody ResponseEntity deleteTeamPost(@RequestParam("proposal_id") long proposal_id,
                                                       @RequestParam("teampost_id") long teampost_id)
    {
        teamPostMapper.deleteTeamPost(proposal_id,teampost_id);
        return ResponseEntity.ok(true);
    }
    //해당 컨트롤러를 통해서 실시간을 편집되는 내용이 전송되어진다.
    //js 페이지를 보자 ,
    @SendTo("/room/team/{proposal_id}/{memberPost_id}")
    @MessageMapping("/team/{proposal_id}/{memberPost_id}")
    public TeamPostDTO chatRoomCreate(@DestinationVariable("proposal_id") long proposalId,
                                      @DestinationVariable("memberPost_id") long memberPostId,
                                      TeamPostDTO message) {
        // 여기에서 message 처리
        return message;
    }

    @SendTo("/room/teamnavi/{proposal_id}/{memberPost_id}")
    @MessageMapping("/teamnavi/{proposal_id}/{memberPost_id}")
    public TeamPostDTO teamNaviCreate(@DestinationVariable("proposal_id") long proposalId,
                                      @DestinationVariable("memberPost_id") long memberPostId,
                                      TeamPostDTO message) {
        // 여기에서 message 처리
        return message;
    }
}

