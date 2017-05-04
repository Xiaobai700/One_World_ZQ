package com.oneworld.web.controller;

import com.oneworld.web.service.AnswerService;
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
 * Created by Master ZQ on 2017/3/3.
 */
@Controller
public class AnswerController {
    @Autowired
    private AnswerService answerService;
/**一个问题只有在被举报的时候才可以被删除 否则后台没有删除回答的权限*/
    @RequestMapping("deleteAnswer.action")
    @ResponseBody
    public void deleteAnswer(HttpServletResponse response, HttpServletRequest request,
                             String id) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
//            returnMap = answerService.deleteAnswer(id);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
