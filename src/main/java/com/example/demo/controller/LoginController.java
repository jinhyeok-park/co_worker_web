package com.example.demo.controller;

import com.example.demo.mapper.UserMapper;
import com.example.demo.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Objects;

@Controller
public class LoginController {

    @Autowired
    private UserMapper userMapper;

    @GetMapping("/login")
    public String showLoginForm() {
        System.out.println("hit login get controller");
        // login.jsp 폼을 보여주는 경로
        return "login";
    }

    @PostMapping("/login")
    public ModelAndView loginUser(@RequestParam("user_id") String user_id,
                               @RequestParam("pwd") String pwd,
                                  HttpSession session){

        System.out.println("hit login post controller");
        System.out.println(user_id);
        System.out.println(pwd);
        if (authenticate(user_id, pwd))
        {

            System.out.println("hit session");
            session.setAttribute("user_id", user_id);
            session.setMaxInactiveInterval(600);
            ModelAndView mav = new ModelAndView("redirect:/"); //여기서  :이후는 url값이됨,
            return mav;
        }
        else
            return new ModelAndView("/login");
    }
    private boolean authenticate(String user_id, String pwd)
    {
//        try
//        {
            User userID;
//            try
//            {
//                userID = userMapper.findUserByUsername(user_id);
//                if(userID != null)
//                {
//                    System.out.println("is not null");
//                }
//                System.out.println(userID.getUser_id());
//                System.out.println(userID.getPwd());
//                return Objects.equals(userID.getPwd(), pwd);
//            }

            userID = userMapper.findUserByUsername(user_id);
            if (userID == null)
            {
                System.out.println("is not null");
                return false;
            }
            System.out.println(userID.getUser_id());
            System.out.println(userID.getPwd());
            return Objects.equals(userID.getPwd(), pwd);
//        }
//        catch (Exception e)
//        {
//            return false;
//        }
    }
}
//        // MyBatis를 사용하여 사용자 정보를 데이터베이스에 저장
//        User temp;
//        userMapper.insertUser(username, password);
//        temp = userMapper.findUserByUsername(username);
//        System.out.println(temp.getUsername());
//
//        return "redirec:/"; // 사용자 등록 성공 시 보여줄 페이지
//    }