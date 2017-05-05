package com.oneworld.web.service;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/4/27.
 */
public interface MessageService {
    Map sendMessage(Map map);
/*查找所有系统消息*/
    Map getMessage(Map map);

/*查找用户所有的通知类消息*/
    Map allMessages(String account);

/*条件查找用户的通知消息*/
    Map userMessage(Map map);

    Map deleteMessage(String id);

    Map batchDeleteMessage(String idString);
}
