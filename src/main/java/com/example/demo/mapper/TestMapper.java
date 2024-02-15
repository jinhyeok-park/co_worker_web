package com.example.demo.mapper;

import com.example.demo.model.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface TestMapper {
    @Insert("INSERT INTO tester(username, password) VALUES(#{username}, #{password})")
    void insertUser(@Param("username") String username, @Param("password") String password);

    @Select("SELECT * FROM tester WHERE username = #{username}")
    User findUserByUsername(@Param("username") String username);
}
