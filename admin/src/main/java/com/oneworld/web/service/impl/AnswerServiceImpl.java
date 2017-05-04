package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.dao.AnswerMapper;
import com.oneworld.web.dao.ReportMapper;
import com.oneworld.web.model.Answer;
import com.oneworld.web.model.Report;
import com.oneworld.web.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Service
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerMapper answerMapper;
    @Autowired
    private ReportMapper reportMapper;

    public Map insertAnswer(Answer answer) {
        return null;
    }

    public Map findAnswersByDiscuss_id(String discuss_id) {
        return null;
    }

    public Map findAllAnswersByDiscuss_id(String discuss_id) {
        return null;
    }

    public Map deleteAnswer(String id,String reportId,Integer processType) {/*回答的id  举报的id*/
        Map returnMap = new HashMap();
        try{
            Answer answer = answerMapper.findAnswerById(id);
            Report report = reportMapper.findReportById(reportId);
            if(answer != null && report != null){
                answerMapper.deleteAnswer(id);
                report.setUpdateTime(new Timestamp(new Date().getTime()));
                report.setCurrentState(1);/*0:未处理  1:已处理*/
                report.setStatus(processType);/*1:删除举报 2：删除记录  3：禁用用户  4：删除记录并禁用用户*/
                reportMapper.updateReport(report);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"删除成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该回答已经被删除！");
                returnMap.put(ParameterConstant.RETURN_CODE,0);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map findAnswerById(String id) {
        return null;
    }

    public Map getUserInfosByDiscuss_id(String discuss_id) {
        return null;
    }

    public Map findAnswerByDiscuss_idAndUser_account(String discuss_id, String account) {
        return null;
    }

    public Map findAnswersByUser_account(String user_account) {
        return null;
    }
}
