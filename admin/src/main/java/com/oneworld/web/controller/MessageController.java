package com.oneworld.web.controller;

import com.oneworld.web.dao.AdminMapper;
import com.oneworld.web.model.Message;
import com.oneworld.web.service.MessageService;
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
import java.util.UUID;

/**
 * Created by Master ZQ on 2017/5/4.
 */
@Controller
public class MessageController {
    @Autowired
    private MessageService messageService;
    @Autowired
    private AdminMapper adminMapper;

    @RequestMapping("message-list.html")
    public ModelAndView messageListPage(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("/manage/inform/inform-list");
        return modelAndView;
    }
    @RequestMapping("add-message.html")
    public ModelAndView addMessagePage(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("/manage/inform/add-inform");
        return modelAndView;
    }
    @RequestMapping("message-list.json")
    @ResponseBody
    public void getMessageListPage(HttpServletRequest re,HttpServletResponse response,
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
            returnMap = messageService.getMessagePage(requestMap);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("send-message.action")
    @ResponseBody
    public void sendMessage(HttpServletRequest request,HttpServletResponse response,String inform) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        String adminAccount = (String) request.getSession().getAttribute("account");
        try{
            Message message = new Message();
            message.setId(UUID.randomUUID().toString());
            message.setReceiver("all");
            message.setSendTime(new Timestamp(new Date().getTime()));
            message.setContent(inform);
            message.setIsRead(0);
            message.setSender(adminAccount);
            message.setType(0);/*0:系统消息*/
            returnMap = messageService.insertMessage(message);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("delete-message.action")
    @ResponseBody
    public void deleteMessage(HttpServletRequest request,HttpServletResponse response,String id) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            returnMap = messageService.deleteMessage(id);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
