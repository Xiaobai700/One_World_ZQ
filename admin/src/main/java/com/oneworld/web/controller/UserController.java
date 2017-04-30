package com.oneworld.web.controller;

import com.oneworld.web.service.UserService;
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
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("user-list.html")
    public ModelAndView userList(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/manage/user/user-list");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "user-list.json")
    public void userListDo(
            HttpServletResponse response,
            HttpSession session,
            @RequestParam String aoData
    ) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try {
            Map requestMap = DateTableUtil.getDateTableRequestDate(aoData);
            returnMap = userService.getUserPage(requestMap);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
