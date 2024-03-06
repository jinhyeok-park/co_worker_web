package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

    @Insert("INSERT INTO member(user_id, proposal_id)" + "VALUES(#{user_id) ,#{proposal_id})")
    void insertMemeber(@Param("user_id") String user_id,
                       @Param("proposal_id") long proposal_id);
}
