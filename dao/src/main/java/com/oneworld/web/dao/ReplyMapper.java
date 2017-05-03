package com.oneworld.web.dao;

import com.oneworld.web.model.Reply;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/3.
 */
public interface ReplyMapper {
    int insertReply(Reply reply);

    int deleteReply(String id);

    List<Reply> getReplyByreplyTypeAndCommentId(Map map);

}
