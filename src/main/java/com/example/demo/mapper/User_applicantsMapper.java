package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface User_applicantsMapper {

    @Insert("INSERT INTO user_applicants(user_id, proposal_id) VALUES(#{user_id}, #{proposal_id})")
    void insertUser_applicants(@Param("user_id") String user_id,
                               @Param("proposal_id") long proposal_id);

    @Select("SELECT COUNT(*) FROM user_applicants WHERE proposal_id = #{proposal_id} AND user_id = #{user_id}")
    long countApplicants(@Param("proposal_id") long proposal_id,
                         @Param("user_id") String user_id);


}
