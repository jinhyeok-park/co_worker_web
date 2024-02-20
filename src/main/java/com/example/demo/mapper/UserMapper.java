package com.example.demo.mapper;

import com.example.demo.model.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
    @Insert("INSERT INTO user(user_id, user_name, pwd, nickname, email, phone_num, role_id) " +
            "VALUES(#{user_id}, #{username}, #{password}, #{nickname}, #{email}, #{phoneNum}, #{roleId})")
    void insertUser(@Param("user_id")  String user_id,
                    @Param("username") String username,
                    @Param("password") String password,
                    @Param("nickname") String nickname,
                    @Param("email") String email,
                    @Param("phoneNum") String phoneNum,
                    @Param("roleId") int roleId);

    @Select("SELECT * FROM user WHERE user_id = #{user_id}")
    User findUserByUsername(@Param("user_id") String user_id);

    @Select("SELECT * FROM user WHERE pwd = #{pwd}")
    User findUserByPwd(@Param("pwd") String pwd);
}