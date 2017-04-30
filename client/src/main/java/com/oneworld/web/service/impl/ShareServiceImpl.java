package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.CommentMapper;
import com.oneworld.web.dao.ShareMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Share;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.CommentService;
import com.oneworld.web.service.ShareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/6.
 */
@Service
public class ShareServiceImpl implements ShareService{
    @Autowired
    private ShareMapper shareMapper;

    @Autowired
    private UserinfoMapper userinfoMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private CommentService commentService;

    public Map insertShare(Share share) {
        Map returnMap = new HashMap();
        try{
            shareMapper.insertShare(share);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"分享发布成功！");
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map queryAllByTime() {
        return null;
    }

    public Map queryAllByLike() {
        return null;
    }

    public Map findShareById(String id) {
        Map returnMap = new HashMap();
        try{
            Share share = shareMapper.findShareById(id);
            if(share != null){
                /*作者信息*/
                UserInfo userInfo = userinfoMapper.findUserInfoByAccount(share.getSharer_account());
                /*评论的相关信息*/
                List<Map<String,Object>> commentList = (List<Map<String,Object>>) commentService.queryCommentsByTarget_id(id,3).get("data");
                returnMap.put("editor",userInfo);
                returnMap.put("comment",commentList);
                returnMap.put("share",share);
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该分享不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map findSharesByAccount(String account) {
        return null;
    }
}
