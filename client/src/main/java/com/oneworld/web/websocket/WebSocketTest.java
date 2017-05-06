package com.oneworld.web.websocket;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.oneworld.web.dao.AppointmentMapper;
import com.oneworld.web.dao.DiscussMapper;
import com.oneworld.web.dao.ShareMapper;
import com.oneworld.web.model.*;
import com.oneworld.web.service.MessageService;
import com.oneworld.web.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import javax.annotation.Resource;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Master ZQ on 2017/4/26.
 */
@ServerEndpoint(value = "/hello",configurator = SpringConfigurator.class)
public class WebSocketTest {
    @Resource
    private MessageService messageService;
    @Resource
    private UserInfoService userInfoService;
    @Resource
    private AppointmentMapper appointmentMapper;
    @Resource
    private DiscussMapper discussMapper;
    @Autowired
    private ShareMapper shareMapper;

    private String account;
    private UserInfo userInfo;
    private Gson gson=new Gson();

    public static Map<String,Session> messmapsession = new HashMap<String, Session>();

    private Map<String,Session> objectSession = new HashMap<String, Session>();

   /* public WebSocketTest(){
        System.out.println("WebsocketTest..");
    }*/

    @OnOpen
    public void onopen(Session session){
        try {
            System.out.println("进来了。。。。。。websocket");
            /**当通道打开的时候 保存一些信息*/
            account = session.getQueryString();
            this.messmapsession.put(account,session);
            /*获得当前登陆者【通道】的信息*/
//            session.getBasicRemote().sendText("连接成功！系统消息...");
            userInfo =(UserInfo)userInfoService.findUserInfoByAccount(account).get("data");
            /**然后再查看数据库是否存在未读的通知类消息，如果有就发送过去*/
            Map requestMap = new HashMap();
            requestMap.put("receiver",account);
            requestMap.put("isRead",0);
            List<Message> messages =(List<Message>) messageService.allMessages(account).get("unRead");
            Map returnMap = new HashMap();

            /**查看有没有未读的系统消息 广播给用户*/
            Map systermMap = new HashMap();
            systermMap.put("isRead",0);
            systermMap.put("type",0);
            List<Message> systemMessages =(List<Message>) messageService.getMessage(systermMap).get("data");
            returnMap.put("systemMessage",systemMessages);
            returnMap.put("systemSize",systemMessages.size());
            returnMap.put("message",messages);
            returnMap.put("messageSize",messages.size());
            sendOne(session,returnMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @OnClose
    public void onclose(Session session){
        messmapsession.remove(this);
        System.out.println(this.account+"退出了");
    }
//    @OnMessage注解负责接收前端发送的消息
    @OnMessage
    public void onsend(Session session,String msg){
        try {
            String objectUserAccount = msg.split(",")[0];
            Integer type =Integer.parseInt(msg.split(",")[1]);
            Session to_sesstion = this.messmapsession.get(objectUserAccount);
            Map requestMap = new HashMap();
            /*type 0是系统消息 1是通知消息*/
            requestMap.put("type",1);
            requestMap.put("sender",this.account);
            requestMap.put("receiver",objectUserAccount);
            String content = "";
            /*在这里对情况进行区分 1是关注  2是申请加入活动  3.是否同意加入活动  4.点赞 5.评论 6.举报 7.回复等*/
            switch (type){
                case 1:
                    content = "<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>关注了你！";
                    break;
                case 2:
                    String id = msg.split(",")[2];
                    Appointment app = appointmentMapper.findAppointmentById(id);
                    content = "<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>申请加入你发布主题为<a href=appDetails.do?id="+id+">"+app.getTheme()+"</a>的活动！";
                    break;
                case 3:
                    Integer agreeOrNot = Integer.parseInt(msg.split(",")[2]);
                    String appId = msg.split(",")[3];
                    Appointment appointmentJoin = appointmentMapper.findAppointmentById(appId);
                    switch (agreeOrNot){
                        case 0:
                            content ="<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"拒绝了你加入主题为<a href=appDetails.do?id="+appId+">"+appointmentJoin.getTheme()+"<a/>活动的申请</a>";
                            break;
                        case 1:
                            content ="<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"同意了你加入主题为<a href=appDetails.do?id="+appId+">"+appointmentJoin.getTheme()+"<a/>活动的申请</a>";
                            break;
                    }
                    break;
                case 4:
                    /*对回答的点赞1 对分享的点赞2*/
                    Integer likeType = Integer.parseInt(msg.split(",")[3]);
                    String targetLikeId = msg.split(",")[2];
                    switch (likeType){
                        case 1:
                            Discuss d = discussMapper.findDiscussById(targetLikeId);
                            content ="<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>赞了你对<a href=discussDetail.do?id="+targetLikeId+">"+d.getDiscuss_title()+"</a>问题的回答</a>";
                            break;
                        case 2:
                            Share share = shareMapper.findShareById(targetLikeId);
                            content ="<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>赞了你标题为<a href=shareDetail.do?id="+targetLikeId+">"+share.getShare_title()+"</a>的分享</a>";
                            break;
                    }
                    break;
                case 5:
                    String invitaionId = msg.split(",")[3];
                    Integer label = Integer.parseInt(msg.split(",")[2]);
                    Discuss discuss = discussMapper.findDiscussById(invitaionId);
                    switch (label){
                        /*对问题回答的评论*/
                        case 1:
                            content ="<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"评论了你对<a href=discussDetail.do?id="+invitaionId+">"+discuss.getDiscuss_title()+"</a>问题的回答</a>";
                            break;
                        /*对约伴活动的评论*/
                        case 2:
                            Appointment appointment = appointmentMapper.findAppointmentById(invitaionId);
                            content ="<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>评论了你发布的主题为<a href=appDetails.do?id="+invitaionId+">"+appointment.getTheme()+"</a>的活动";
                            break;
                        /*对分享的评论*/
                        case 3:
                            Share share = shareMapper.findShareById(invitaionId);
                            content = "<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>评论了你标题为<a href=shareDetail.do?id="+invitaionId+">"+share.getShare_title()+"</a>的分享";
                            break;
                        /*对讨论的回答*/
                        case 4:
                            Discuss discuss1 = discussMapper.findDiscussById(invitaionId);
                            content = "<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>回答了你标题为<a href=discussDetail.do?id="+invitaionId+">"+discuss1.getDiscuss_title()+"</a>的问题";
                            break;
                    }
                    break;
                case 6:
                    Integer reportType = Integer.parseInt(msg.split(",")[3]);
                    String targetId = msg.split(",")[2];
                    switch (reportType){
                        case 1:/*对问题的回答的举报*/
                            Discuss discuss2 = discussMapper.findDiscussById(targetId);
                            content = "您对<a discussDetail.do?id="+targetId+">"+discuss2.getDiscuss_title()+"</a>问题的回答被举报";
                            break;
                        case 2:/*对用户的举报*/
                            content = "您被其他用户举报！";
                            break;
                    }
                    break;
                case 7:
                    Integer replyType = Integer.parseInt(msg.split(",")[2]);
                    String commentId = msg.split(",")[3];
                    String parentId = msg.split(",")[4];
                    switch (replyType){
                        case 1:/*对回答评论的回复*/
                            Discuss discuss1 = discussMapper.findDiscussById(parentId);
                            content = "<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>回复了您对<a href=discussDetail.do?id="+parentId+">"+discuss1.getDiscuss_title()+"</a>的回答的评论";
                            break;
                        case 3:/*对约伴评论的回复*/
                            Appointment appointment = appointmentMapper.findAppointmentById(parentId);
                            content ="<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>回复了您对主题为<a href=appDetails.do?id="+parentId+">"+appointment.getTheme()+"</a>活动的评论";
                            break;
                        case 2:/*对分享评论的回复*/
                            Share share = shareMapper.findShareById(parentId);
                            content = "<a href=personal.do?account="+this.account+">"+userInfo.getNickName()+"</a>回复了您对标题为<a href=shareDetail.do?id="+parentId+">"+share.getShare_title()+"</a>分享的评论";
                            break;
                    }
                    break;
            }
            requestMap.put("content",content);
            if(to_sesstion != null){
                /**对方在线
                 * 在线的时候做两件事
                 * 1.把消息发送过去
                 * 2.把消息存进数据库*/
                messageService.sendMessage(requestMap);

                Message message = new Message();
                message.setContent(content);
                message.setSendTime(new Timestamp(new Date().getTime()));

                Map returnMap = new HashMap();
                returnMap.put("message",message);
                sendOne(to_sesstion,returnMap);

//                sendOne(to_sesstion,gson.toJson(message));

            }else {
                /**对方不在线
                 * 不在线只做一件事
                 * 把消息存进数据库
                 * 然后广播的时候再取出来看*/
                messageService.sendMessage(requestMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*广播*/
    public void broadcast(Map<String, Session> mapsession, Map map) {
        for (Map.Entry<String, Session> entry : mapsession.entrySet()) {
            Session session=entry.getValue();
            sendOne(session,map);
        }
    }

    public void sendOne(Session session,Map map){
        try {
            ObjectMapper mapper = new ObjectMapper();
           /*转变日期格式*/
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mapper.setDateFormat(fmt);
            session.getBasicRemote().sendText(mapper.writeValueAsString(map));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
