package com.oneworld.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oneworld.web.model.Answer;
import com.oneworld.web.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
 * Created by Master ZQ on 2017/4/30.
 */
@Controller
public class AnswerController {
    @Autowired
    private AnswerService answerService;
    @RequestMapping("answerDiscuss.action")
    @ResponseBody
    public void answerDiscuss(HttpServletRequest request, HttpServletResponse response,
                              String discussId,String answerContent)throws IOException{
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            String account = (String) request.getSession().getAttribute("account");
            Answer answer = new Answer();
            answer.setId(UUID.randomUUID().toString());
            answer.setAgree_times(0);
            answer.setAnswer_account(account);
            answer.setAnswer_content(answerContent);
            answer.setDiscuss_id(discussId);
            answer.setAnswer_time(new Timestamp(new Date().getTime()));
            returnMap = answerService.insertAnswer(answer);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
