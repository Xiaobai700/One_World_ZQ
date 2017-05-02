package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.dao.LikeMapper;
import com.oneworld.web.model.Like;
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

    public Map likeInvitation(Map map) {
        Map returnMap = new HashMap();
        try {
            boolean flag = isLike(map);
//            如果已经点过赞了 就取消赞
            if(flag){
                likeMapper.deleteLike(map);
                returnMap.put(ParameterConstant.RETURN_MSG,"取消赞");
                returnMap.put(ParameterConstant.RETURN_CODE,1);
            }else {
//                否则就点赞
                Like like = new Like();
                like.setId(UUID.randomUUID().toString());
                like.setInvitationId((String) map.get("invitationId"));
                like.setLikerAccount((String)map.get("likerAccount"));
                like.setType((Integer)map.get("type"));
                like.setLikeTime(new Timestamp(new Date().getTime()));
                likeMapper.insertLike(like);
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
