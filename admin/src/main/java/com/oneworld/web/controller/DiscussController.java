package com.oneworld.web.controller;

import com.oneworld.web.service.DiscussService;
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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by Master ZQ on 2017/3/3.
 */
@Controller
public class DiscussController {
    @Autowired
    private DiscussService discussService;

    @RequestMapping("discuss-list.html")
    public ModelAndView discussList(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/manage/discuss/discuss-list");
        return modelAndView;
    }

    @RequestMapping("discuss-list.json")
    @ResponseBody
    public void discussPage(HttpServletResponse response,
                            HttpSession session,
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
            returnMap = discussService.getDiscussPage(requestMap);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

}
