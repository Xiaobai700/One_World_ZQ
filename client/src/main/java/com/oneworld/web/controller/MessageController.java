package com.oneworld.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oneworld.web.dao.MessageMapper;
import com.oneworld.web.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/1.
 */
@Controller
public class MessageController {
    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private MessageService messageService;

    @RequestMapping("allMessage.do")
    public ModelAndView allMessage(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("/client/message/allMessages");
        Map returnMap = new HashMap();
        String account =(String) request.getSession().getAttribute("account");
        try {
            returnMap = messageService.allMessages(account);
            modelAndView.addObject("account",account);
            modelAndView.addObject("index",returnMap);
        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping("deleteMessage.action")
    @ResponseBody
    public void deleteMessage(HttpServletResponse response,HttpServletRequest request,String id) throws IOException {
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

    @RequestMapping("batchDeleteMessage.action")
    @ResponseBody
    public void batchDeleteMessage(HttpServletResponse response,HttpServletRequest request,String idString) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            returnMap = messageService.batchDeleteMessage(idString);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
