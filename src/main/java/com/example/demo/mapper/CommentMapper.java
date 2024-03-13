package com.example.demo.mapper;

import com.example.demo.model.Comment;
import org.apache.ibatis.annotations.*;

import java.math.BigInteger;
import java.util.ArrayList;

@Mapper
public interface CommentMapper {

    @Insert("INSERT INTO comment(user_id, proposal_id, content)" +
    "VALUES(#{user_id}, #{proposal_id}, #{content})")
    void insertComment(@Param("user_id") String user_id,
                       @Param("proposal_id")long proposal_id,
                       @Param("content") String content );

    @Select("SELECT * FROM comment WHERE proposal_id = #{proposal_id}")
    ArrayList<Comment> selectCommentByProposal_id(@Param("proposal_id") long probosal_id);

    @Delete("DELETE FROM comment WHERE proposal_id = #{proposal_id}")
    void    deleteCommentByProposal_id(@Param("proposal_id") long proposal_id);

    @Update("UPDATE comment SET content = #{content} WHERE comment_id = #{comment_id}")
    void    updateCommentByCommentId(@Param("comment_id") long comment_id,
                                     @Param("content") String content);
}
