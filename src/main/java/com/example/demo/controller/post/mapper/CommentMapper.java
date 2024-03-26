package com.example.demo.controller.post.mapper;

import com.example.demo.controller.post.model.Comment;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface CommentMapper {

    @Insert("INSERT INTO comment(user_id, proposal_id, content, reg_time)" +
    "VALUES(#{user_id}, #{proposal_id}, #{content}, DATE_FORMAT(NOW(),'%Y%m%d%H%i%S'))")
    void insertComment(@Param("user_id") String user_id,
                       @Param("proposal_id")long proposal_id,
                       @Param("content") String content );

    @Select("SELECT * FROM comment WHERE proposal_id = #{proposal_id}")
    ArrayList<Comment> selectCommentByProposal_id(@Param("proposal_id") long probosal_id);

    @Delete("DELETE FROM comment WHERE proposal_id = #{proposal_id}")
    void    deleteCommentByProposal_id(@Param("proposal_id") long proposal_id);

    @Update("UPDATE comment SET content = #{content}, reg_time = DATE_FORMAT(NOW(),'%Y%m%d%H%i%S') WHERE comment_id = #{comment_id}")
    void    updateCommentByCommentId(@Param("comment_id") long comment_id,
                                     @Param("content") String content);

    @Delete("DELETE FROM comment WHERE comment_id = #{comment_id}")
    void    deleteCommentByCommentId(@Param("comment_id") long comment_id);
}
