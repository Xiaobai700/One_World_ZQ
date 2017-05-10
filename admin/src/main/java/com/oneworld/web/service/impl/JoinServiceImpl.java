package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.JoinMapper;
import com.oneworld.web.model.Join;
import com.oneworld.web.service.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/10.
 */
@Service
public class JoinServiceImpl implements JoinService {
    @Autowired
    private JoinMapper joinMapper;
    public Map deleteJoinsByAppId(String appId) {
        Map returnMap = new HashMap();
        try {
            List<Join> joinList = joinMapper.queryJoinsByAppId(appId);
            for (Join join:joinList) {
                joinMapper.deleteJoin(join.getId());
            }
            returnMap.put(ParameterConstant.RETURN_CODE,0);
        }catch (Exception e){
            e.printStackTrace();
            returnMap= RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }
}
