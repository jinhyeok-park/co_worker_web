package com.example.demo.controller;

import com.example.demo.mapper.UserMapper;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView registerUser(@RequestParam("user_id") String user_id,
                               @RequestParam("pwd") String pwd) {
        User    userID;
        User    userPWD;

        System.out.println("hit login post controller");
        try
        {
            userID = userMapper.findUserByUsername(user_id);
            userPWD = userMapper.findUserByPwd(pwd);
        }
        catch (Exception e)
        {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("user", new User());
            System.out.println("hit login load fail");
            return mav;
        }
        return new ModelAndView("redirect:/");
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