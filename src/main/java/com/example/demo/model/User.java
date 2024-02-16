package com.example.demo.model;
import lombok.Data;
import org.springframework.context.annotation.Bean;

//회원 가입시에 user 객체를 생성하는 데 사용될 것이고, 이 데이터를 DB에 저장해서 관리해야할 것임
@Data
public class User {
    private String  username; // username table : user column : user_name
    private String  password; // password table : user column : passworkd_hash;
    private String  nickname; // nickname table : user column : nickname;
    private String  email; // email table : user column : email;
    private String  phone_num; // phone_num table : user, column : phone_num;
    private int  role_id; // email table : user column : role_id;
}