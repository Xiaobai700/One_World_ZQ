package com.oneworld.web.service;

import com.oneworld.web.model.Reply;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/3.
 */
public interface ReplyService {
    Map replyComment(Reply reply);

    Map deleteReply(String id);

    Map getReply(Map map);

}
