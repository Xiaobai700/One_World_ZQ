package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AnswerMapper;
import com.oneworld.web.dao.AppointmentMapper;
import com.oneworld.web.dao.ReportMapper;
import com.oneworld.web.dao.UserMapper;
import com.oneworld.web.model.Answer;
import com.oneworld.web.model.Appointment;
import com.oneworld.web.model.Report;
import com.oneworld.web.model.User;
import com.oneworld.web.service.CommentService;
import com.oneworld.web.service.JoinService;
import com.oneworld.web.service.LikeService;
import com.oneworld.web.service.ReportService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/4.
 */
@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportMapper reportMapper;
    @Autowired
    private AnswerMapper answerMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CommentService commentService;
    @Autowired
    private AppointmentMapper appointmentMapper;
    @Autowired
    private LikeService likeService;
    @Autowired
    private JoinService joinService;
    public Map getReportPage(Map map) {
        Map returnMap = new HashedMap();
        try{
            List<Report> reportList = reportMapper.queryReportPage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,reportMapper.queryReportPage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,reportMapper.queryReportPage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,reportList);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }
    /*更新举报*/
    public Map updateReport(Report report) {
        Map returnMap = new HashMap();
        try{
            reportMapper.updateReport(report);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"更新成功！");
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
/*删除举报*/
    public Map deleteReport(String targetId, Integer targetType, String reportId, Integer processType) {
        Map returnMap = new HashMap();
        try {
            Report report = reportMapper.findReportById(reportId);
            if(report != null){
                report.setIsDelete(1);
                report.setCurrentState(1);
                report.setStatus(processType);
//                report.setUpdateTime(new Timestamp(new Date().getTime()));
                reportMapper.updateReport(report);
                returnMap.put(ParameterConstant.RETURN_MSG,"这条举报已删除！");
                returnMap.put(ParameterConstant.RETURN_CODE,0);
            }else {
                returnMap.put(ParameterConstant.RETURN_CODE,1008);
                returnMap.put(ParameterConstant.RETURN_MSG,"该举报已经被删除！");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }
/*删除记录*/
    public Map deleteInvitation(String targetId, Integer targetType, String reportId, Integer processType){
        Map returnMap = new HashMap();
        try {
            Report report = reportMapper.findReportById(reportId);
            if(report != null){
                switch (targetType){
                    case 1:/*举报回答*/
                        Answer answer = answerMapper.findAnswerById(targetId);
                        if(answer != null){
                            answerMapper.deleteAnswer(targetId);
                            commentService.deleteComments(targetId,1);
                            likeService.deleteLike(targetId,1);
                            report.setStatus(processType);
                            report.setCurrentState(1);
                            reportMapper.updateReport(report);
                            returnMap.put(ParameterConstant.RETURN_CODE,0);
                            returnMap.put(ParameterConstant.RETURN_MSG,"回答已经删除!");
                        }else {
                            returnMap.put(ParameterConstant.RETURN_CODE,1008);
                            returnMap.put(ParameterConstant.RETURN_MSG,"该回答不存在！");
                            return  returnMap;
                        }
                        break;
                    case 3:/*举报约伴活动*/
                        Appointment appointment = appointmentMapper.findAppointmentById(targetId);
                        if(appointment != null){
                            /*删除约伴活动*/
                            appointmentMapper.deleteAppointment(targetId);
                            /*删除约伴下的评论*/
                            commentService.deleteComments(targetId,3);
                            /*删除与此活动有关的加入信息*/
                            joinService.deleteJoinsByAppId(targetId);
                            report.setStatus(processType);
                            report.setCurrentState(1);
                            reportMapper.updateReport(report);
                            returnMap.put(ParameterConstant.RETURN_CODE,0);
                            returnMap.put(ParameterConstant.RETURN_MSG,"回答已经删除!");
                        }else {
                            returnMap.put(ParameterConstant.RETURN_CODE,1008);
                            returnMap.put(ParameterConstant.RETURN_MSG,"该活动不存在");
                        }
                        break;
                }
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该举报不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
/*删除记录并禁用用户*/
    public Map deleteInvitationAndDisUser(String targetId, Integer targetType, String reportId, Integer processType) {
        Map returnMap = new HashMap();
        try{
            Report report = reportMapper.findReportById(reportId);
            if(report != null){
                switch (targetType){
                    case 1:/*举报回答*/
                        Answer answer = answerMapper.findAnswerById(targetId);
                        if(answer != null){
                            User user = userMapper.findUserByAccount(answer.getAnswer_account());
                            if(user != null){
                                user.setDisabled(1);
                                userMapper.changeStatus(user);
                            }else {
                                returnMap.put(ParameterConstant.RETURN_MSG,"发布这条回答的用户不存在！");
                                return  returnMap;
                            }
                            answerMapper.deleteAnswer(targetId);
                            report.setStatus(processType);
//                            report.setUpdateTime(new Timestamp(new Date().getTime()));
                            report.setCurrentState(1);
                            reportMapper.updateReport(report);
                            returnMap.put(ParameterConstant.RETURN_CODE,0);
                            returnMap.put(ParameterConstant.RETURN_MSG,"回答已经删除，发布这条回答的用户已被禁用！");
                        }else {
                            returnMap.put(ParameterConstant.RETURN_CODE,1008);
                            returnMap.put(ParameterConstant.RETURN_MSG,"该回答不存在！");
                            return  returnMap;
                        }
                        break;
                }
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该举报不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }
/*禁用用户*/
    public Map disabledUser(String targetId, Integer targetType, String reportId, Integer processType) {
        Map returnMap = new HashMap();
        try{
            Report report = reportMapper.findReportById(reportId);
            if(report != null){
                report.setStatus(processType);
//                report.setUpdateTime(new Timestamp(new Date().getTime()));
                report.setCurrentState(1);
                reportMapper.updateReport(report);
                switch (targetType){
                    case 1:/*举报回答*/
                        Answer answer = answerMapper.findAnswerById(targetId);
                        if(answer != null){
                            User user = userMapper.findUserByAccount(answer.getAnswer_account());
                            if(user != null){
                                user.setDisabled(1);
                                userMapper.changeStatus(user);
                                returnMap.put(ParameterConstant.RETURN_CODE,0);
                                returnMap.put(ParameterConstant.RETURN_MSG,"发布这条回答的用户已被禁用！");
                            }else {
                                returnMap.put(ParameterConstant.RETURN_MSG,"发布这条回答的用户不存在！");
                            }
                        }else {
                            returnMap.put(ParameterConstant.RETURN_CODE,1008);
                            returnMap.put(ParameterConstant.RETURN_MSG,"该回答不存在！");
                        }
                        break;
                    case 2:
                        User user = userMapper.findUserByAccount(targetId);
                        if(user != null){
                            user.setDisabled(1);
                            userMapper.changeStatus(user);
                            returnMap.put(ParameterConstant.RETURN_CODE,0);
                            returnMap.put(ParameterConstant.RETURN_MSG,"该用户已被禁用！");
                        }else {
                            returnMap.put(ParameterConstant.RETURN_MSG,"该用户不存在");
                        }
                }
            }else {
               returnMap.put(ParameterConstant.RETURN_CODE,1008);
               returnMap.put(ParameterConstant.RETURN_MSG,"该举报不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }
}
