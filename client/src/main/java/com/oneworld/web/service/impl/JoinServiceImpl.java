package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AppointmentMapper;
import com.oneworld.web.dao.JoinMapper;
import com.oneworld.web.model.Appointment;
import com.oneworld.web.model.Join;
import com.oneworld.web.service.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/4.
 */
@Service
public class JoinServiceImpl implements JoinService {
    @Autowired
    private JoinMapper joinMapper;
    @Autowired
    private AppointmentMapper appointmentMapper;

    public Map insertJoin(Join join) {
        Map returnMap = new HashMap();
        try{
            joinMapper.insertJoin(join);
            Appointment appointment = appointmentMapper.findAppointmentById(join.getAppointment_id());
            appointment.setWant_join(appointment.getWant_join()+1);
            appointmentMapper.updateApp(appointment);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"申请成功，等待对方审核");
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map deleteJoin(String id) {
        Map returnMap = new HashMap();
        try{
            Join join = joinMapper.findJoinById(id);
            if(join != null){
                joinMapper.deleteJoin(id);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"该用户的申请已经被您拒绝！");
            }else {
                returnMap = RequestConstant.getRequestDesCode(-1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  returnMap;
    }

    public Map queryJoinsByAppId(int id) {
        return null;
    }

    public Map updateJoin(Join join) {
        Map returnMap = new HashMap();
        try{
            Join join1 = joinMapper.findJoinById(join.getId());
            if(join1 != null){
                joinMapper.updateJoin(join);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"修改成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该加入信息不存在！");
                returnMap.put(ParameterConstant.RETURN_CODE,1008);
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map queryAllJoinsByJoin_account(String join_account) {
        Map returnMap = new HashMap();
        try {
            List<Join> joins = joinMapper.queryJoinsByJoinAccount(join_account);
            if(joins.size()>0){
                returnMap.put(ParameterConstant.RETURN_DATA,joins);
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public boolean isJoined(String join_account, String app_id) {
        boolean flag = false;
        try{
            Map requestMap = new HashMap();
            requestMap.put("join_account",join_account);
            requestMap.put("appointment_id",app_id);
            Join join =(Join)joinMapper.isJoined(requestMap);
            if(join != null){
                flag = true;
            }else{
                flag = false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  flag;
    }

    public Map joinUserInfo(int id) {
        return null;
    }

    public Map wantJoinUserInfo(int id) {
        return null;
    }

    public Map queryWantJoinsByAppId(int id) {
        return null;
    }

    public Map findJoinByUserAccountAndId(int id, String account) {
        return null;
    }
}
