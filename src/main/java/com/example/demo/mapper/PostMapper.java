package com.example.demo.mapper;

import com.example.demo.model.Post;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface PostMapper {
    @Insert("INSERT INTO post(user_id, title, content, address,axis_x, axis_y)" +
            "VALUES(#{user_id}, #{title}, #{content},#{address}, #{axis_x}, #{axis_y})")
    void    insertPost(@Param("user_id") String user_id,
                       @Param("title") String title,
                       @Param("content") String content,
                       @Param("address") String address,
                       @Param("axis_x") double axis_x,
                       @Param("axis_y") double axis_y);

    @Select("SELECT * FROM post WHERE user_id = #{user_id}")
    Post findPostByUserID(@Param("user_id") String user_id);

    @Select("SELECT * FROM post WHERE title LIKE CONCAT('%', #{keyword}, '%') OR content LIKE CONCAT('%', #{keyword}, '%')")
    ArrayList<Post> findByTitleOrContentContaining(String keyword);

    @Select("SELECT * FROM post")
    ArrayList<Post> selectAllPost();
}
