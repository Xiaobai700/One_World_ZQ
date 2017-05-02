package com.oneworld.web.controller;

import com.oneworld.web.service.LikeService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/2.
 */
@Controller
public class LikeController {
    @Autowired
    private LikeService likeService;

    @RequestMapping("likeInvitation.action")
    @ResponseBody
    public void likeInvitation(HttpServletRequest request, HttpServletResponse response,
                               String invitationId,String type) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            String account = (String) request.getSession().getAttribute("account");
            Map requestMap = new HashMap();
            requestMap.put("invitationId",invitationId);
            requestMap.put("type",Integer.parseInt(type));
            requestMap.put("likerAccount",account);
            returnMap = likeService.likeInvitation(requestMap);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
