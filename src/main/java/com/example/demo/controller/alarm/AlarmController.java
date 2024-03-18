package com.example.demo.controller.alarm;

import com.example.demo.controller.alarm.mapper.AlarmMapper;
import com.example.demo.controller.alarm.model.Alarm;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/alarm/")
public class AlarmController {

    private final AlarmMapper alarmMapper;

    @GetMapping("alarm_list.html")
    public ModelAndView showAlarmPage(HttpSession session)
    {
        String userId = (String)session.getAttribute("user_id");

        ModelAndView mav = new ModelAndView("/alarm/alarm_list");
        mav.addObject("alarms", alarmMapper.selectAlarmByUserId(userId));

        // alarm status update
        alarmMapper.updateCheck_statusByUserId(userId);

        return mav;
    }
}
