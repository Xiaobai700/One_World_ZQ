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
 * Created by Master ZQ on 2017/3/4.
 */
@Service
public class JoinServiceImpl implements JoinService {
    @Autowired
    private JoinMapper joinMapper;

    public Map insertJoin(Join join) {
        Map returnMap = new HashMap();
        try{
            joinMapper.insertJoin(join);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"申请成功，等待对方审核");
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map queryJoinsByAppId(int id) {
        return null;
    }

    public Map updateJoin(Join join) {
        return null;
    }

    public Map queryAllJoinsByJoin_account(String join_account) {
        Map returnMap = new HashMap();
        try {
            List<Join> joins = joinMapper.queryJoinsByJoinAccount(join_account);
            if(joins.size()>0){
                returnMap.put(ParameterConstant.RETURN_DATA,joins);
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public boolean isJoined(String join_account, String app_id) {
        boolean flag = false;
        try{
            Map requestMap = new HashMap();
            requestMap.put("join_account",join_account);
            requestMap.put("appointment_id",app_id);
            Join join =(Join)joinMapper.isJoined(requestMap);
            if(join != null){
                flag = true;
            }else{
                flag = false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  flag;
    }

    public Map joinUserInfo(int id) {
        return null;
    }

    public Map wantJoinUserInfo(int id) {
        return null;
    }

    public Map queryWantJoinsByAppId(int id) {
        return null;
    }

    public Map findJoinByUserAccountAndId(int id, String account) {
        return null;
    }
}
