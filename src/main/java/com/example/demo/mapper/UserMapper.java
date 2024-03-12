package com.example.demo.mapper;

import com.example.demo.model.User;
import org.apache.ibatis.annotations.*;

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
    @Update("UPDATE user SET user_name = #{user_name}, pwd = #{password}, nickname = #{nickname}, email = #{email}, phone_num = #{phone_num}, role_id = #{role_id} WHERE user_id = #{origin_user_id}")
    void updateUserById(@Param("user_name") String userName,
                        @Param("password") String password,
                        @Param("nickname") String nickname,
                        @Param("email") String email,
                        @Param("phone_num") String phoneNum,
                        @Param("role_id") Integer roleId,
                        @Param("origin_user_id") String originUserId);

}