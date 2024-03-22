package com.example.demo.controller.post.mapper;

import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface MemberMapper {

    @Insert("INSERT INTO member(user_id, proposal_id)" + "VALUES(#{user_id} ,#{proposal_id})")
    void insertMemeber(@Param("user_id") String user_id,
                       @Param("proposal_id") long proposal_id);

    @Select("SELECT proposal_id FROM member WHERE user_id = #{user_id}")
    ArrayList<Long> selectProposal_idByUser_id(@Param("user_id") String user_id);

    @Delete("DELETE FROM member WHERE proposal_id = #{proposal_id}")
    void    deleteMemberByProposal_id(@Param("proposal_id") long proposal_id);

    @Select("SELECT user_id FROM member WHERE proposal_id = #{proposal_id}")
    ArrayList<String>   selectUser_idByProposal_id(@Param("proposal_id") long proposal_id);

    @Delete("DELETE FROM member WHERE user_id = #{user_id}")
    void deleteMemberByUser_id(@Param("user_id") String user_id);

    @Delete("DELETE FROM member WHERE user_id = #{user_id} AND proposal_id = #{proposal_id}")
    void    deleteMemberByProposal_idUser_id(@Param("user_id") String user_id,
                                             @Param("proposal_id") long proposal_id);
}
