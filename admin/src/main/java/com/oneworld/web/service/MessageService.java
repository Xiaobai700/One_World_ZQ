package com.oneworld.web.service;

import com.oneworld.web.model.Message;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/4.
 */
@Service
public interface MessageService {
    Map getMessagePage(Map map);

    Map insertMessage(Message message);

    Map deleteMessage(String id);
}
