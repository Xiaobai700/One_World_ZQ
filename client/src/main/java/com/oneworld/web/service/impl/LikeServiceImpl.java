package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.dao.AnswerMapper;
import com.oneworld.web.dao.LikeMapper;
import com.oneworld.web.dao.ShareMapper;
import com.oneworld.web.model.Answer;
import com.oneworld.web.model.Like;
import com.oneworld.web.model.Share;
import com.oneworld.web.service.AnswerService;
import com.oneworld.web.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Master ZQ on 2017/5/2.
 */
@Service
public class LikeServiceImpl implements LikeService {
    @Autowired
    private LikeMapper likeMapper;
    @Autowired
    private AnswerService answerService;
    @Autowired
    private AnswerMapper answerMapper;
    @Autowired
    private ShareMapper shareMapper;

    public Map likeInvitation(Map map) {
        Map returnMap = new HashMap();
        try {
            String id = (String) map.get("invitationId");
            Integer type =(Integer) map.get("type");
            boolean flag = isLike(map);
//            如果已经点过赞了 就取消赞 更新回答的点赞次数
                switch (type){
                    case 1:/*对问题的回答的点赞*/
                        Answer answer = answerMapper.findAnswerById(id);
                        if(flag){
                            answer.setAgree_times(answer.getAgree_times()-1);
                            answerService.updateAnswer(answer);
                            likeMapper.deleteLike(map);
                            returnMap.put(ParameterConstant.RETURN_CODE,1);
                        }else {
                            Like like = new Like();
                            like.setId(UUID.randomUUID().toString());
                            like.setInvitationId((String) map.get("invitationId"));
                            like.setLikerAccount((String)map.get("likerAccount"));
                            like.setType((Integer)map.get("type"));
                            like.setLikeTime(new Timestamp(new Date().getTime()));
                            likeMapper.insertLike(like);
                            answer.setAgree_times(answer.getAgree_times()+1);
                            answerService.updateAnswer(answer);
                            returnMap.put(ParameterConstant.RETURN_CODE,0);
                        }
                        break;
                    case 2:/*对分享的点赞*/
                        Share share = shareMapper.findShareById(id);
                        if(flag){
                            share.setLike_times(share.getLike_times()-1);
                            shareMapper.updateShare(share);
                            likeMapper.deleteLike(map);
                            returnMap.put(ParameterConstant.RETURN_CODE,1);
                        }else {
                            Like like = new Like();
                            like.setId(UUID.randomUUID().toString());
                            like.setInvitationId((String) map.get("invitationId"));
                            like.setLikerAccount((String)map.get("likerAccount"));
                            like.setType((Integer)map.get("type"));
                            like.setLikeTime(new Timestamp(new Date().getTime()));
                            likeMapper.insertLike(like);
                            share.setLike_times(share.getLike_times()+1);
                            shareMapper.updateShare(share);
                            returnMap.put(ParameterConstant.RETURN_CODE,0);
                        }
                        break;
                }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map cancelLike(String id) {
        return null;
    }

    public boolean isLike(Map map) {
        boolean isLike = false;
        try {
            Like like = likeMapper.selectLikeByAccountAndId(map);
            if(like != null){
                isLike = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isLike;
    }
}
