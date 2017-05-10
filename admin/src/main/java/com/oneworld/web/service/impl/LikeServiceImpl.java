package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.LikeMapper;
import com.oneworld.web.model.Like;
import com.oneworld.web.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/10.
 */
@Service
public class LikeServiceImpl implements LikeService {
    @Autowired
    private LikeMapper likeMapper;
    public Map deleteLike(String invitationId, Integer invitationType) {
        Map returnMap = new HashMap();
        try{
            Map requestMap = new HashMap();
            requestMap.put("invitationId",invitationId);
            requestMap.put("type",invitationType);
            List<Like> likeList = likeMapper.selectLikeByIdAndType(requestMap);
            for (Like like:likeList) {
                likeMapper.deleteLkeById(like.getId());
            }
            returnMap.put(ParameterConstant.RETURN_CODE,0);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
}
