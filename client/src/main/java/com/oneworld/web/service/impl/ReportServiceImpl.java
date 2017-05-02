package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.ReportMapper;
import com.oneworld.web.model.Report;
import com.oneworld.web.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/2.
 */
@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportMapper reportMapper;

    public Map insertReport(Report report) {
        Map returnMap = new HashMap();
        try{
            reportMapper.insertReport(report);
            returnMap.put(ParameterConstant.RETURN_MSG,"举报成功");
            returnMap.put(ParameterConstant.RETURN_CODE,0);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }
}
