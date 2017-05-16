package com.oneworld.web.controller;

import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.IndustryMapper;
import com.oneworld.web.model.Discuss;
import com.oneworld.web.model.Industry;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.DiscussService;
import com.oneworld.web.service.IndexService;
import com.oneworld.web.service.UserInfoService;
import org.apache.commons.collections.map.HashedMap;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/6.
 */
@Controller
public class DiscussController {
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private DiscussService discussService;

    @Autowired
    private IndexService indexService;

    @Autowired
    private IndustryMapper industryMapper;

    //分页获取讨论信息,按回答的次数降序排列
    @RequestMapping("discussPageTimes.do")
    public ModelAndView disscussPageTimes(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/client/discuss/alltalks");
        Map returnMap = new HashMap();
        try{
            List<Discuss> all =(List<Discuss>) discussService.queryAllDiscuss().get("data");

            String user_account = (String) request.getSession().getAttribute("account");
//            UserInfo s_userInfo =(UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
            if(user_account == null){
                modelAndView.addObject("userHead","person.jpg");
            }else {
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
                modelAndView.addObject("userHead",userInfo.getHead());
            }
            Map requestMap = new HashMap();
            requestMap.put("pageSize",10);
            returnMap =(Map) indexService.allPageDiscuss(requestMap).get("data");

//            modelAndView.addObject("userInfo", s_userInfo);
            modelAndView.addObject("color_1", "badge");
            modelAndView.addObject("color_2", "badge badge-primary");
            modelAndView.addObject("index",returnMap);
            modelAndView.addObject("account",user_account);
            int count = all.size();
            int pages = 0;
            if(count % 10 == 0){
                pages = count / 10;
            }else{
                pages = count / 10 + 1;
            }
            modelAndView.addObject("pages",pages);

        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }
    /*@RequestMapping("page.do")
    @ResponseBody
    public void page(HttpServletRequest request, HttpServletResponse response, String page)throws IOException {
        int beginPage = (Integer.parseInt(page.trim())-1)*10;
        System.err.println(beginPage);
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> returnMap= null;
        List<Discuss> discusses = (List<Discuss>) discussService.queryDiscussPageTimes(beginPage, 10).get("data");
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Discuss discuss : discusses) {
            returnMap = new HashMap<String, Object>();
            UserInfo userInfo =(UserInfo) userInfoService.findUserInfoByAccount(discuss.getAsker_account()).get("data");
            returnMap.put("title", discuss.getDiscuss_title());
            returnMap.put("times", discuss.getAnswer_times());
            returnMap.put("time", fmt.format(discuss.getAsk_time()));
            returnMap.put("head", userInfo.getHead());
            list.add(returnMap);
        }
		*//*response.getWriter().print(JSON.toJSONString(list));
		System.err.println("控制层输出"+JSON.toJSONString(list));*//*
    }*/

    //分页获取讨论信息,按时间降序排列
    @RequestMapping("discussPageNew.do")
    public ModelAndView discussPageNew(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/client/discuss/alltalks");
        Map returnMap = new HashMap();
        try{
            List<Discuss> all =(List<Discuss>) discussService.queryAllDiscuss().get("data");

            String user_account = (String) request.getSession().getAttribute("account");
            if(user_account == null){
                modelAndView.addObject("userHead","img/person.jpg");
            }else {
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
                modelAndView.addObject("userHead",userInfo.getHead());
            }
//            UserInfo s_userInfo =(UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
            Map requestMap = new HashMap();
            requestMap.put("pageSize",10);
            returnMap = (Map)indexService.discussPageAll(requestMap).get("data");

//            modelAndView.addObject("userInfo", s_userInfo);
            modelAndView.addObject("account",user_account);
            modelAndView.addObject("color_1", "badge badge-primary");
            modelAndView.addObject("color_2", "badge");
            modelAndView.addObject("index",returnMap);
            int count = all.size();
            int pages = 0;
            if(count % 10 == 0){
                pages = count / 10;
            }else{
                pages = count / 10 + 1;
            }
            modelAndView.addObject("pages",pages);

        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }
    @RequestMapping("page.do")
    @ResponseBody
    public void page(HttpServletRequest request,HttpServletResponse response,String page,String keys)throws IOException{
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap1 = new HashMap();

        int beginPage = (Integer.parseInt(page.trim())-1)*10;
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> returnMap= null;
        Map requestMap = new HashMap();
        requestMap.put("pageBegin",beginPage);
        requestMap.put("pageSize",10);
        requestMap.put("keys",keys);
//        List<Discuss> discusses =(List<Discuss>) discussService.queryDisscussPageNew(beginPage, 10).get("data");
        List<Discuss> discusses = (List<Discuss>) discussService.searchDiscuss(requestMap).get("data");
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Discuss discuss : discusses) {
            returnMap = new HashMap<String, Object>();
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(discuss.getAsker_account()).get("data");
            Industry industry = industryMapper.findIndustryById(discuss.getIndustry_id());
            returnMap.put("industryName",industry.getIndustry_name());
            returnMap.put("title", discuss.getDiscuss_title());
            returnMap.put("id",discuss.getId());
            returnMap.put("describe",discuss.getQuestion_describe());
            returnMap.put("times", discuss.getAnswer_times());
            returnMap.put("time", fmt.format(discuss.getAsk_time()));
            returnMap.put("head", userInfo.getHead());
            returnMap.put("nickName",userInfo.getNickName());
            returnMap.put("account",userInfo.getAccount());

            list.add(returnMap);
        }

        outWriter.write(mapper.writeValueAsString(list));
    }

    @RequestMapping("add-discuss.html")
    public ModelAndView addDiscussPage(HttpServletRequest request,
                                       HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("/client/discuss/newDiscuss");
        String account = (String) request.getSession().getAttribute("account");
        if(account == null){
            modelAndView.addObject("userHead","img/person.jpg");
        }else {
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(account).get("data");
            modelAndView.addObject("userHead",userInfo.getHead());
        }
        List<Industry> industries = industryMapper.queryAllIndustry();
        modelAndView.addObject("industries",industries);
        return  modelAndView;
    }
    @RequestMapping("discussDetail.do")
    @ResponseBody
    public ModelAndView discussDetail(HttpServletResponse response,HttpServletRequest request,String id) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashedMap();

        ModelAndView modelAndView = new ModelAndView("/client/discuss/talksDetails");
        String user_account = (String) request.getSession().getAttribute("account");
        if(user_account == null){
            modelAndView.addObject("userHead","img/person.jpg");
        }else {
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
            modelAndView.addObject("userHead",userInfo.getHead());
        }
        returnMap =(Map)discussService.discussDetail(id,user_account).get("data");
        mapper.writeValueAsString(returnMap);
        modelAndView.addObject("index",returnMap);
        modelAndView.addObject("id",id);
        return  modelAndView;
    }

    @RequestMapping("add-discuss.action")
    @ResponseBody
    public void addDiscussDo(HttpServletRequest request,
                             HttpServletResponse response,
                             String title,
                             String description,
                             String industry_id
                             )throws IOException{
        String account = request.getSession().getAttribute("account").toString();
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            Map requestMap = new HashMap();
            requestMap.put("account",account);
            requestMap.put("title",title);
            requestMap.put("description",description);
            requestMap.put("industry_id",industry_id);
            returnMap = discussService.insertDiscuss(requestMap);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

}
