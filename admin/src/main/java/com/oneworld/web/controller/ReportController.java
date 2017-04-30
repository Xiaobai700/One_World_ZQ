package com.oneworld.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Master ZQ on 2017/3/11.
 */
@Controller
public class ReportController {
    @RequestMapping("report-list.html")
    public ModelAndView reportList(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/manage/report/report-list");
        return modelAndView;
    }
}
