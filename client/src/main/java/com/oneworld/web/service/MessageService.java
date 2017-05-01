package com.oneworld.web.service;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/4/27.
 */
public interface MessageService {
    Map sendMessage(Map map);

    Map getMessage(Map map);

    Map allMessages(String account);

    Map deleteMessage(String id);

    Map batchDeleteMessage(String idString);
}
