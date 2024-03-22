package com.example.demo.controller.team.mapper;

import com.example.demo.controller.team.model.TeamPost;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface TeamPostMapper {
    @Insert("INSERT INTO team_post(proposal_id, title, contents)" + "VALUES(#{proposal_id}, #{title}, #{contents})")
    @Options(useGeneratedKeys = true, keyProperty = "teamPost_id")
    void    insertTeamPost(TeamPost teamPost);

    @Select("SELECT * FROM team_post WHERE proposal_id = #{proposal_id}")
    ArrayList<TeamPost> selectByProposal_id(@Param("proposal_id") long proposal_id);

    @Update("UPDATE team_post SET title = #{title}, contents = #{contents} WHERE proposal_id = #{proposal_id} AND teampost_id = #{teamPost_id}")
    void updateTeamPost(
            @Param("title") String title,
            @Param("contents") String contents,
            @Param("proposal_id") long proposal_id,
            @Param("teamPost_id") long teamPost_id);

    @Select("SELECT * FROM team_post WHERE proposal_id = #{proposal_id} AND teampost_id = #{teampost_id}")
    TeamPost selectTeamPost(@Param("proposal_id") long proposal_id,
                                 @Param("teampost_id") long teamPost_id);

    @Delete("DELETE FROM team_post WHERE proposal_id = #{proposal_id} AND teampost_id = #{teampost_id}")
    void    deleteTeamPost(@Param("proposal_id") long proposal_id,
                           @Param("teampost_id") long teamPost_id);

    @Delete("DELETE FROM team_post WHERE proposal_id = #{proposal_id}")
    void    deleteAllTeamPostByProposal_id(@Param("proposal_id") long proposal_id);

}
