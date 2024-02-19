package com.example.demo.controller;

import org.springframework.http.ResponseEntity;
import com.example.demo.mapper.UserMapper;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired; // 필요한 import 추가
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Objects;

@Controller
public class CheckUserId {

//    private final UserMapper userMapper;
    @Autowired
    private UserMapper userMapper;

//    @Autowired // UserMapper에 대한 의존성 주입
//    public CheckUserId(UserMapper userMapper) {
//        this.userMapper = userMapper;
//    }

    @PostMapping("/checkUserIdServlet")
    public ResponseEntity<String> checkUserId(@RequestParam("user_Id") String userId) {
        System.out.println("hit in controller");
        boolean exists = checkUserIdInDB(userId);

        if (exists) {
            System.out.println("db found");
            return ResponseEntity.ok("EXISTS");
        } else {
            System.out.println("db notfound");
            return ResponseEntity.ok("OK");
        }
    }

    private boolean checkUserIdInDB(String userId) {
        System.out.println("Checking in DB");
        User temp = userMapper.findUserByUsername(userId);
        if (temp != null)
        {
            System.out.println("hit" + temp.getUser_id());
        }
        return temp != null && temp.getUser_id() != null;
    }
}
