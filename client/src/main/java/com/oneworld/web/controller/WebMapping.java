package com.oneworld.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Controller
public class WebMapping {
    @RequestMapping("welcome.do")
    public ModelAndView welcome(){
        ModelAndView modelAndView = new ModelAndView("/client/welcome");
        return modelAndView;
    }

    @RequestMapping("websocketDemo.do")
    public ModelAndView websocketDemo(){
        ModelAndView modelAndView = new ModelAndView("/client/testWS");
        return modelAndView;
    }

    @RequestMapping(value = "/static/ueditor/jsp/controller")
    public String ueditor(){
        return "static/ueditor/jsp/controller";
    }
}
