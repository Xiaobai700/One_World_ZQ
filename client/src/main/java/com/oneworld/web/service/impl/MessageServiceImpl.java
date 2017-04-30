package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.dao.MessageMapper;
import com.oneworld.web.model.Message;
import com.oneworld.web.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
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
}
