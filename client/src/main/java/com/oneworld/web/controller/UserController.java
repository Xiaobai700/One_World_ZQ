package com.oneworld.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oneworld.web.dao.IndustryMapper;
import com.oneworld.web.model.Attention;
import com.oneworld.web.model.IPTimeStamp;
import com.oneworld.web.model.Industry;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.AttentionService;
import com.oneworld.web.service.IndexService;
import com.oneworld.web.service.UserInfoService;
import com.oneworld.web.service.UserService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private IndexService indexService;

    @Autowired
    private AttentionService attentionService;

    @Autowired
    private IndustryMapper industryMapper;

    @RequestMapping("userLogin.action")
    @ResponseBody
    public void userLogin(HttpServletRequest request, HttpServletResponse response,
                          String account, String password)throws IOException{
        PrintWriter outWriter= response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        returnMap = userService.userLogin(account,password);
        if(returnMap.get("code").equals(1)){
            request.getSession().setAttribute("account", account);
            request.getSession().setAttribute("password", password);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }else {
            outWriter.write(mapper.writeValueAsString(returnMap));
        }

    }

    @RequestMapping("loginOut.action")
    public ModelAndView userLoginOut(HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        return new ModelAndView("/client/login");
    }

    @RequestMapping("userRegist.action")
    @ResponseBody
    public void userRegist(HttpServletRequest request,HttpServletResponse response,
    String account,String password) throws IOException{
        PrintWriter outWriter= response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        returnMap = userService.userRegist(account,password);
        if(returnMap.get("code").equals(2)){
            request.getSession().setAttribute("account", account);
            request.getSession().setAttribute("password", password);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }else {
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("mySpace.do")
    public ModelAndView mySpace(HttpServletRequest request){
        String account =(String ) request.getSession().getAttribute("account");
        Map returnMap = new HashedMap();
        if(account == null){
            ModelAndView modelAndView = new ModelAndView("/client/welcome");
            return modelAndView;
        }else {
            ModelAndView modelAndView = new ModelAndView("/client/user/mySpace");
            Map requestMap = new HashedMap();
            requestMap.put("account",account);
            returnMap = (Map) indexService.userSpace(requestMap).get("data");
            List<Industry> industries = industryMapper.queryAllIndustry();
            modelAndView.addObject("index",returnMap);
            modelAndView.addObject("industries",industries);
            return modelAndView;
        }
    }
    @RequestMapping("uploadHead.action")
    public String uploadHead(HttpServletRequest request,@RequestParam("file") MultipartFile file)
            throws IOException{
        String account =(String) request.getSession().getAttribute("account");
        UserInfo userInfo =(UserInfo)userInfoService.findUserInfoByAccount(account).get("data");
        if(!file.isEmpty()){
            IPTimeStamp ipTimeStamp = new IPTimeStamp(file.getOriginalFilename());
            String fileName ="";
            fileName=ipTimeStamp.getIPTimeRand();
            System.out.println(request.getSession().getServletContext().getRealPath("/"));
            file.transferTo(new File(request.getSession().getServletContext().getRealPath("/")+"/head/"+fileName));
            userInfo.setHead(fileName);
        }
        userInfoService.updateUserInfo(userInfo);
        System.out.println("执行更新操作之后的userinfo"+userInfo);
        request.getSession().setAttribute("userinfo", userInfo);
        return "redirect:mySpace.do";
    }
    @RequestMapping("modifyUser.do")
    public void modifyUser(HttpServletRequest request,HttpServletResponse response,
                           String nickName,
                           String sheng,
                           String shi,
                           String hobby,
                           String signature,
                           String job,
                           String sex,
                           String birth)throws IOException{
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        org.codehaus.jackson.map.ObjectMapper mapper = new org.codehaus.jackson.map.ObjectMapper();
        Map returnMap = new HashMap();
        try{
            String user_account = (String) request.getSession().getAttribute("account");
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account).get("data");
            if(userInfo != null){
                userInfo.setNickName(nickName);
                userInfo.setLocation(sheng+" "+shi);
                userInfo.setHobby(hobby);
                userInfo.setJob(job);
                userInfo.setHead(userInfo.getHead());
                userInfo.setSignature(signature);
                userInfo.setSex(sex);
                userInfo.setBirth(birth);

                Calendar a=Calendar.getInstance();
                int year = a.get(Calendar.YEAR);
                String strsub1=null;
                //获得生日的最后四个字符，由于我的生日选择插件的格式就是最后4位是年份，若是换成别的日期选择器就另当别论
                if(birth.length()>=4){// 判断是否长度大于等于4
//                    String strsub=birth.substring(birth.length()- 4);//一个参数表示截取传递的序号之后的部分
                    strsub1=birth.substring(0,4);//截取两个数字之间的部分
                }
                int by=Integer.parseInt(strsub1);//String类型转成int类型
                int age = year - by;
                userInfo.setAge(age);
                userInfoService.updateUserInfo(userInfo);
                returnMap.put("code",0);
                returnMap.put("returnMsg","信息修改成功！");
            }else{
                returnMap.put("code",1008);
                returnMap.put("returnMsg","该用户不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        outWriter.write(mapper.writeValueAsString(returnMap));
    }

    @RequestMapping("fansOrcarer.do")
    public ModelAndView fansOrcarer(HttpServletRequest request,
                                    HttpServletResponse response,
                                    String label){
        ModelAndView modelAndView = new ModelAndView("/client/user/fansOrcarer");
        Map returnMap = new HashMap();
        String account =(String) request.getSession().getAttribute("account");
        if(account == null){
            modelAndView.addObject("userHead","person.jpg");
        }else {
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(account).get("data");
            modelAndView.addObject("userHead",userInfo.getHead());
        }
        List<UserInfo> userInfos = new ArrayList<UserInfo>();
        List<Attention> attentions = new ArrayList<Attention>();
        if(label.equals("我关注的")){
           attentions = (List<Attention>) attentionService.findAttentionsBycarer_account(account).get("data");
        }else if(label.equals("关注我的")){
            attentions = (List<Attention>) attentionService.findAttentionsByCared_account(account).get("data");
        }
        for (Attention a:attentions) {
            UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(a.getUser_account()).get("data");
            userInfos.add(userInfo);
        }
        returnMap.put("userInfo",userInfos);
        returnMap.put("label",label);
        returnMap.put("numbers",userInfos.size());
        modelAndView.addObject("index",returnMap);
        modelAndView.addObject("account",account);
        return modelAndView;
    }

    @RequestMapping("personal.do")
    public ModelAndView personPage(HttpServletRequest request,
                                   HttpServletResponse response,
                                   String account){
        ModelAndView modelAndView = new ModelAndView("/client/user/person");
        Map returnMap = new HashMap();
        Map requestMap = new HashMap();
        String myAccount =(String) request.getSession().getAttribute("account");
        //判断我是否关注了这个用户
        boolean isCare = attentionService.isCare(myAccount,account);
        requestMap.put("account",account);
        returnMap = (Map) indexService.userSpace(requestMap).get("data");
        modelAndView.addObject("index",returnMap);
        modelAndView.addObject("isCare",isCare);
        return  modelAndView;
    }

    @RequestMapping("careUser.action")
    @ResponseBody
    public void careUserDo(HttpServletResponse response,
                           HttpServletRequest request,
                           String user_account)throws IOException{
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            String account =(String)request.getSession().getAttribute("account");
            returnMap = attentionService.careUser(account,user_account);
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }
}
