package com.example.demo.controller.alarm.mapper;

import com.example.demo.controller.alarm.model.Alarm;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface AlarmMapper {
    @Insert("INSERT INTO alarm(user_id, activity, message, reg_time) VALUES(#{user_id}, #{activity}, #{message}, DATE_FORMAT(NOW(),'%Y%m%d%H%i%S'))")
    void insertAlarm(@Param("user_id") String user_id,
                     @Param("activity") String activity,
                     @Param("message") String message);


    @Select("SELECT * FROM alarm WHERE user_id = #{user_id} and check_status = '1' ORDER BY reg_time DESC")
    ArrayList<Alarm> selectAlarmByUserId(@Param("user_id") String user_id);

    @Update("UPDATE alarm SET check_status = '2' WHERE user_id = #{user_id}")
    void    updateCheck_statusByUserId(@Param("user_id") String user_id);

    @Update("UPDATE alarm SET alarm_count = alarm_count + 1 WHERE alarm_id = #{alarm_id}")
    void    updateAlarmCountByAlarmId(@Param("alarm_id") long alarm_id);
}
