package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AppTypeMapper;
import com.oneworld.web.dao.AppointmentMapper;
import com.oneworld.web.model.AppType;
import com.oneworld.web.model.Appointment;
import com.oneworld.web.service.AppointService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/13.
 */
@Service
public class AppoinmentServiceImpl implements AppointService {
    @Autowired
    private AppointmentMapper appointmentMapper;
    @Autowired
    private AppTypeMapper appTypeMapper;

    public Map insertAppointment(Appointment appointment) {
        return null;
    }

    public Map findAppointmentById(String id) {
        /*转变日期格式*/
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Map returnMap = new HashMap();
        try{
            Appointment appointment = appointmentMapper.findAppointmentById(id);
            List<AppType> appTypeList = appTypeMapper.queryAllAppType();
            returnMap.put("appTypeList",appTypeList);
            returnMap.put("pTime",fmt.format(appointment.getPublish_time()));
            returnMap.put(ParameterConstant.RETURN_DATA,appointment);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map getAppaPage(Map map) {
        Map returnMap = new HashedMap();
        try{
            List<Appointment> appointments = appointmentMapper.queryAppsPage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,appointmentMapper.queryAppsPage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,appointmentMapper.queryAppsPage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,appointments);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map checkApp(String id) {
        Map returnMap = new HashedMap();
        try{
            Appointment appointment = appointmentMapper.findAppointmentById(id);
            if(appointment != null){
                appointment.setIs_checked(1);
                appointmentMapper.updateApp(appointment);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"审核成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该活动不存在！");
            }
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }
}
