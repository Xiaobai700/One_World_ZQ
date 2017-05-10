package com.oneworld.web.controller;

import com.oneworld.web.dao.ReportMapper;
import com.oneworld.web.model.Report;
import com.oneworld.web.service.AnswerService;
import com.oneworld.web.service.ReportService;
import com.oneworld.web.service.UserService;
import com.oneworld.web.util.DateTableUtil;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/11.
 */
@Controller
public class ReportController {
    @Autowired
    private ReportService reportService;
    @Autowired
    private ReportMapper reportMapper;
    @Autowired
    private AnswerService answerService;
    @Autowired
    private UserService userService;

    @RequestMapping("report-list.html")
    public ModelAndView reportList(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/manage/report/report-list");
        return modelAndView;
    }

    @RequestMapping("report-list.json")
    @ResponseBody
    public void reportListPage(HttpServletRequest request, HttpServletResponse response,
                               @RequestParam String aoData)throws IOException{
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
            /*转变日期格式*/
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mapper.setDateFormat(fmt);
        try {
            Map requestMap = DateTableUtil.getDateTableRequestDate(aoData);
            returnMap = reportService.getReportPage(requestMap);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("deleteReport.action")
    @ResponseBody
    public void deleteReport(HttpServletRequest request,HttpServletResponse response,
                             String id) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            Report report = reportMapper.findReportById(id);
            report.setUpdateTime(new Timestamp(new Date().getTime()));
            report.setIsDelete(1);
            returnMap = reportService.updateReport(report);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("process-report.action")
    @ResponseBody
    public void processReport(HttpServletRequest request,HttpServletResponse response,
                              String targetId,Integer targetType,String reportId,Integer processType) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            if(targetType == 2){/*如果举报的是用户 因为对举报用户的处理只有两个选项 与举报帖子不同*/
                switch (processType){
                    case 1:
                        returnMap = reportService.deleteReport(targetId,targetType,reportId,processType);
                        break;
                    case 3:
                        returnMap = reportService.disabledUser(targetId,targetType,reportId,processType);
                        break;
                }
                outWriter.write(mapper.writeValueAsString(returnMap));
            }else {
                switch (processType){
                    case 1:/*删除举报*/
                        returnMap = reportService.deleteReport(targetId,targetType,reportId,processType);
                        break;
                    case 2:/*删除记录*/
                        returnMap = reportService.deleteInvitation(targetId,targetType,reportId,processType);
                        break;
                    case 3:/*禁用用户*/
                        returnMap = reportService.disabledUser(targetId,targetType,reportId,processType);
                        break;
                    case 4:/*删除记录并禁用用户*/
                        returnMap = reportService.deleteInvitationAndDisUser(targetId,targetType,reportId,processType);
                        break;
                }
                outWriter.write(mapper.writeValueAsString(returnMap));
            }
        }catch (Exception e){
            outWriter.write(mapper.writeValueAsString(returnMap));
            e.printStackTrace();
        }

    }
}
