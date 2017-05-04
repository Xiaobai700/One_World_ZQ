package com.oneworld.web.controller;

import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.model.Industry;
import com.oneworld.web.service.IndustryService;
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
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/17.
 */
@Controller
public class IndustryController {
    @Autowired
    private IndustryService industryService;

    @RequestMapping("industry-list.html")
    public ModelAndView industryList(){
        ModelAndView modelAndView = new ModelAndView("/manage/discuss/industry-list");
        return  modelAndView;
    }

    @RequestMapping("industry-list.json")
    @ResponseBody
    public void industryListDo(HttpServletRequest request,
                               HttpServletResponse response,
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
            returnMap = industryService.queryIndustryPage(requestMap);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("add-industry.action")
    @ResponseBody
    public void addIndustry(HttpServletRequest request,
                            HttpServletResponse response,
                            String industry_name)throws IOException{
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try {
            Industry industry = new Industry();
            industry.setIndustry_name(industry_name);
            returnMap = industryService.insertIndustry(industry);
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
    }
    @RequestMapping("delete-industry.action")
    @ResponseBody
    public void deleteIndustry(HttpServletRequest request,
                            HttpServletResponse response,
                            String id
    ) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try {
            returnMap = industryService.deleteIndustry(id);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

}
