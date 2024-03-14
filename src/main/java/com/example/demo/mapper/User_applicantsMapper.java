package com.example.demo.mapper;

import com.example.demo.model.Post;
import com.example.demo.model.User_applicants;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface User_applicantsMapper {

    @Insert("INSERT INTO user_applicants(user_id, proposal_id) VALUES(#{user_id}, #{proposal_id})")
    void insertUser_applicants(@Param("user_id") String user_id,
                               @Param("proposal_id") long proposal_id);

    @Select("SELECT COUNT(*) FROM user_applicants WHERE proposal_id = #{proposal_id} AND user_id = #{user_id}")
    long countApplicants(@Param("proposal_id") long proposal_id,
                         @Param("user_id") String user_id);

    @Select("SELECT proposal_id FROM user_applicants WHERE user_id = #{user_id}")
    ArrayList<Long> selectProposal_idByUserId(@Param("user_id") String user_id);

    @Select("SELECT * FROM user_applicants WHERE proposal_id = #{proposal_id}")
    ArrayList<User_applicants> selectUser_applicantsByProposal_id(@Param("proposal_id") long proposal_id);

    @Select("SELECT * FROM user_applicants WHERE user_id = #{user_id}")
    ArrayList<User_applicants> selectUser_applicantsByUser_id(@Param("user_id") String user_id);

    @Update("UPDATE user_applicants SET status = 1 WHERE proposal_id = #{proposal_id} AND user_id = #{user_id}")
    void    acceptApplier(@Param("proposal_id") long proposal_id,
                          @Param("user_id") String user_id);

    @Update("UPDATE user_applicants SET status = 2 WHERE proposal_id = #{proposal_id} AND user_id = #{user_id}")
    void    rejectApplier(@Param("proposal_id") long proposal_id,
                          @Param("user_id") String user_id);

    @Delete("DELETE FROM user_applicants WHERE proposal_id = #{proposal_id}")
    void    deleteUser_applicantsByProposal_id(@Param("proposal_id") long proposal_id);

    @Delete("DELETE from user_applicants WHERE proposal_id = #{proposal_id} and user_id = #{user_id}")
    void    deleteUser_applicantsByUserIdProposalId(@Param("user_id") String user_id,
                                                    @Param("proposal_id") long proposal_id);
}
