package com.oneworld.web.controller;

import com.oneworld.web.model.FeedBack;
import com.oneworld.web.service.FeedBackService;
import org.apache.commons.collections.map.HashedMap;
import org.codehaus.jackson.map.ObjectMapper;
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
import java.util.Map;
import java.util.UUID;

/**
 * Created by Master ZQ on 2017/5/10.
 */
@Controller
public class FeedBackController {
    @Autowired
    private FeedBackService feedBackService;
    @RequestMapping("feedBack.html")
    public ModelAndView feedBackPage(){
        ModelAndView modelAndView =new ModelAndView("/client/feedbackPage");
        return modelAndView;
    }
    @RequestMapping("feedBack.action")
    @ResponseBody
    public void feedBack(HttpServletResponse response, HttpServletRequest request,
                         String feedBackContent) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashedMap();
        try{
            String account = (String) request.getSession().getAttribute("account");
            FeedBack feedBack = new FeedBack();
            feedBack.setId(UUID.randomUUID().toString());
            feedBack.setContent(feedBackContent);
            feedBack.setIs_delete(0);
            feedBack.setFeedback_time(new Timestamp(new Date().getTime()));
            feedBack.setIs_reply(0);
            feedBack.setUser_account(account);
            returnMap = feedBackService.insertFeedBack(feedBack);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
