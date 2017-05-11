package com.oneworld.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    @RequestMapping("login.do")
    public ModelAndView loginPage(HttpServletResponse response, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/client/login");
        return  modelAndView;
    }

    @RequestMapping("register.do")
    public ModelAndView registPage(HttpServletResponse response, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/client/register");
        return  modelAndView;
    }
}
