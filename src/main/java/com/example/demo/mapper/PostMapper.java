package com.example.demo.mapper;

import com.example.demo.model.Post;
import org.apache.ibatis.annotations.*;

import java.math.BigInteger;
import java.util.ArrayList;

@Mapper
public interface PostMapper {
    @Insert("INSERT INTO post(user_id, title, content, address,axis_x, axis_y, apply_limit)" +
            "VALUES(#{user_id}, #{title}, #{content},#{address}, #{axis_x}, #{axis_y}, #{apply_limit})")
    void    insertPost(@Param("user_id") String user_id,
                       @Param("title") String title,
                       @Param("content") String content,
                       @Param("address") String address,
                       @Param("axis_x") double axis_x,
                       @Param("axis_y") double axis_y,
                       @Param("apply_limit") long apply_limit);

    @Update("UPDATE post SET apply_count = apply_count + 1 WHERE proposal_id = #{proposal_id}")
    void applyCountPlus(@Param("proposal_id") long proposal_id);

    @Update("UPDATE post SET apply_count = apply_count - 1 WHERE proposal_id = #{proposal_id}")
    void    applyCountMinus(@Param("proposal_id") String proposal_id);

    @Select("SELECT * FROM post WHERE user_id = #{user_id}")
    Post findPostByUserID(@Param("user_id") String user_id);

    @Select("SELECT * FROM post WHERE proposal_id = #{proposal_id}")
    Post findPostByProposal_Id(@Param("proposal_id") long proposal_id);

    @Select("SELECT * FROM post WHERE title LIKE CONCAT('%', #{keyword}, '%') OR content LIKE CONCAT('%', #{keyword}, '%')")
    ArrayList<Post> findByTitleOrContentContaining(String keyword);

    @Select("SELECT * FROM post")
    ArrayList<Post> selectAllPost();
}
