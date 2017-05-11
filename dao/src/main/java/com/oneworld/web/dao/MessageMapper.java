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

    /*根据查找系统消息 type=0*/
    List<Message> searchMessage(Map map);

    /*条件查找通知类消息*/
    List<Message> searchUserMessage(Map map);

    List<Message> getMessageByMap(Map map);

    /*把所有未读消息设为已读*/
    int updateAllUnreadMessage(Message message);
}
