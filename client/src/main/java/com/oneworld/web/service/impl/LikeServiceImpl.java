package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.dao.AnswerMapper;
import com.oneworld.web.dao.LikeMapper;
import com.oneworld.web.model.Answer;
import com.oneworld.web.model.Like;
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

    public Map likeInvitation(Map map) {
        Map returnMap = new HashMap();
        try {
            String id = (String) map.get("invitationId");
            boolean flag = isLike(map);
            Answer answer = answerMapper.findAnswerById(id);
//            如果已经点过赞了 就取消赞 更新回答的点赞次数
            if(flag){
                likeMapper.deleteLike(map);
                answer.setAgree_times(answer.getAgree_times()-1);
                answerService.updateAnswer(answer);
                returnMap.put(ParameterConstant.RETURN_CODE,1);
            }else {
//                否则就点赞  更新回答的点赞次数
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
