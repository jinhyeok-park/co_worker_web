package com.example.demo.controller;

import com.example.demo.mapper.AlarmMapper;
import com.example.demo.model.Alarm;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

@Controller
public class AlarmController {

    @Autowired
    AlarmMapper alarmMapper;
    @GetMapping("/alarm")
    public ModelAndView showAlarmPage(HttpSession session)
    {
        ArrayList<Object> combinedList = new ArrayList<>();
        String userId = (String)session.getAttribute("user_id");
        ModelAndView mav = new ModelAndView("/alarm");
        ArrayList<Alarm> alarms = alarmMapper.selectAlarmByUserId(userId);
        mav.addObject("alarms", alarms);
        alarmMapper.updateCheck_statusByUserId(userId);
        return mav;
    }
}
