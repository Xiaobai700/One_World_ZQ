package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.CommentMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Comment;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.CommentService;
import com.oneworld.web.service.ReplyService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/6.
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private UserinfoMapper userinfoMapper;
    @Autowired
    private ReplyService replyService;

    public Map insertComment(Comment comment) {
        Map returnMap = new HashMap();
        try{
            commentMapper.insertComment(comment);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"评论成功！");
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }

    public Map deleteComment(String id) {
        return null;
    }

    public Map queryCommentsByTarget_id(String target_id, int label) {
        Map returnMap = new HashMap();
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try{
            Map requestMap= new HashMap();
            requestMap.put("target_id",target_id);
            requestMap.put("label",label);
            List<Comment> commentList = commentMapper.queryCommentsByTargetIdAndLabel(requestMap);
            List<Map<String,Object>> commentResult = new ArrayList<Map<String, Object>>();
//            if(commentList.size()>0){
                for (Comment comment:commentList) {
                    Map<String,Object> commentMap = new HashedMap();
                    /*评论者的信息*/
                    UserInfo userInfo = userinfoMapper.findUserInfoByAccount(comment.getCommenter_account());
                    /*评论下的回复*/
                    Integer replyType = 0;
                    switch (comment.getLabel()){
                        case 1:
                            replyType = 1;
                            break;
                        case 2:
                            replyType = 3;
                            break;
                        case 3:
                            replyType = 2;
                            break;
                    }
                    Map replyMap = new HashMap();
                    replyMap.put("replyType",replyType);
                    replyMap.put("commentId",comment.getId());
                    Map za = replyService.getReply(replyMap);
                    Integer replyNumbers = Integer.parseInt(replyService.getReply(replyMap).get("replyNumbers").toString());
                    commentMap.put("userInfo",userInfo);
                    commentMap.put("comment",comment);
                    commentMap.put("replyNumbers",replyNumbers);
                    commentMap.put("commentNumbers",commentList.size());
                    commentMap.put("time",fmt.format(comment.getComment_time()));
                    commentResult.add(commentMap);
                }
                returnMap.put(ParameterConstant.RETURN_DATA,commentResult);
//            }else {
//                returnMap.put(ParameterConstant.RETURN_MSG,"该帖子下没有任何评论");
//            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map findCommentById(String id) {
        return null;
    }
}
