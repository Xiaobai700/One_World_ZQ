package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.dao.CommentMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Comment;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.CommentService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public Map insertComment(Comment comment) {
        return null;
    }

    public Map deleteComment(String id) {
        return null;
    }

    public Map queryCommentsByTarget_id(String target_id, int label) {
        Map returnMap = new HashMap();
        try{
            Map requestMap= new HashMap();
            requestMap.put("target_id",target_id);
            requestMap.put("label",label);
            List<Comment> commentList = commentMapper.queryCommentsByTargetIdAndLabel(requestMap);
            List<Map<String,Object>> commentResult = new ArrayList<Map<String, Object>>();
            Map<String,Object> commentMap = new HashedMap();
            if(commentList.size()>0){
                for (Comment comment:commentList) {
                    /*评论者的信息*/
                    UserInfo userInfo = userinfoMapper.findUserInfoByAccount(comment.getCommenter_account());
                    commentMap.put("userInfo",userInfo);
                    commentMap.put("comment",comment);
                    commentResult.add(commentMap);
                }
                returnMap.put(ParameterConstant.RETURN_DATA,commentResult);
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该帖子下没有任何评论");
            }

        }catch (Exception e){

        }
        return returnMap;
    }

    public Map findCommentById(String id) {
        return null;
    }
}
