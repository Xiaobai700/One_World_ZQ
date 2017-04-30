package com.oneworld.web.websocket;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.oneworld.web.model.Message;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.MessageService;
import com.oneworld.web.service.UserInfoService;
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
            /**然后再查看数据库是否存在未读的消息，如果有就发送过去*/
            Map requestMap = new HashMap();
            requestMap.put("receiver",account);
            requestMap.put("isRead",0);
            List<Message> messages =(List<Message>) messageService.getMessage(requestMap).get("data");
            Map returnMap = new HashMap();
            returnMap.put("message",messages);
            returnMap.put("messageSize",messages.size());
            sendOne(session,returnMap);
            /*for (Message m:messages) {
                sendOne(session,gson.toJson(m));
            }*/
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
//    接收到的msg数据是被关注用户的账号
            String account = msg.split(",")[0];
            Integer type =Integer.parseInt(msg.split(",")[1]);
            Session to_sesstion = this.messmapsession.get(account);
            Map requestMap = new HashMap();
            requestMap.put("type",type);
            requestMap.put("sender",this.account);
            requestMap.put("receiver",account);
            String content = "";
            /*在这里对情况进行区分 1是关注  2是加入活动  3.是 是否同意加入活动  4.点赞等*/
            switch (type){
                case 1:
                    content = "<a>"+userInfo.getNickName()+"</a>关注了你！";
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    break;
            }
            requestMap.put("content","<a>"+userInfo.getNickName()+"</a>关注了你！");
            requestMap.put("content",content);
            if(to_sesstion != null){
                /**对方在线
                 * 在线的时候做两件事
                 * 1.把消息发送过去
                 * 2.把消息存进数据库*/
                messageService.sendMessage(requestMap);

                Message message = new Message();
                message.setContent("<a>"+userInfo.getNickName()+"</a>关注了你！");
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
    public void broadcast(Map<String, Session> mapsession, String msg) {
        for (Map.Entry<String, Session> entry : mapsession.entrySet()) {
            Session session=entry.getValue();
            try {
                    session.getBasicRemote().sendText(msg);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
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
