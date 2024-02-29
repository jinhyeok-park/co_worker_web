package com.example.demo.mapper;

import com.example.demo.model.Comment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.math.BigInteger;
import java.util.ArrayList;

@Mapper
public interface CommentMapper {

    @Insert("INSERT INTO comment(user_id, proposal_id, content)" +
    "VALUES(#{user_id}, #{proposal_id}, #{content})")
    void insertComment(@Param("user_id") String user_id,
                       @Param("proposal_id")BigInteger proposal_id,
                       @Param("content") String content );

    @Select("SELECT * FROM comment WHERE proposal_id = #{proposal_id}")
    ArrayList<Comment> selectCommentByProposal_id(@Param("proposal_id") BigInteger probosal_id);
}
