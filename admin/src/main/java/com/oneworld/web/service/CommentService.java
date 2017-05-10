package com.oneworld.web.service;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/10.
 */
public interface CommentService {
//    删除帖子下的评论
    public Map deleteComments(String invitationId,Integer invitationType);

//    删除一条评论及评论下的回复
    public Map deleteComment(String commentId,Integer replyType);
}
