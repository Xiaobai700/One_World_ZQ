package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AppointmentMapper;
import com.oneworld.web.dao.CommentMapper;
import com.oneworld.web.dao.JoinMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Appointment;
import com.oneworld.web.model.Comment;
import com.oneworld.web.model.Join;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.AppointService;
import com.oneworld.web.service.JoinService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Service
public class AppointServiceImpl implements AppointService {
    @Autowired
    private AppointmentMapper appointmentMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private UserinfoMapper userinfoMapper;

    @Autowired
    private JoinMapper joinMapper;

    @Autowired
    private JoinService joinService;

    public Map newestAppointment() {
        Map returnMap = new HashMap();
        try{
            List<Appointment> appointments = appointmentMapper.newestAppointment();
            if(appointments.size() != 0){
                returnMap.put(ParameterConstant.RETURN_DATA,appointments);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap.put(ParameterConstant.RETURN_MSG,"系统内部错误");
        }
        return returnMap;
    }

    public Map findAllAppointment() {
        Map returnMap = new HashMap();
        try{
            List<Appointment> appointments = appointmentMapper.findAllAppointment();
            if(appointments.size()>0){
                returnMap.put(ParameterConstant.RETURN_DATA,appointments);
                return  returnMap;
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"未有用户发布活动");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map insertAppointment(Appointment appointment) {
        Map returnMap = new HashedMap();
        try{
            appointmentMapper.insertAppointment(appointment);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"新增活动成功，等待系统管理员审核！");
        }catch (Exception e){
            e.printStackTrace();
        }
        return  returnMap;
    }

    public Map findAppointmentById(String id) {
        Map returnMap = new HashedMap();
        try {
            Appointment appointment = appointmentMapper.findAppointmentById(id);
            if(appointment != null){
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_DATA,appointment);
                returnMap.put(ParameterConstant.RETURN_MSG,"获取数据成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_CODE,1008);
                returnMap.put(ParameterConstant.RETURN_MSG,"该活动不存在！");
            }
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map findAppointmentByWant_join() {
        Map returnMap = new HashMap();
        try{
            List<Appointment> appointments = appointmentMapper.findAppointmentByWant_join();
            if(appointments.size()>0){
                returnMap.put(ParameterConstant.RETURN_DATA,appointments);
                return  returnMap;
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"未有用户发布活动");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map findAppointmentByUserAccount(String account) {
        return null;
    }

    public Map appDetail(String id) {
        Map returnMap = new HashedMap();
        try {
            Appointment appointment = appointmentMapper.findAppointmentById(id);

            Map<String,Object> app = new HashedMap();
            List<Map<String,Object>> comments = new ArrayList<Map<String, Object>>();
            if(appointment != null){
                UserInfo findUser = userinfoMapper.findUserInfoByAccount(appointment.getOrganizer_account());
                Map requstMap = new HashedMap();
                requstMap.put("target_id",id);
                requstMap.put("label",2);/*对回答的评论 label:1  约伴：2 分享：3*/
                List<Comment> commentList = commentMapper.queryCommentsByTargetIdAndLabel(requstMap);
                /*查找这个活动有多少人成功参加*/
                Map requestMap = new HashMap();
                requestMap.put("appointment_id",id);
                requestMap.put("join_or_not",1);
                List<Join> joins = joinMapper.queryJoinsByMap(requestMap);
                List<UserInfo> join_userInfos = new ArrayList<UserInfo>();
                for (Join j:joins) {
                    UserInfo joinUser = userinfoMapper.findUserInfoByAccount(j.getJoin_account());
                    join_userInfos.add(joinUser);
                }
                /*当活动的发起者查看自己发起的活动的时候 她可以看到想要加入单还未加入的用户的信息 并且可以审核他们加入活动*/
                Map requestMap1 = new HashMap();
                requestMap1.put("appointment_id",id);
                requestMap1.put("join_or_not",0);
                List<Join> joins1 = joinMapper.queryJoinsByMap(requestMap1);
//                List<UserInfo> join_userInfos1 = new ArrayList<UserInfo>();
                List<Map<String,Object>> join_userInfos1 = new ArrayList<Map<String,Object>>();
                for (Join j:joins1) {
                    Map joinMap = new HashMap();
                    UserInfo joinUser = userinfoMapper.findUserInfoByAccount(j.getJoin_account());
                    joinMap.put("joinUser",joinUser);
                    joinMap.put("join",j);
                    join_userInfos1.add(joinMap);
//                    join_userInfos1.add(joinUser);
                }

                for (Comment c:commentList) {
                    Map<String,Object> comment = new HashedMap();
                    UserInfo comUser = userinfoMapper.findUserInfoByAccount(c.getCommenter_account());
                    comment.put("comUser",comUser);
                    comment.put("comment",c);
                    comments.add(comment);
                }
                app.put("join_userInfos",join_userInfos);
                app.put("wantJoin_userInfos",join_userInfos1);
                app.put("find_userInfo",findUser);
                app.put("comment",comments);
                app.put("commentNumber",commentList.size());
                app.put("appointment",appointment);
                returnMap.put(ParameterConstant.RETURN_DATA,app);
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该约伴活动不存在");
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return returnMap;
    }
}
