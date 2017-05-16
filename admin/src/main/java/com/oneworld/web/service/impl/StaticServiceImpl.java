package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.*;
import com.oneworld.web.model.*;
import com.oneworld.web.service.StaticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/9.
 */
@Service
public class StaticServiceImpl implements StaticService {
    @Autowired
    private IndustryMapper industryMapper;
    @Autowired
    private AppointmentMapper appointmentMapper;
    @Autowired
    private DiscussMapper discussMapper;
    @Autowired
    private ShareMapper shareMapper;
    @Autowired
    private AppTypeMapper appTypeMapper;

    public Map invitationChart() {
        Map returnMap = new HashMap();
        try {
            List<Appointment> appointmentList = appointmentMapper.findAllAppointment();
            List<Discuss> discussList = discussMapper.queryAllDiscuss();
            List<Share> shareList = shareMapper.queryAllByLike();
            List<Map<String,Object>> resultList = new ArrayList<Map<String, Object>>();
            List<String> nameList = new ArrayList<String>();
            for(int i =0;i<3;i++){
                Map resultMap = new HashMap();
                String name = "";
                switch (i){
                    case 0:
                        resultMap.put("name","约伴活动");
                        resultMap.put("value",appointmentList.size());
                        name = "约伴活动";
                        break;
                    case 1:
                        resultMap.put("name","讨论活动");
                        resultMap.put("value",discussList.size());
                        name = "讨论活动";
                        break;
                    case 2:
                        resultMap.put("name","分享活动");
                        resultMap.put("value",shareList.size());
                        name = "分享活动";
                        break;
                }
                resultList.add(resultMap);
                nameList.add(name);
            }
            returnMap.put(ParameterConstant.RETURN_DATA,resultList);
            returnMap.put("nameList",nameList);
            returnMap.put(ParameterConstant.RETURN_CODE,0);

        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map industryChart() {
        Map returnMap = new HashMap();
        try{
            List<Map<String,Object>> industryList = new ArrayList<Map<String, Object>>();
            List<String> industryNameList = new ArrayList<String>();
            List<Industry> industries = industryMapper.queryAllIndustry();
            for (Industry industry:industries) {
                Map industryMap = new HashMap();
                industryMap.put("name",industry.getIndustry_name());
                industryMap.put("value",industry.getIndustry_userNum());
                industryList.add(industryMap);
                industryNameList.add(industry.getIndustry_name());
            }
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_DATA,industryList);
            returnMap.put("nameList",industryNameList);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map appChart() {
        Map returnMap = new HashMap();
        try{
            List<Map<String,Object>> appList = new ArrayList<Map<String, Object>>();
            List<String> appTypeNameList = new ArrayList<String>();
            List<AppType> appTypeList = appTypeMapper.queryAllAppType();
            for (AppType appType:appTypeList) {
                Map appResult = new HashMap();
                appResult.put("name",appType.getTypeName());
                appResult.put("value",appType.getAttention_num());
                appList.add(appResult);
                appTypeNameList.add(appType.getTypeName());
            }
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put("nameList",appTypeNameList);
            returnMap.put(ParameterConstant.RETURN_DATA,appList);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }
}
