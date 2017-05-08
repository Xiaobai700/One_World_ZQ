package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/4.
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    private UserinfoMapper userinfoMapper;

    public Map insertuserInfo(UserInfo userInfo) {
       Map returnMap = new HashMap();
       try{
           userinfoMapper.insertUserInfo(userInfo);
           returnMap.put(ParameterConstant.RETURN_CODE,0);
       }catch (Exception e){
           e.printStackTrace();
           returnMap = RequestConstant.getRequestDesCode(-1);
       }
       return  returnMap;
    }

    public Map findUserInfoByAccount(String account) {
        Map returnMap = new HashMap();
        try {
            UserInfo userInfo = userinfoMapper.findUserInfoByAccount(account);
            if(userInfo != null){
                returnMap.put(ParameterConstant.RETURN_DATA,userInfo);
            }else{
                returnMap = RequestConstant.getRequestDesCode(-2);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map updateUserInfo(UserInfo userInfo) {
        Map returnMap = new HashMap();
        try{
            userinfoMapper.updateUserInfo(userInfo);
            returnMap.put(ParameterConstant.RETURN_MSG,"修改成功！");
            returnMap.put(ParameterConstant.RETURN_CODE,0);
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
           e.printStackTrace();
        }
        return returnMap;
    }

    public Map searchUser(Map map) {
        Map returnMap = new HashMap();
        try{
            List<UserInfo> userInfos = userinfoMapper.findAllUserPage(map);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_DATA,userInfos);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
}
