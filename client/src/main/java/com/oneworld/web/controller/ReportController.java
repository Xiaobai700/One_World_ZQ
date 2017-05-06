package com.oneworld.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oneworld.web.model.Report;
import com.oneworld.web.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Master ZQ on 2017/5/2.
 */
@Controller
public class ReportController {
    @Autowired
    private ReportService reportService;

    @RequestMapping("report.action")
    @ResponseBody
    public void report(HttpServletRequest request, HttpServletResponse response,
                       Report report) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            report.setId(UUID.randomUUID().toString());
            report.setCurrentState(0);
            report.setStatus(0);
            report.setIsDelete(0);
            report.setUpdateTime(new Timestamp(new Date().getTime()));
            returnMap = reportService.insertReport(report);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("reportPage.do")
    public ModelAndView  reportPage(HttpServletRequest request,HttpServletResponse response,
                                    String account,String targetId,Integer targetType,String discussId){
        Map returnMap = new HashMap();
        returnMap.put("account",account);
        returnMap.put("targetId",targetId);
        returnMap.put("targetType",targetType);
        returnMap.put("discussId",discussId);
        return new ModelAndView("/client/reportPage",returnMap);
    }

}
