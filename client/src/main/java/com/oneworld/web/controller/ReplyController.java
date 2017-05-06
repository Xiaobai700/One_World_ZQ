package com.oneworld.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oneworld.web.model.Reply;
import com.oneworld.web.service.ReplyService;
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
 * Created by Master ZQ on 2017/5/3.
 */
@Controller
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    @RequestMapping("reply.action")
    @ResponseBody
    public void reply(HttpServletResponse response, HttpServletRequest request,
                      Reply reply) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try {
            String account =(String) request.getSession().getAttribute("account");
            reply.setId(UUID.randomUUID().toString());
            reply.setReplyerAccount(account);
            reply.setReplyTime(new Timestamp(new Date().getTime()));
            returnMap = replyService.replyComment(reply);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping("replyPage.do")
    public ModelAndView replyPage(HttpServletRequest request, HttpServletResponse response,
                                  String commentId,Integer replyType,String parentId){
        String account = (String) request.getSession().getAttribute("account");
        Map returnMap = new HashMap();
        Map requestMap = new HashMap();
        /**/
        requestMap.put("commentId",commentId);
        requestMap.put("replyType",replyType);

        returnMap = replyService.getReply(requestMap);
        returnMap.put("account",account);
        returnMap.put("commentId",commentId);
        returnMap.put("replyType",replyType);
        returnMap.put("parentId",parentId);

        return new ModelAndView("/client/comment/commentReplys",returnMap);
    }

}
