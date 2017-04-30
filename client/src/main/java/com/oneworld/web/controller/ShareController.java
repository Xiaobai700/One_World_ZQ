package com.oneworld.web.controller;

import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.model.Share;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.IndexService;
import com.oneworld.web.service.ShareService;
import com.oneworld.web.service.UserInfoService;
import com.oneworld.web.util.ImgUtil;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by Master ZQ on 2017/3/6.
 */
@Controller
public class ShareController {
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private IndexService indexService;

    @Autowired
    private ShareService shareService;

    @RequestMapping("allShares.do")
    public ModelAndView allShares(HttpServletRequest request, HttpServletResponse response)throws IOException {
        ModelAndView modelAndView = new ModelAndView("/client/share/allShares");
        Map returnMap = new HashMap();
        try{
            String user_account = (String) request.getSession().getAttribute("account");
            if(user_account == null){
                modelAndView.addObject("userHead","img/person.jpg");
            }else {
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
                modelAndView.addObject("userHead",userInfo.getHead());
            }
            Map requestMap = new HashMap();
            returnMap = (Map) indexService.shareAll(requestMap).get("data");
            modelAndView.addObject("index", returnMap);
            modelAndView.addObject("color_1", "color_1");
            modelAndView.addObject("color_2", "color_2");
        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }
    @RequestMapping("allSharesLike.do")
    public ModelAndView allSharesLike(HttpServletRequest request,HttpServletResponse response)throws IOException{
        ModelAndView modelAndView = new ModelAndView("/client/share/allShares");
        Map returnMap = new HashMap();
        try{
            String user_account = (String) request.getSession().getAttribute("account");
//            UserInfo s_userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
            if(user_account == null){
                modelAndView.addObject("userHead","img/person.jpg");
            }else {
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
                modelAndView.addObject("userHead",userInfo.getHead());
            }
            Map requestMap = new HashMap();
            returnMap = (Map) indexService.allShare(requestMap).get("data");
//            modelAndView.addObject("userInfo", s_userInfo);
            modelAndView.addObject("index", returnMap);
            modelAndView.addObject("color_1", "color_2");
            modelAndView.addObject("color_2", "color_1");
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return modelAndView;
    }

    @RequestMapping("shareDetail.do")
    public ModelAndView shareDetailPage(HttpServletRequest request,HttpServletResponse response,String id){
        ModelAndView modelAndView = new ModelAndView("/client/share/shareDetail");
        String account = (String)request.getSession().getAttribute("account");
        Map returnMap = new HashMap();
        returnMap = shareService.findShareById(id);
        modelAndView.addObject("index",returnMap);
        modelAndView.addObject("account",account);
        return modelAndView;
    }

    @RequestMapping("myShare.do")
    public ModelAndView mySharePage(HttpServletRequest request,HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("/client/share/myShare");
        return modelAndView;
    }

    @RequestMapping("newShare.action")
    @ResponseBody
    public void newShare(HttpServletRequest request,HttpServletResponse response,
                         String title,String content) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            String account =(String) request.getSession().getAttribute("account");
            Share share = new Share();
            share.setId(UUID.randomUUID().toString());
            share.setLike_times(0);
            share.setShare_content(content);
            List<String> images = ImgUtil.getImageSrc(content);
            share.setShare_thumbnail(images.get(0));
            share.setShare_time(new Timestamp(new Date().getTime()));
            share.setShare_title(title);
            share.setSharer_account(account);
            returnMap = shareService.insertShare(share);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
