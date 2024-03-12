package com.example.demo.controller;

import ch.qos.logback.core.encoder.EchoEncoder;
import com.example.demo.mapper.UserMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.model.User;

import java.util.Map;

@Controller
public class SignUpController {
    @Autowired
    private UserMapper userMapper;

    @GetMapping("/signup")
    public ModelAndView showSignUpForm(HttpSession session,
                                       @RequestParam(value = "isEditMode", defaultValue = "false") boolean isEditMode) {
        ModelAndView mav = new ModelAndView("SignUpForm");
        if (isEditMode)
        {
            String userId = (String)session.getAttribute("user_id");
            User user = userMapper.findUserByUsername(userId);
            mav.addObject("isEditMode", isEditMode);
            mav.addObject("user_id", user.getUser_id());
            mav.addObject("email", user.getEmail());
            mav.addObject("nickname", user.getNickname());
            mav.addObject("phonenum", user.getPhone_num());
            mav.addObject("user_name", user.getUser_name());
        }
        return mav;
    }


    @PostMapping("/userEdit")
    public ModelAndView editUser(HttpSession session,
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("email") String email,
            @RequestParam("nickname") String nickname,
            @RequestParam("phoneNum") String phoneNum) {
        String oldUserId = (String)session.getAttribute("user_id");
        session.invalidate();
        userMapper.updateUserById(username, password, nickname, email, phoneNum, 0, oldUserId);
        return new ModelAndView("redirect:/");
    }

    @PostMapping("signup")
    public ModelAndView registerUser(
                                    @RequestParam("user_id") String user_id,
                                    @RequestParam("username") String username,
                                    @RequestParam("password") String password,
                                    @RequestParam("email") String email,
                                    @RequestParam("nickname") String nickname,
                                    @RequestParam("phoneNum") String phoneNum) {
        try
        {
            userMapper.insertUser(user_id, username, password, nickname, email, phoneNum, 0);
            System.out.println("hit try");
        }
        catch (Exception e)
        {
            ModelAndView mav = new ModelAndView("SignUpForm");
            mav.addObject("user", new User());
//            mav.addObject("error", e.getMessage());
            System.out.println("page load fail");
            return mav;
        }
        System.out.println("page load success");
        return new ModelAndView("redirect:/");
    }
}