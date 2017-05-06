package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AnswerMapper;
import com.oneworld.web.dao.ReportMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Answer;
import com.oneworld.web.model.Report;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.ReportService;
import com.oneworld.web.util.ComBineUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/2.
 */
@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportMapper reportMapper;
    @Autowired
    private AnswerMapper answerMapper;
    @Autowired
    private UserinfoMapper userinfoMapper;

    public Map insertReport(Report report) {
        Map returnMap = new HashMap();
        try{
            String reportType = report.getReportType();
//            Integer targetType = report.getTargetType();
            String targetId = report.getTargetId();

            Map requestMap = new HashMap();
            requestMap.put("targetId",targetId);
            requestMap.put("targetType",report.getTargetType());

            boolean flag = false;
            Report isReport = null;
            switch (report.getTargetType()){
                case 1:
                    Answer answer = answerMapper.findAnswerById(targetId);
                    if(answer != null){
                        /*判断关于这条回答的举报是否存在*/
                        isReport = (Report) isReport(requestMap).get("data");
                    }else {
                        returnMap.put(ParameterConstant.RETURN_MSG,"该回答不存在！");
                        return returnMap;
                    }
                    break;
                case 2:
                    UserInfo userInfo = userinfoMapper.findUserInfoByAccount(targetId);
                    if(userInfo != null){
                        /*判断关于这条回答的举报是否存在*/
                        isReport = (Report) isReport(requestMap).get("data");
                    }else {
                        returnMap.put(ParameterConstant.RETURN_MSG,"该用户不存在！");
                        return returnMap;
                    }
                    break;
            }

            if(isReport != null){
                //举报存在 就更新
                /*把String[]转换成int[]*/
                String oldResultType = isReport.getReportType();
                String[] oldTypeString = oldResultType.split(",");
                int[] oldTypeInt = new int[oldTypeString.length];
                for (int i=0;i<oldTypeString.length;i++){
                    oldTypeInt[i]=Integer.parseInt(oldTypeString[i]);
                }
                /*把String[]转换成int[]*/
                String[] newTypeString = reportType.split(",");
                int[] newTypeInt = new int[newTypeString.length];
                for (int i=0;i<newTypeString.length;i++){
                    newTypeInt[i]=Integer.parseInt(newTypeString[i]);
                }
                /*把两个int类型的数组 组合在一起 重复的元素值保留一个*/
                int[] finalType = ComBineUtil.mergeByArray(oldTypeInt,newTypeInt);

                /*把int类型的数组转换成以逗号分隔的字符串*/
                String report_type = "";
                for(int i=0;i<finalType.length;i++){
                    if(i < finalType.length-1 && finalType[i] != 0){
                        report_type += finalType[i]+",";
                    }else if(i < finalType.length-1 && finalType[i] == 0){
                        continue;
                    }else if(i == finalType.length-1 && finalType[i] != 0){
                        report_type += finalType[i];
                    }else if(i == finalType.length-1 && finalType[i] == 0){
                        break;
                    }
                }
                /*去除最后一个多余的逗号*/
                if(report_type.endsWith(",")){
                    report_type = report_type.substring(0,report_type.length()-1);
                }
                isReport.setReportType(report_type);
                isReport.setUpdateTime(new Timestamp(new Date().getTime()));

                returnMap = updateReport(isReport);
                returnMap.put(ParameterConstant.RETURN_MSG,"举报成功");
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                return  returnMap;
            }else {
                //举报不存在 就新建
                reportMapper.insertReport(report);
                returnMap.put(ParameterConstant.RETURN_MSG,"举报成功");
                returnMap.put(ParameterConstant.RETURN_CODE,0);
            }

        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }

    public Map isReport(Map map) {
        Map returnMap = new HashMap();
        try{
            Report report = reportMapper.findReportByTargetTypeAndId(map);
            returnMap.put(ParameterConstant.RETURN_DATA,report);
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map updateReport(Report report) {
        Map returnMap = new HashMap();
        try{
            reportMapper.updateReport(report);
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }
}
