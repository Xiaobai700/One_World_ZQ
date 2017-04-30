package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AnswerMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Answer;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/4.
 */
@Service
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerMapper answerMapper;

    @Autowired
    private UserinfoMapper userinfoMapper;

    public Map insertAnswer(Answer answer) {
        return null;
    }

    public Map findAnswersByDiscuss_id(String discuss_id) {
        Map returnMap = new HashMap();
        try{
            List<Answer> answers = answerMapper.findAnswersByDiscuss_id(discuss_id);
            if(answers.size()>0){
                returnMap.put(ParameterConstant.RETURN_DATA,answers);
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该问题还未有任何回答");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map findAllAnswersByDiscuss_id(String discuss_id) {
        return null;
    }

    public Map deleteAnswer(String id) {
        return null;
    }

    public Map findAnswerById(String id) {
        return null;
    }

    public Map getUserInfosByDiscuss_id(String discuss_id) {
        Map returnMap = new HashMap();
        try{
            List<Answer> answers = (List<Answer>) findAnswersByDiscuss_id(discuss_id).get("data");
            if(answers.size()>0){
                List<UserInfo> userInfos = new ArrayList<UserInfo>();
                for (Answer a : answers) {
                    UserInfo userInfo = userinfoMapper.findUserInfoByAccount(a.getAnswer_account());
                    if(userInfo != null){
                        userInfos.add(userInfo);
                        returnMap.put(ParameterConstant.RETURN_DATA,userInfos);
                    }else {
                        returnMap.put(ParameterConstant.RETURN_MSG,"账号为"+a.getAnswer_account()+"的用户不存在");
                        return  returnMap;
                    }
                }
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"此问题还没有任何回答");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map findAnswerByDiscuss_idAndUser_account(String discuss_id, String account) {
        Map returnMap = new HashMap();
        try{
            Map requestMap = new HashMap();
            requestMap.put("discuss_id",discuss_id);
            requestMap.put("account",account);
            Answer answer = answerMapper.findAnswerByDiscuss_idAndUser_account(requestMap);
            if(answer != null){
                returnMap.put(ParameterConstant.RETURN_DATA,answer);
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该回答不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map findAnswersByUser_account(String user_account) {
        return null;
    }
}
