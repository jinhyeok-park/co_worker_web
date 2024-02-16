package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
    @Insert("INSERT INTO user(user_name, password_hash, nickname, email, phone_num, role_id) " +
            "VALUES(#{username}, #{password}, #{nickname}, #{email}, #{phoneNum}, #{roleId})")
    void insertUser(@Param("username") String username,
                    @Param("password") String password,
                    @Param("nickname") String nickname,
                    @Param("email") String email,
                    @Param("phoneNum") String phoneNum,
                    @Param("roleId") int roleId);
}