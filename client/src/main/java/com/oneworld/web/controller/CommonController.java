package com.oneworld.web.controller;

import com.oneworld.web.model.Discuss;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.DiscussService;
import com.oneworld.web.service.IndexService;
import com.oneworld.web.service.UserInfoService;
import com.oneworld.web.util.FileUtil;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Master ZQ on 2017/3/6.
 */
@Controller
public class CommonController {
    @Autowired
    private IndexService indexService;
    @Autowired
    private DiscussService discussService;
    @Autowired
    private UserInfoService userInfoService;

    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
    @RequestMapping(value = "upload.action", method = RequestMethod.POST)
    @ResponseBody
    public void upload(
            HttpServletResponse response,
            HttpServletRequest request,
            @RequestParam(value = "upfile")MultipartFile file
    ) throws Exception {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try {
           FileUtil fileUtil = new FileUtil();
            returnMap = fileUtil.uploadEditor(file,"/upload/" + simpleDateFormat.format(new Date()), request);
            String callbackcontent = String.valueOf(returnMap.get("callbackcontent"));
            outWriter.write(callbackcontent);

        }catch (Exception e){
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
        return;
    }

    @RequestMapping("search.do")
    public ModelAndView searchObject(HttpServletResponse response,HttpServletRequest request,
                                     Integer searchType,String keys){
        ModelAndView modelAndView = null;
        Map returnMap = new HashMap();
        switch (searchType){
            case 1:
                modelAndView = new ModelAndView("/client/discuss/alltalks");
                Map discussMap = new HashMap();
                discussMap.put("keys",keys);
                List<Discuss> all =(List<Discuss>) discussService.searchDiscuss(discussMap).get("data");

                String user_account2 = (String) request.getSession().getAttribute("account");
                if(user_account2 == null){
                    modelAndView.addObject("userHead","img/person.jpg");
                }else {
                    UserInfo s_userInfo =(UserInfo) userInfoService.findUserInfoByAccount(user_account2).get("data");
                    modelAndView.addObject("userHead",s_userInfo.getHead());
                }
                Map requestMap2 = new HashMap();
                requestMap2.put("pageSize",10);
                requestMap2.put("keys",keys);
                returnMap = (Map)indexService.discussPageAll(requestMap2).get("data");

                modelAndView.addObject("account",user_account2);
                modelAndView.addObject("color_1", "badge badge-primary");
                modelAndView.addObject("color_2", "badge");
                modelAndView.addObject("index",returnMap);
                modelAndView.addObject("keys",keys);
                int count = all.size();
                int pages = 0;
                if(count % 10 == 0){
                    pages = count / 10;
                }else{
                    pages = count / 10 + 1;
                }
                modelAndView.addObject("pages",pages);
                break;
            case 2:
                modelAndView = new ModelAndView("/client/appointment/allyueban");
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
                requestMap.put("keys",keys);
                resultMap = (Map) indexService.yuebanAll(requestMap).get("data");

                modelAndView.addObject("account",user_account);
                modelAndView.addObject("color_1", "badge badge-primary");
                modelAndView.addObject("color_2", "badge");
                modelAndView.addObject("keys",keys);
                modelAndView.addObject("index",resultMap);
                break;
            case 3:
                modelAndView = new ModelAndView("/client/share/allShares");
                String user_account1 = (String) request.getSession().getAttribute("account");
                if(user_account1 == null){
                    modelAndView.addObject("userHead","img/person.jpg");
                }else {
                    UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(user_account1).get("data");
                    modelAndView.addObject("userHead",userInfo.getHead());
                }
                Map requestMap1 = new HashMap();
                requestMap1.put("keys",keys);
                returnMap = (Map) indexService.shareAll(requestMap1).get("data");
                modelAndView.addObject("account",user_account1);
                modelAndView.addObject("index", returnMap);
                modelAndView.addObject("color_2", "badge");
                modelAndView.addObject("color_1", "badge badge-primary");
                modelAndView.addObject("keys",keys);
                break;
            case 4:
                modelAndView = new ModelAndView("/client/user/fansOrcarer");
                Map returnMap4 = new HashMap();
                String account = (String) request.getSession().getAttribute("account");
                if(account == null){
                    modelAndView.addObject("userHead","img/person.jpg");
                }else {
                    UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(account).get("data");
                    modelAndView.addObject("userHead",userInfo.getHead());
                }
                String label = "搜索到的用户";
                Map requestMap4 = new HashMap();
                requestMap4.put("keys",keys);
                List<UserInfo> userInfos = (List<UserInfo>) userInfoService.searchUser(requestMap4).get("data");
                returnMap4.put("userInfo",userInfos);
                returnMap4.put("label",label);
                returnMap4.put("numbers",userInfos.size());
                modelAndView.addObject("index",returnMap4);
                modelAndView.addObject("keys",keys);
                break;
        }
        return modelAndView;
    }
}
