package com.oneworld.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oneworld.web.model.Comment;
import com.oneworld.web.service.CommentService;
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
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping("commentInvitation.action")
    @ResponseBody
    public void commentInvitation(HttpServletRequest request, HttpServletResponse response,
                                  String targetId,Integer label,String content)throws IOException{
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            String account = (String) request.getSession().getAttribute("account");
            Comment comment = new Comment();
            comment.setId(UUID.randomUUID().toString());
            comment.setComment_content(content);
            comment.setComment_time(new Timestamp(new Date().getTime()));
            comment.setCommenter_account(account);
            comment.setLabel(label);
            comment.setReply_times(0);
            comment.setTarget_id(targetId);
            returnMap = commentService.insertComment(comment);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
