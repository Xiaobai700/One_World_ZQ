package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.CommentMapper;
import com.oneworld.web.dao.ReplyMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Comment;
import com.oneworld.web.model.Reply;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/3.
 */
@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    private ReplyMapper replyMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private UserinfoMapper userinfoMapper;

    public Map replyComment(Reply reply) {
        Map returnMap = new HashMap();
        try{
            String commentId = reply.getCommentId();
            Comment comment = commentMapper.findCommentById(commentId);
            if(comment != null){
                replyMapper.insertReply(reply);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"回复成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该评论不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }

    public Map deleteReply(String id) {
        Map returnMap = new HashMap();
        try{
            replyMapper.deleteReply(id);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"删除成功！");
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }

    public Map getReply(Map map) {
        Map returnMap = new HashMap();
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try{
            List<Reply> replyList = replyMapper.getReplyByreplyTypeAndCommentId(map);
            List<Map<String,Object>> replyResult = new ArrayList<Map<String, Object>>();
            for (Reply reply:replyList) {
                Map replyMap = new HashMap();
                UserInfo replyerUser = userinfoMapper.findUserInfoByAccount(reply.getReplyerAccount());
                UserInfo replyedUser = userinfoMapper.findUserInfoByAccount(reply.getReplyedAccount());
                replyMap.put("replyerUser",replyerUser);
                replyMap.put("replyedUser",replyedUser);
                replyMap.put("reply",reply);
                replyMap.put("time",fmt.format(reply.getReplyTime()));
                replyResult.add(replyMap);
            }
            returnMap.put("reply",replyResult);
            returnMap.put("replyNumbers",replyList.size());
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }
}
