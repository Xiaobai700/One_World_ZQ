package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AttentionMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Attention;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.AttentionService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

/**
 * Created by Master ZQ on 2017/3/6.
 */
@Service
public class AttentionServiceImpl implements AttentionService{
    @Autowired
    private AttentionMapper attentionMapper;
    @Autowired
    private UserinfoMapper userinfoMapper;

    public Map insertAttention(Attention attention) {
       Map returnMap = new HashMap();
       try{

       }catch (Exception e){
           e.printStackTrace();
           returnMap = RequestConstant.getRequestDesCode(-1);
       }
       return returnMap;
    }

    public Map careUser(String myAccount,String userAccount) {
        Map returnMap = new HashMap();
        try{
            if(myAccount.equals(userAccount)){
                returnMap.put(ParameterConstant.RETURN_CODE,1008);
                returnMap.put(ParameterConstant.RETURN_MSG,"不能关注自己！");
            }else {
                Map requestMap = new HashMap();
                requestMap.put("carer_account",myAccount);
                requestMap.put("user_account",userAccount);
                UserInfo me = userinfoMapper.findUserInfoByAccount(myAccount);
                UserInfo userInfo = userinfoMapper.findUserInfoByAccount(userAccount);
                Attention attention1 = attentionMapper.findAttentionByTwoAccount(requestMap);
                if(attention1 != null){
                    attentionMapper.deleteAttentionById(attention1.getId());
                    me.setCare_count(me.getCare_count()-1);
                    userinfoMapper.updateUserInfo(me);
                    userInfo.setFans_count(userInfo.getFans_count()-1);
                    userinfoMapper.updateUserInfo(userInfo);
                    returnMap.put(ParameterConstant.RETURN_CODE,1);
                    returnMap.put(ParameterConstant.RETURN_MSG,"取消关注成功！");
                }else {
                    Attention attention = new Attention();
                    attention.setId(UUID.randomUUID().toString());
                    attention.setCarer_account(myAccount);
                    attention.setUser_account(userAccount);
                    attention.setAttention_time(new Timestamp(new Date().getTime()));
                    attentionMapper.insertAttention(attention);
                    me.setCare_count(me.getCare_count()+1);
                    userinfoMapper.updateUserInfo(me);
                    userInfo.setFans_count(userInfo.getFans_count()+1);
                    userinfoMapper.updateUserInfo(userInfo);
                    returnMap.put(ParameterConstant.RETURN_CODE,0);
                    returnMap.put(ParameterConstant.RETURN_MSG,"关注成功！");
            }

            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map cancelCareUser(String myAccount, String userAccount) {
        Map returnMap = new HashMap();
        try{

        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map findAttentionsBycarer_account(String account) {
        Map returnMap = new HashedMap();
        try{
            List<Attention> attentions = attentionMapper.findAttentionsBycarer_account(account);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_DATA,attentions);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map findAttentionsByCared_account(String cared_account) {
        Map returnMap = new HashedMap();
        try{
            List<Attention> attentions = attentionMapper.findAttentionsByCared_account(cared_account);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_DATA,attentions);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map findFansByUserAccount(String user_account) {
        return null;
    }

    public boolean isCare(String myAccount, String userAccount) {
        boolean flag = false;
        try {
            Map requestMap = new HashMap();
            requestMap.put("carer_account",myAccount);
            requestMap.put("user_account",userAccount);
            Attention attention = attentionMapper.findAttentionByTwoAccount(requestMap);
            if(attention != null){
               flag = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  flag;
    }
}
