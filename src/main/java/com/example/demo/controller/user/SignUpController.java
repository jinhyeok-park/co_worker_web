package com.example.demo.controller.user;

import com.example.demo.controller.user.mapper.UserMapper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.controller.user.model.User;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/signup/")
public class SignUpController {
    private final UserMapper userMapper;

    @GetMapping("signup.html")
    public ModelAndView showSignUpPage()
    {
        return new ModelAndView("/login/sign_up");
    }
    @PostMapping("signup.do")
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
        }
        catch (Exception e)
        {
            ModelAndView mav = new ModelAndView("/login/sign_up");
            mav.addObject("user", new User());
            return mav;
        }

        return new ModelAndView("redirect:/");
    }

    @PostMapping("check_user_id.do")
    public ResponseEntity<String> checkUserId(@RequestParam("user_Id") String userId) {
        return userMapper.findUserByUsername(userId) != null ? ResponseEntity.ok("EXISTS") : ResponseEntity.ok("OK");
    }
}