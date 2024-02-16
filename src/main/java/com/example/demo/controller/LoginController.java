package com.example.demo.controller;

import com.example.demo.mapper.TestMapper;
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
    private TestMapper userMapper;

    @GetMapping("/")
    public String showLoginForm() {
        // login.jsp 폼을 보여주는 경로
        return "login";
    }

    @PostMapping("/login")
    public String registerUser(@RequestParam("username") String username,
                               @RequestParam("password") String password) {
        // MyBatis를 사용하여 사용자 정보를 데이터베이스에 저장
        User temp;
        userMapper.insertUser(username, password);
        temp = userMapper.findUserByUsername(username);
        System.out.println(temp.getUsername());

        return "loginSuccess"; // 사용자 등록 성공 시 보여줄 페이지
    }

//    @PostMapping("/login")
//    public ModelAndView processLogin(@RequestParam("username") String username,
//                                     @RequestParam("password") String password) {
//        ModelAndView modelAndView = new ModelAndView();
//
//        // 여기에서 사용자 이름과 비밀번호 검증 로직을 구현합니다.
//        // 이 예시에서는 단순히 모든 사용자를 '로그인 성공'으로 가정합니다.
//        if ("admin".equals(username) && "password".equals(password)) {
//            // 로그인 성공 시 보여줄 페이지 설정
//            modelAndView.setViewName("welcome");
//            modelAndView.addObject("username", username);
//        } else {
//            // 로그인 실패 시 다시 login.jsp 페이지로 리다이렉트
//            modelAndView.setViewName("redirect:/");
//            modelAndView.addObject("message", "Invalid username or password");
//        }
//
//        return modelAndView;
//    }
}

    // welcome 페이지를 위한 메서드 (로그인 성공 시)
//    @GetMapping("/welcome")
//    public String showWelcomePage() {
//        return "welcome";
//    }
//}
