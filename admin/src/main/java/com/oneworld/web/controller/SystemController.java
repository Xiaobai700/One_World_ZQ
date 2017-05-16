package com.oneworld.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Master ZQ on 2017/3/11.
 */
@Controller
public class SystemController {
    @RequestMapping("version-list.html")
    public ModelAndView versionList(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/manage/system/version-list");
        return modelAndView;
    }
    @RequestMapping("data-show.html")
    public ModelAndView dataShow(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("/manage/system/dataShow");
        return modelAndView;
    }
    @RequestMapping("invitation-show.html")
    public ModelAndView invitationShow(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("/manage/system/invitationShow");
        return modelAndView;
    }
    @RequestMapping("app-show.html")
    public ModelAndView appShow(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("/manage/system/appShow");
        return modelAndView;
    }
}
