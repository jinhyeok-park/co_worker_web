package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface MemberMapper {

    @Insert("INSERT INTO member(user_id, proposal_id)" + "VALUES(#{user_id} ,#{proposal_id})")
    void insertMemeber(@Param("user_id") String user_id,
                       @Param("proposal_id") long proposal_id);

    @Select("SELECT proposal_id FROM member WHERE user_id = #{user_id}")
    ArrayList<Long> selectProposal_idByUser_id(@Param("user_id") String user_id);
}
