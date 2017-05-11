package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.MessageMapper;
import com.oneworld.web.model.Message;
import com.oneworld.web.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Master ZQ on 2017/4/27.
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;

    public Map sendMessage(Map map) {
        Map returnMap = new HashMap();
        try {
            String sender = (String) map.get("sender");
            String receiver = (String) map.get("receiver");
            Integer type = (Integer) map.get("type");
            String content =(String) map.get("content");
            Message message = new Message();
            message.setId(UUID.randomUUID().toString());
            message.setType(type);
            message.setIsRead(0);
            message.setReceiver(receiver);
            message.setSender(sender);
            message.setSendTime(new Timestamp(new Date().getTime()));
            message.setContent(content);
            messageMapper.insertMessage(message);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"发送成功！");
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map getMessage(Map map) {
        Map returnMap = new HashMap();
        try{
            List<Message> messages = messageMapper.searchMessage(map);
            returnMap.put(ParameterConstant.RETURN_DATA,messages);
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map allMessages(String account) {
        Map returnMap = new HashMap();
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try{
//        未读消息
            Map requestMap = new HashMap();
            requestMap.put("receiver",account);
            requestMap.put("isRead",0);
            List<Message> unReadMessag= messageMapper.getMessageByMap(requestMap);
            List<Map<String,Object>> unReadResult = new ArrayList<Map<String, Object>>();
            for (Message m:unReadMessag) {
                Map unReadMessageMap = new HashMap();
                unReadMessageMap.put("message",m);
                unReadMessageMap.put("unReadTime",fmt.format(m.getSendTime()));
                unReadResult.add(unReadMessageMap);
            }
//        已读消息
            Map requestMap1 = new HashMap();
            requestMap1.put("receiver",account);
            requestMap1.put("isRead",1);
            List<Message> readMessages =messageMapper.getMessageByMap(requestMap1);
            List<Map<String,Object>> readResult = new ArrayList<Map<String, Object>>();
            for (Message m:readMessages) {
                Map readMessageMap = new HashMap();
                readMessageMap.put("message",m);
                readMessageMap.put("readTime",fmt.format(m.getSendTime()));
                readResult.add(readMessageMap);
            }
            returnMap.put("read",readResult);
            returnMap.put("unRead",unReadResult);
            returnMap.put("total",readMessages.size()+unReadMessag.size());
        }catch (Exception e){
            e.printStackTrace();
        }
        return  returnMap;
    }

    public Map userMessage(Map map) {
        Map returnMap = new HashMap();
        try{
            List<Message> messages = messageMapper.getMessageByMap(map);
            returnMap.put(ParameterConstant.RETURN_DATA,messages);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map deleteMessage(String id) {
        Map returnMap = new HashMap();
        try{
            Message message = messageMapper.getMessageById(id);
            if(message != null){
                messageMapper.deleteMessageById(id);
                returnMap.put(ParameterConstant.RETURN_MSG,"删除成功！");
                returnMap.put(ParameterConstant.RETURN_CODE,0);
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该消息不存在！");
                returnMap.put(ParameterConstant.RETURN_CODE,1008);
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map batchDeleteMessage(String idString) {
        Map returnMap = new HashMap();
        try{
            String []ids = idString.split(",");
            for(int i = 0;i<ids.length;i++){
                messageMapper.deleteMessageById(ids[i]);
            }
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"删除成功！");
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map updateIsReadAsRead(String account) {
        Map returnMap = new HashMap();
        try{
            Map requestMap = new HashMap();
            requestMap.put("receiver",account);
            requestMap.put("isRead",0);
            List<Message> messages = messageMapper.searchUserMessage(requestMap);
            for (Message message:messages) {
                message.setIsRead(1);
                messageMapper.updateAllUnreadMessage(message);
            }
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"更新成功");
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }
}
