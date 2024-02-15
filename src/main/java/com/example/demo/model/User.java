package com.example.demo.model;

import org.springframework.context.annotation.Bean;


public class User {
    private String username; // 데이터베이스의 username 컬럼에 해당
    private String password; // 데이터베이스의 password 컬럼에 해당

    // username 필드에 대한 getter 메서드
    public String getUsername() {
        return username;
    }

    // username 필드에 대한 setter 메서드
    public void setUsername(String username) {
        this.username = username;
    }

    // password 필드에 대한 getter 메서드
    public String getPassword() {
        return password;
    }

    // password 필드에 대한 setter 메서드
    public void setPassword(String password) {
        this.password = password;
    }
}