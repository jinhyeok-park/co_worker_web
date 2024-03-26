package com.example.demo.controller.login;

import com.example.demo.controller.user.mapper.UserMapper;
import com.example.demo.controller.user.model.User;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/login/")
public class LoginController {

    private final UserMapper userMapper;

    @GetMapping("login.html")
    public String showLoginForm() {
        System.out.println("hit login get controller");
        // login.jsp 폼을 보여주는 경로
        return "/login/login";
    }

    @PostMapping("login.do")
    public ModelAndView loginUser(@RequestParam("user_id") String user_id, @RequestParam("pwd") String pwd, HttpSession session){
        if (authenticate(user_id, pwd))
        {
            session.setAttribute("user_id", user_id);
            session.setMaxInactiveInterval(3000);
            ModelAndView mav = new ModelAndView("redirect:/"); //여기서  :이후는 url 값이 됨.
            return mav;
        }
        else
            return new ModelAndView("/login/login");
    }
    private boolean authenticate(String user_id, String pwd)
    {
            User userID;

            userID = userMapper.findUserByUsername(user_id);
            if (userID == null)
            {
                System.out.println("is not null");
                return false;
            }
            return Objects.equals(userID.getPwd(), pwd);
    }

    @PostMapping("logout.do")
    public ModelAndView logout(HttpSession session)
    {
        session.invalidate();
        return new ModelAndView("redirect:/");
    }
}