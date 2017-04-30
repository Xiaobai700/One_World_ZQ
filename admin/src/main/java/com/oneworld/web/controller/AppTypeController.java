package com.oneworld.web.controller;

import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.model.AppType;
import com.oneworld.web.service.AppTypeService;
import com.oneworld.web.util.DateTableUtil;
import org.apache.commons.collections.map.HashedMap;
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
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/20.
 */
@Controller
public class AppTypeController {
    @Autowired
    private AppTypeService appTypeService;

    @RequestMapping("appointmentType-list.html")
    public ModelAndView appTypeList(HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("/manage/appointment/appointmentType-list");
        return modelAndView;
    }

    @RequestMapping("appType-list.json")
    @ResponseBody
    public void appTypeListDo(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestParam String aoData)throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
            /*转变日期格式*/
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mapper.setDateFormat(fmt);
        try {
            Map requestMap = DateTableUtil.getDateTableRequestDate(aoData);
            returnMap = appTypeService.queryAppTypePage(requestMap);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("add-appType.action")
    @ResponseBody
    public void addAppType(HttpServletRequest request,
                            HttpServletResponse response,
                            String type_name
    )throws IOException{
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashedMap();
        try {
            AppType appType = new AppType();
            appType.settypeName(type_name);
            returnMap = appTypeService.insertAppType(appType);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("delete-appType.action")
    @ResponseBody
    public void deleteAppType(HttpServletRequest request,
                            HttpServletResponse response,
                            int id
    ) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try {
            returnMap = appTypeService.deleteAppType(id);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
