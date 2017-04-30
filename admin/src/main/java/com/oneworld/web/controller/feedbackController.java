package com.oneworld.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Master ZQ on 2017/3/11.
 */
@Controller
public class feedbackController {
    @RequestMapping("feedback-list.html")
    public ModelAndView feedbackList(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/manage/feedback/feedback-list");
        return modelAndView;
    }
}
