package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AttentionMapper;
import com.oneworld.web.model.Attention;
import com.oneworld.web.service.AttentionService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/6.
 */
@Service
public class AttentionServiceImpl implements AttentionService{
    @Autowired
    private AttentionMapper attentionMapper;

    public Map insertAttention(Attention attention) {
       Map returnMap = new HashMap();
       try{

       }catch (Exception e){
           e.printStackTrace();
           returnMap = RequestConstant.getRequestDesCode(-1);
       }
       return returnMap;
    }

    public Map careUser(Attention attention) {
        Map returnMap = new HashMap();
        try{
            Map requestMap = new HashMap();
            requestMap.put("carer_account",attention.getCarer_account());
            requestMap.put("user_account",attention.getUser_account());
            Attention attention1 = attentionMapper.findAttentionByTwoAccount(requestMap);
            if(attention1 != null){
                returnMap.put(ParameterConstant.RETURN_MSG,"你已经关注过TA了!");
            }else {
                attentionMapper.insertAttention(attention);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"关注成功！");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
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
}
