package com.oneworld.web.dao;

import com.oneworld.web.model.Message;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/4/27.
 */
public interface MessageMapper {
    int insertMessage(Message message);

    int deleteMessageById(String id);

    Message getMessageById(String id);

    /*根据条件查找消息*/
    List<Message> searchMessage(Map map);

    List<Message> getMessageByMap(Map map);
}
