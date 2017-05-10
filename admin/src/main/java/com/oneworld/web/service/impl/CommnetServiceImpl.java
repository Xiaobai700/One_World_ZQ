package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.CommentMapper;
import com.oneworld.web.dao.ReplyMapper;
import com.oneworld.web.model.Comment;
import com.oneworld.web.model.Reply;
import com.oneworld.web.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/10.
 */
@Service
public class CommnetServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private ReplyMapper replyMapper;
    public Map deleteComments(String invitationId, Integer invitationType) {
        /*这里的invitationType指的是举报的类型目前1是回答 3是约伴活动*/
        Map returnMap = new HashMap();
        try{
            Integer replyType = 0;
            switch (invitationType){/*前期设计的不到位 数字不对应 导致后来各种麻烦*/
                case 1:
                    replyType = 1;
                    break;
                case 3:
                    replyType = 2;
                    break;
            }
            Map requestMap = new HashMap();
            requestMap.put("target_id",invitationId);
            requestMap.put("label",invitationType);
            List<Comment> commentList = commentMapper.queryCommentsByTargetIdAndLabel(requestMap);
            for (Comment comment:commentList) {
                deleteComment(comment.getId(),replyType);
            }
            returnMap.put(ParameterConstant.RETURN_MSG,"评论删除成功！");
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map deleteComment(String commentId,Integer replyType) {
        Map returnMap = new HashMap();
        try{
            commentMapper.deleteComment(commentId);
            Map requestMap = new HashMap();
            requestMap.put("replyType",replyType);
            requestMap.put("commentId",commentId);
            List<Reply> replyList = replyMapper.getReplyByreplyTypeAndCommentId(requestMap);
            for (Reply reply:replyList) {
                replyMapper.deleteReply(reply.getId());
            }
            returnMap.put(ParameterConstant.RETURN_CODE,0);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
}
