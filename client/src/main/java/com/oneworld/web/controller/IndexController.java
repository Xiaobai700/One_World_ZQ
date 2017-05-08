package com.oneworld.web.controller;

import com.oneworld.web.model.Attention;
import com.oneworld.web.model.Join;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.AttentionService;
import com.oneworld.web.service.IndexService;
import com.oneworld.web.service.JoinService;
import com.oneworld.web.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Controller
public class IndexController {
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private IndexService indexService;

    @Autowired
    private JoinService joinService;

    @Autowired
    private AttentionService attentionService;

    @RequestMapping("index.do")
    public ModelAndView index(HttpServletRequest request)throws IOException{
        ModelAndView modelAndView = new ModelAndView("/client/index");
        Map resultMap = new HashMap();
        try{
//            获得登陆者的信息，这样写的原因是当用户改了头像的时候导航上现实的头像也会跟着变化不用重新登录
            String user_account = (String) request.getSession().getAttribute("account");
            if(user_account == null){
                modelAndView.addObject("userHead","img/person.jpg");
            }else {
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
                modelAndView.addObject("userHead",userInfo.getHead());
                modelAndView.addObject("account",userInfo.getAccount());
            }


            Map requestMap = new HashMap();
            requestMap.put("join_account",user_account);
            resultMap = (Map) indexService.indexAll(requestMap).get("data");

            List<Join> joins = (List<Join>) joinService.queryAllJoinsByJoin_account(user_account).get("data");

            List<Attention> attentions =(List<Attention>) attentionService.findAttentionsBycarer_account(user_account).get("data");

            modelAndView.addObject("care",attentions);
            modelAndView.addObject("joins",joins);
            modelAndView.addObject("index",resultMap);
            modelAndView.addObject("account",user_account);
        }catch (Exception e){
            e.printStackTrace();
        }

        return modelAndView;
    }
}
