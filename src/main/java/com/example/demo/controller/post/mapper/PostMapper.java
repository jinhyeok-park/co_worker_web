package com.example.demo.controller.post.mapper;

import com.example.demo.controller.post.model.Post;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface PostMapper {
    @Insert("INSERT INTO post(user_id, title, content, address,axis_x, axis_y, apply_limit, reg_time)" +
            "VALUES(#{user_id}, #{title}, #{content},#{address}, #{axis_x}, #{axis_y}, #{apply_limit}, DATE_FORMAT(NOW(),'%Y%m%d%H%i%S'))")
    @Options(useGeneratedKeys = true, keyProperty = "proposal_id")
    void    insertPost(Post post);

    @Update("UPDATE post SET apply_count = apply_count + 1 WHERE proposal_id = #{proposal_id}")
    void applyCountPlus(@Param("proposal_id") long proposal_id);

    @Update("UPDATE post SET apply_count = apply_count - 1 WHERE proposal_id = #{proposal_id}")
    void    applyCountMinus(@Param("proposal_id") String proposal_id);

    @Update("UPDATE post SET apply_accept_count = apply_accept_count + 1 WHERE proposal_id = #{proposal_id}")
    void applyAcceptCountPlus(@Param("proposal_id") long proposal_id);

    @Update("UPDATE post SET apply_accept_count = apply_accept_count - 1 WHERE proposal_id = #{proposal_id}")
    void applyAcceptCountMinus(@Param("proposal_id") long proposal_id);

    @Select("SELECT * FROM post WHERE user_id = #{user_id}")
    ArrayList<Post> findPostsByUserID(@Param("user_id") String user_id);

    @Select("SELECT * FROM post WHERE proposal_id = #{proposal_id}")
    Post findPostByProposal_Id(@Param("proposal_id") long proposal_id);

    @Select("SELECT * FROM post WHERE (title LIKE CONCAT('%', #{keyword}, '%') OR content LIKE CONCAT('%', #{keyword}, '%')) AND axis_x != 0 AND axis_y != 0")
    ArrayList<Post> findByTitleOrContentContaining(String keyword);

    @Select("SELECT user_id, title, content, address, axis_x, axis_y, apply_limit FROM post WHERE axis_x != 0 AND axis_y != 0")
    ArrayList<Post> selectAllPostsExceptZeroLocations();

    @Select("SELECT * FROM post ORDER BY reg_time DESC")
    ArrayList<Post> selectAllPost();

    @Update("UPDATE post set chatroom_status = '1' WHERE proposal_id = #{proposal_id}")
    void    updateChatRoomStatusTrue(@Param("proposal_id") long proposal_id);

    @Update("UPDATE post set chatroom_status = '0' WHERE proposal_id = #{proposal_id}")
    void    updateChatRoomStatusFalse(@Param("proposal_id") long proposal_id);

    @Update("UPDATE post set teampage_status = '1' WHERE proposal_id = #{proposal_id}")
    void    updateTeamPageStatusTrue(@Param("proposal_id") long proposal_id);

    @Update("UPDATE post set teampage_status = '0' WHERE proposal_id = #{proposal_id}")
    void    updateTeamPageStatusFalse(@Param("proposal_id") long proposal_id);

    @Select("SELECT proposal_id FROM post WHERE user_id = #{user_id} and title = #{title}")
    Long selectProposal_idByTitleUser_id(@Param("user_id") String user_id,
                                         @Param("title") String title);
    @Delete("DELETE FROM post WHERE proposal_id = #{proposal_id}")
    void    deletePostByProposal_id(@Param("proposal_id") long proposal_id);

    @Update("UPDATE post SET title = #{title}, content = #{content}, address = #{address}, axis_x = #{axis_x}, axis_y = #{axis_y}, apply_limit = #{apply_limit}, reg_time = DATE_FORMAT(NOW(),'%Y%m%d%H%i%S') WHERE proposal_id = #{proposal_id}")
    void    updatePostByProposal_id(@Param("title") String title,
                                    @Param("content") String content,
                                    @Param("address") String address,
                                    @Param("axis_x") double axis_x,
                                    @Param("axis_y") double axis_y,
                                    @Param("apply_limit") long apply_limit,
                                    @Param("proposal_id") long proposal_id);

}
