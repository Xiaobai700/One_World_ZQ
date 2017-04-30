package com.oneworld.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Master ZQ on 2017/3/10.
 */
@Controller
public class indexController {
    @RequestMapping("index.do")
    public ModelAndView index(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/manage/index");
        return modelAndView;
    }

    @RequestMapping("static.html")
    public ModelAndView staticPage(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/manage/static");
        return modelAndView;
    }
}
