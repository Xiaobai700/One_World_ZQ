package com.oneworld.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.JoinMapper;
import com.oneworld.web.model.AppType;
import com.oneworld.web.model.Appointment;
import com.oneworld.web.model.Join;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.*;
import com.oneworld.web.util.ImgUtil;
import org.apache.commons.collections.map.HashedMap;
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
public class AppController {
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private AppointService appointService;

    @Autowired
    private IndexService indexService;

    @Autowired
    private JoinService joinService;

    @Autowired
    private AppTypeService appTypeService;

    @Autowired
    private JoinMapper joinMapper;

/**查询所有约伴信息 按时间排序*/
    @RequestMapping("allyueban.do")
    public ModelAndView allyueban(HttpServletRequest request, HttpServletResponse response)throws IOException {
        ModelAndView modelAndView = new ModelAndView("/client/appointment/allyueban");
        Map resultMap = new HashMap();
        String user_account = (String) request.getSession().getAttribute("account");
        if(user_account == null){
            modelAndView.addObject("userHead","img/person.jpg");
        }else {
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
            modelAndView.addObject("userHead",userInfo.getHead());
        }
        Map requestMap = new HashMap();
        requestMap.put("user_account",user_account);
        resultMap = (Map) indexService.yuebanAll(requestMap).get("data");

        modelAndView.addObject("account",user_account);
        modelAndView.addObject("color_2", "badge");
        modelAndView.addObject("color_1", "badge badge-primary");
        modelAndView.addObject("index",resultMap);
        return modelAndView;
    }

    /**查询约伴信息 按想加入的人数降序排列*/
    @RequestMapping("allyuebanLikes.do")
    public ModelAndView allyuebanLikes(HttpServletRequest request,HttpServletResponse response)throws IOException{
        ModelAndView modelAndView = new ModelAndView("/client/appointment/allyueban");
        Map resultMap = new HashMap();
        String user_account = (String) request.getSession().getAttribute("account");
        if(user_account == null){
            modelAndView.addObject("userHead","img/person.jpg");
        }else {
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
            modelAndView.addObject("userHead",userInfo.getHead());
        }
        Map requestMap = new HashMap();
        requestMap.put("user_account",user_account);
        resultMap = (Map) indexService.allYueban(requestMap).get("data");

        modelAndView.addObject("account",user_account);
        modelAndView.addObject("color_1", "badge");
        modelAndView.addObject("color_2", "badge badge-primary");
        modelAndView.addObject("index",resultMap);
        return modelAndView;
    }
    /**查询约伴活动 根据活动的类型模糊查询*/
    @RequestMapping("allYuebanType.do")
    public ModelAndView allYueBanType(HttpServletRequest request,HttpServletResponse response,int appTypeId)throws IOException{
        ModelAndView modelAndView = new ModelAndView("/client/appointment/allyueban");
        Map resultMap = new HashMap();
        String user_account =(String) request.getSession().getAttribute("account");
        if(user_account == null){
            modelAndView.addObject("userHead","img/person.jpg");
        }else {
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
            modelAndView.addObject("userHead",userInfo.getHead());
        }
        Map requestMap = new HashMap();
        requestMap.put("user_account",user_account);
        requestMap.put("app_type",appTypeId);
        resultMap = (Map) indexService.yueBanType(requestMap).get("data");

        modelAndView.addObject("account",user_account);
        modelAndView.addObject("index",resultMap);
        modelAndView.addObject("appTypeId",appTypeId);
        modelAndView.addObject("color_1", "color_1");
        modelAndView.addObject("color_2", "color_2");
        return modelAndView;
    }
    @RequestMapping("add-app.html")
    public ModelAndView addAppPage(HttpServletResponse response,
                                   HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/client/appointment/newAppointment");
        String account = (String) request.getSession().getAttribute("account");
        if(account == null){
            modelAndView.addObject("userHead","img/person.jpg");
        }else {
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(account).get("data");
            modelAndView.addObject("userHead",userInfo.getHead());
        }
        UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(account).get("data");

        /*取得所有活动类型*/
        List<AppType> appTypes = (List<AppType>) appTypeService.getAllAppType().get("data");

        modelAndView.addObject("userInfo",userInfo);
        modelAndView.addObject("appTypes",appTypes);
        modelAndView.addObject("account",account);
        return  modelAndView;
    }
    @ResponseBody
    @RequestMapping("add-app.action")
    public void addAppDo(HttpServletResponse response,
                         HttpServletRequest request,
                         String theme,
                         String content,
                         String site,
                         String begin_time,
                         String more_time,
                         String duration,
                         String sex_restrict)throws IOException{
        String account = request.getSession().getAttribute("account").toString();
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
//判断参数是否为空,或者在页面上设置
            Appointment appointment = new Appointment();
            appointment.setId(UUID.randomUUID().toString());
            appointment.setTheme(theme);
            appointment.setSex_restrict(sex_restrict);
            appointment.setIs_checked(0);
            appointment.setApp_type(0);
            appointment.setSite(site);
            appointment.setBegin_time(begin_time+" "+more_time);
            appointment.setContent(content);
            appointment.setDuration(duration);
            appointment.setPublish_time(new Timestamp(new Date().getTime()));
            appointment.setOrganizer_account(account);
            /*获取富文本中的第一张图片作为封面图*/
            List<String> imageList = ImgUtil.getImageSrc(content);
            if(imageList.size()>0){
                appointment.setThumbnail(imageList.get(0));
            }else {
                /*如果在发布活动的时候没有上传图片，给这个活动一个默认的缩略图*/
                appointment.setThumbnail("img/fx_11.jpg");
            }
            returnMap = appointService.insertAppointment(appointment);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }

    }
    @RequestMapping("joinApp.action")
    @ResponseBody
    public void addApp(HttpServletRequest request,
                       HttpServletResponse response,
                       String appointment_id)throws IOException{
        PrintWriter outWriter= response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        String user_account = (String) request.getSession().getAttribute("account");
        if(user_account == null){
            returnMap.put(ParameterConstant.RETURN_MSG,"你还未登陆，不可进行此操作！");
        }else {
            Join join = new Join();
            join.setId(UUID.randomUUID().toString());
            join.setAppointment_id(appointment_id);
            join.setJoin_account(user_account);//登陆者的账号
            join.setJoin_or_not(0);/*是否成功加入*/
            join.setWant_join_time(new Timestamp(new Date().getTime()));
            returnMap = joinService.insertJoin(join);
        }

        outWriter.write(mapper.writeValueAsString(returnMap));
    }

    @RequestMapping("appDetails.do")
    public ModelAndView appDetails(HttpServletRequest request,String id){
        ModelAndView modelAndView = new ModelAndView("/client/appointment/findDetail");
        Map returnMap = new HashedMap();
        String user_account =(String) request.getSession().getAttribute("account");//登陆者账号
        if(user_account == null){
            modelAndView.addObject("userHead","img/person.jpg");
        }else {
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
            modelAndView.addObject("userHead",userInfo.getHead());
        }
        boolean isJoin = joinService.isJoined(user_account,id);
        returnMap = (Map) appointService.appDetail(id).get("data");
        returnMap.put("isJoin",isJoin);
        modelAndView.addObject("index",returnMap);
        modelAndView.addObject("account",user_account);
        modelAndView.addObject("appId",id);
        return  modelAndView;
    }
    @RequestMapping("checkJoin.action")
    @ResponseBody
    public void checkJoin(HttpServletResponse response,HttpServletRequest request,String id) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            Join join = joinMapper.findJoinById(id);
            join.setJoin_or_not(1);
            join.setT_join_time(new Timestamp(new Date().getTime()));
            returnMap = joinService.updateJoin(join);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
    @RequestMapping("rejectJoin.action")
    @ResponseBody
    public void rejectJoin(HttpServletResponse response,HttpServletRequest request,String id) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            returnMap = joinService.deleteJoin(id);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }

    }
}
