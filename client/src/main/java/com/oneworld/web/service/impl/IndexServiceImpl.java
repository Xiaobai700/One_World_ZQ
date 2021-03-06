package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.*;
import com.oneworld.web.model.*;
import com.oneworld.web.service.*;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Service
public class IndexServiceImpl implements IndexService{
@Autowired
private AppointService appointService;

@Autowired
private DiscussService discussService;

@Autowired
private UserInfoService userInfoService;

@Autowired
private AnswerService answerService;

@Autowired
private CommentMapper commentMapper;

@Autowired
private JoinService joinService;

@Autowired
private AppointmentMapper appointmentMapper;

@Autowired
private JoinMapper joinMapper;

@Autowired
private DiscussMapper discussMapper;

@Autowired
private AnswerMapper answerMapper;

@Autowired
private ShareMapper shareMapper;

@Autowired
private UserinfoMapper userinfoMapper;

@Autowired
private AppTypeService appTypeService;

@Autowired
private AppTypeMapper appTypeMapper;

@Autowired
private IndustryMapper industryMapper;

@Autowired
private AttentionService attentionService;
/**首页*/
    public Map indexAll(Map map) {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        Map returnMap = new HashMap();
        Map retMap = new HashMap();
        try{
            List<Appointment> appointments = (List<Appointment>) appointService.newestAppointment().get("data");
            List<Discuss> discusses =(List<Discuss>) discussService.hotDiscuess().get("data");
            List<UserInfo> hot1Users = userinfoMapper.hotUserL1();
            List<UserInfo> hot2Users = userinfoMapper.hotUserL2();

            Map<String,List> appResultMap = new HashMap<String,List>();
            List<Map<String,Object>> apps = new ArrayList<Map<String, Object>>();

            Map<String,Object> discussResultMap = new HashMap<String,Object>();
            List<Map<String,Object>> discuss = new ArrayList<Map<String, Object>>();

            Map<String,List> hotUser1ResultMap = new HashedMap();
            String myAccount = (String) map.get("join_account");
            List<Map<String,Object>> hot1UserList = new ArrayList<Map<String, Object>>();
            for (UserInfo userInfo:hot1Users) {
                Map userMap = new HashMap();
                boolean isCare = attentionService.isCare(myAccount,userInfo.getAccount());
                userMap.put("userInfo",userInfo);
                userMap.put("isCare",isCare);
                hot1UserList.add(userMap);
            }
            hotUser1ResultMap.put("hot1",hot1UserList);

            Map<String,List> hotUser2ResultMap = new HashedMap();
            List<Map<String,Object>> hot2UserList = new ArrayList<Map<String, Object>>();
            for (UserInfo userInfo:hot2Users) {
                Map user2Map = new HashMap();
                boolean isCare = attentionService.isCare(myAccount,userInfo.getAccount());
                user2Map.put("isCare",isCare);
                user2Map.put("userInfo",userInfo);
                hot2UserList.add(user2Map);
            }
            hotUser2ResultMap.put("hot2",hot2UserList);

            for (Appointment app:appointments) {
                Map<String,Object> appResult = new HashedMap();
//                发布此活动的用户的信息
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(app.getOrganizer_account()).get("data");
//                有可能还会有活动的主题信息
                appResult.put("orgnizerInfo",userInfo);
                appResult.put("appointment",app);
                appResult.put("time",fmt.format(app.getPublish_time()));
                apps.add(appResult);
            }
            appResultMap.put("app",apps);

//            获取讨论相关result实体,放入list,list放入retMap
            for (Discuss d : discusses) {
                Map<String,Object> disResult = new HashedMap();
//                找出回答了这个问题的前六个用户的信息
                List<UserInfo> userInfos = (List<UserInfo>) answerService.getUserInfosByDiscuss_id(d.getId()).get("data");
                List heads = new ArrayList();
                if(userInfos != null){
//              取出头像
                    for (UserInfo u : userInfos) {
                        String head = u.getHead();
                        heads.add(head);
                    }
                }
                disResult.put("discuss",d);
                disResult.put("heads",heads);
                discuss.add(disResult);
            }
            discussResultMap.put("dis",discuss);

            retMap.put("appResult",appResultMap);
            retMap.put("disResult",discussResultMap);
            retMap.put("hot1User",hotUser1ResultMap);
            retMap.put("hot2User",hotUser2ResultMap);

            returnMap.put(ParameterConstant.RETURN_DATA,retMap);

        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
/**所有约伴 按时间排序*/
    public Map yuebanAll(Map map) {
       Map returnMap = new HashMap();
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
       try{
           String user_account = (String) map.get("user_account");
//           List<Appointment> appointments = (List<Appointment>) appointService.findAllAppointment().get("data");
            List<Appointment> appointments = appointmentMapper.queryAppsPage(map);
           Map<String,Object> appResultMap = new HashMap<String,Object>();
           List<Map<String,Object>> apps = new ArrayList<Map<String, Object>>();
           for (Appointment appointment : appointments) {
               Map<String,Object> appResult = new HashedMap();
//                发布此活动的用户的信息
               UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(appointment.getOrganizer_account()).get("data");
//                有可能还会有活动的主题信息

//               判断当前登陆的用户是否已经申请加入此活动
               boolean isJoin = false;
//               先判断用户是否登陆
               if(user_account != null){
                   isJoin = joinService.isJoined(user_account,appointment.getId());
               }
               appResult.put("isJoin",isJoin);
               appResult.put("orgnizerInfo",userInfo);
               appResult.put("appointment",appointment);
               appResult.put("time",fmt.format(appointment.getPublish_time()));
               apps.add(appResult);
           }
//           所有活动类型
           List<AppType> appTypes = appTypeMapper.queryAllAppType();
           appResultMap.put("appTypes",appTypes);
           appResultMap.put("app",apps);
           appResultMap.put("appSize",appointments.size());
           returnMap.put(ParameterConstant.RETURN_DATA,appResultMap);
       }catch (Exception e){
           e.printStackTrace();
       }
       return returnMap;
    }
/**根据想要加入的人数倒序排列*/
    public Map allYueban(Map map) {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        Map returnMap = new HashMap();
        try{
            String user_account = (String) map.get("user_account");
            List<Appointment> appointments = (List<Appointment>) appointService.findAppointmentByWant_join().get("data");

            Map<String,Object> appResultMap = new HashMap<String,Object>();
            List<Map<String,Object>> apps = new ArrayList<Map<String, Object>>();
            for (Appointment appointment : appointments) {
                Map<String,Object> appResult = new HashedMap();
//                发布此活动的用户的信息
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(appointment.getOrganizer_account()).get("data");
//                有可能还会有活动的主题信息

                boolean isJoin = false;
//               先判断用户是否登陆
                if(user_account != null){
                    isJoin = joinService.isJoined(user_account,appointment.getId());
                }
                appResult.put("isJoin",isJoin);
                appResult.put("appSize",appointments.size());/*某种活动类型下的活动的个数*/
                appResult.put("orgnizerInfo",userInfo);
                appResult.put("appointment",appointment);
                appResult.put("time",fmt.format(appointment.getPublish_time()));
                apps.add(appResult);
            }

            List<AppType> appTypes = appTypeMapper.queryAllAppType();
            appResultMap.put("appTypes",appTypes);
            appResultMap.put("app",apps);
            appResultMap.put("appSize",appointments.size());
            returnMap.put(ParameterConstant.RETURN_DATA,appResultMap);
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }
/**根据活动的类型模糊查询*/
    public Map yueBanType(Map map) {
        Map returnMap = new HashMap();
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        try{
            String user_account = (String) map.get("user_account");
            List<Appointment> appointments = appointmentMapper.queryAppsPage(map);

            Map<String,Object> appResultMap = new HashMap<String,Object>();
            List<Map<String,Object>> apps = new ArrayList<Map<String, Object>>();
            for (Appointment a : appointments) {
                Map<String,Object> appResult = new HashedMap();
//                发布此活动的用户的信息
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(a.getOrganizer_account()).get("data");
//                有可能还会有活动的主题信息

                boolean isJoin = false;
//               先判断用户是否登陆
                if(user_account != null){
                    isJoin = joinService.isJoined(user_account,a.getId());
                }
                appResult.put("isJoin",isJoin);
                appResult.put("orgnizerInfo",userInfo);
                appResult.put("appointment",a);
                appResult.put("time",fmt.format(a.getPublish_time()));
                apps.add(appResult);
            }

            List<AppType> appTypes = appTypeMapper.queryAllAppType();
            appResultMap.put("appTypes",appTypes);
            appResultMap.put("app",apps);
            appResultMap.put("appSize",appointments.size());
            returnMap.put(ParameterConstant.RETURN_DATA,appResultMap);
        }catch (Exception e){
            e.printStackTrace();
        }
        return  returnMap;
    }
/**所有讨论活动 按时间降序排列*/
    public Map discussPageAll(Map map) {
        Map returnMap = new HashMap();
        try{
//            int pageSize =Integer.parseInt(map.get("pageSize").toString());
            map.put("pageBegin",0);
//            List<Discuss> discusses = (List<Discuss>) discussService.queryDisscussPageNew(0,pageSize).get("data");
            List<Discuss> discusses = (List<Discuss>) discussService.searchDiscuss(map).get("data");
            Map<String,Object> discussResultMap = new HashMap<String,Object>();
            List<Map<String,Object>> discuss = new ArrayList<Map<String, Object>>();

            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for (Discuss d : discusses) {
                Map<String,Object> disResult = new HashedMap();
//                获得这个讨论的作者的信息
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(d.getAsker_account()).get("data");
                String time = fmt.format(d.getAsk_time());
//                获得讨论所属的行业
                Industry industry = industryMapper.findIndustryById(d.getIndustry_id());
                disResult.put("industry",industry);
                disResult.put("time",time);
                disResult.put("discuss",d);
                disResult.put("userInfo",userInfo);
                discuss.add(disResult);
            }
            discussResultMap.put("dis",discuss);
            discussResultMap.put("discussNumbers",discusses.size());
            returnMap.put(ParameterConstant.RETURN_DATA,discussResultMap);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
/**所有讨论活动按回答次数降序排列*/
    public Map allPageDiscuss(Map map) {
        Map returnMap = new HashMap();
        try{
            int pageSize =Integer.parseInt(map.get("pageSize").toString());
            List<Discuss> discusses = (List<Discuss>) discussService.queryDiscussPageTimes(0,pageSize).get("data");

            Map<String,Object> discussResultMap = new HashMap<String,Object>();
            List<Map<String,Object>> discuss = new ArrayList<Map<String, Object>>();

            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for (Discuss d : discusses) {
                Map<String,Object> disResult = new HashedMap();
//                获得这个讨论的作者的信息
                UserInfo userInfo = (UserInfo) userInfoService.findUserInfoByAccount(d.getAsker_account()).get("data");
                String time = fmt.format(d.getAsk_time());

                Industry industry = industryMapper.findIndustryById(d.getIndustry_id());
                disResult.put("industry",industry);
                disResult.put("time",time);
                disResult.put("discuss",d);
                disResult.put("userInfo",userInfo);
                discuss.add(disResult);
            }
            discussResultMap.put("dis",discuss);
            returnMap.put(ParameterConstant.RETURN_DATA,discussResultMap);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
/**所有分享 按时间降序*/
    public Map shareAll(Map map) {
        Map returnMap = new HashMap();
        try{
            List<Share> shares = shareMapper.querySharePage(map);
            Map<String,Object> shareRsultMap = new HashedMap();
            List<Map<String,Object>> share = new ArrayList<Map<String, Object>>();

            for (Share share1 : shares) {
                Map shareResult = new HashMap();
//                获得分享发布者的信息
                UserInfo sharerUser = (UserInfo) userInfoService.findUserInfoByAccount(share1.getSharer_account()).get("data");
                Map requestMap = new HashMap();
                requestMap.put("target_id",share1.getId());
                requestMap.put("label",3);
                List<Comment> comments = commentMapper.queryCommentsByTargetIdAndLabel(requestMap);
                List<Map<String,Object>> comment = new ArrayList<Map<String, Object>>();
                for (Comment com: comments) {
                    Map comResult = new HashMap();
                    UserInfo comUser = userinfoMapper.findUserInfoByAccount(com.getCommenter_account());
                    comResult.put("com",com);//每一条评论
                    comResult.put("comUser",comUser);
                    comment.add(comResult);
                }
                shareResult.put("comment",comment);
                shareResult.put("share",share1);
                shareResult.put("shareUser",sharerUser);
                share.add(shareResult);
            }
            shareRsultMap.put("share",share);
            shareRsultMap.put("shareNumbers",shares.size());
            returnMap.put(ParameterConstant.RETURN_DATA,shareRsultMap);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
/**所有分享 按点赞数降序*/
    public Map allShare(Map map) {
        Map returnMap = new HashMap();
        try{
            List<Share> shares = shareMapper.queryAllByLike();
            Map<String,Object> shareRsultMap = new HashedMap();
            List<Map<String,Object>> share = new ArrayList<Map<String, Object>>();

            for (Share share1 : shares) {
                Map shareResult = new HashMap();
//                获得分享发布者的信息
                UserInfo sharerUser = (UserInfo) userInfoService.findUserInfoByAccount(share1.getSharer_account()).get("data");
                Map requestMap = new HashMap();
                requestMap.put("target_id",share1.getId());
                requestMap.put("label",3);
                List<Comment> comments = commentMapper.queryCommentsByTargetIdAndLabel(requestMap);
                List<UserInfo> comUsers = new ArrayList<UserInfo>();
                List<Comment> commentList = new ArrayList<Comment>();
                for (Comment com: comments) {
                    UserInfo comUser = userinfoMapper.findUserInfoByAccount(com.getCommenter_account());
                    comUsers.add(comUser);
                    commentList.add(com);
                }
                shareResult.put("share",share1);
                shareResult.put("comment",commentList);
                shareResult.put("comuser",comUsers);
                shareResult.put("shareUser",sharerUser);
                share.add(shareResult);
            }
            shareRsultMap.put("share",share);
            returnMap.put(ParameterConstant.RETURN_DATA,shareRsultMap);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
/**用户的个人中心*/
    public Map userSpace(Map map) {
        Map returnMap = new HashedMap();
        Map retMap = new HashedMap();
        try{
            String account = map.get("account").toString();
            UserInfo userInfoResult = userinfoMapper.findUserInfoByAccount(account);

            //该用户所在的行业
            Industry industry = industryMapper.findIndustryById(userInfoResult.getJob());

            List<Map<String,Object>> apps = new ArrayList<Map<String, Object>>();
            Map<String,Object> appResult = new HashedMap();

            Map<String,Object> discussMeResult = new HashedMap();

            List<Map<String,Object>> dises = new ArrayList<Map<String, Object>>();
            Map<String,Object> discussAnswerResult = new HashedMap();

            Map<String,Object> shareResult = new HashedMap();
            /*转变日期格式*/
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            if(userInfoResult != null){
//                发起的活动
                List<Appointment> appointments = appointmentMapper.findAppointmentByUserAccount(account);
                for (Appointment a:appointments) {
                    Map<String,Object> appMe = new HashedMap();
//显示所有想要加入的信息 在显示在页面上的时候 再进行判断 如果已经成功加入 就再做标记
//                    Map requestMap = new HashMap();
//                    requestMap.put("appointment_id",a.getId());
                    /*List<Join> joins = joinMapper.queryJoinsByMap(requestMap);
                    int count = joins.size();*/
                    appMe.put("appointment",a);
                    appMe.put("meTime",fmt.format(a.getPublish_time()));
//                    appMe.put("want_join_count",count);
                    apps.add(appMe);
                }

//                参与的活动
                List<Join> joins = joinMapper.queryJoinsByJoinAccount(account);
                List<Appointment> appointmentList = new ArrayList<Appointment>();
                for (Join join:joins) {
                    Appointment appointment = appointmentMapper.findAppointmentById(join.getAppointment_id());
                    appointmentList.add(appointment);
                }
                appResult.put("appJoined",appointmentList);
                appResult.put("app",apps);
                appResult.put("appSize",appointments.size());
                appResult.put("appJoinSize",appointmentList.size());

//                发起的讨论
                List<Discuss> discusses = discussMapper.queryDiscussByUserAccount(account);
                List<Map<String,Object>> discussList = new ArrayList<Map<String,Object>>();
                for (Discuss discussMe:discusses) {
                    Map discussMeMap = new HashMap();
                    discussMeMap.put("discussMe",discussMe);
                    discussMeMap.put("meTime",fmt.format(discussMe.getAsk_time()));
                    discussList.add(discussMeMap);
                }
                discussMeResult.put("discussMe",discussList);
                discussMeResult.put("discussMeSize",discusses.size());
//                参与的讨论
                List<Answer> answers = answerMapper.findAnswersByUser_account(account);
                for (Answer a:answers) {
                    Map<String,Object> discussAnswer = new HashedMap();
                    Discuss discuss = discussMapper.findDiscussById(a.getDiscuss_id());
                    discussAnswer.put("answer",a);
                    discussAnswer.put("meTime",fmt.format(a.getAnswer_time()));
                    discussAnswer.put("discuss",discuss);
                    dises.add(discussAnswer);
                }
                discussAnswerResult.put("discussAnswer",dises);
                discussAnswerResult.put("discussAnswerSize",answers.size());
//                发布的分享
                List<Share> shares = shareMapper.findSharesByAccount(account);
                List<Map<String,Object>> sharesMe = new ArrayList<Map<String, Object>>();
                for (Share share:shares) {
                    Map shareMeMap = new HashMap();
                    shareMeMap.put("share",share);
                    shareMeMap.put("meTime",fmt.format(share.getShare_time()));
                    sharesMe.add(shareMeMap);
                }
                shareResult.put("share",sharesMe);
                shareResult.put("shareSize",shares.size());

                retMap.put("industry",industry);
                retMap.put("userInfo",userInfoResult);
                retMap.put("appResult",appResult);
                retMap.put("discussMeResult",discussMeResult);
                retMap.put("discussAnswerResult",discussAnswerResult);
                retMap.put("shareResult",shareResult);
                returnMap.put(ParameterConstant.RETURN_DATA,retMap);
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该用户不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  returnMap;
    }


}
