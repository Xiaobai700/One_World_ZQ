package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.UserMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.User;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserinfoMapper userinfoMapper;

    public Map userLogin(String account, String password) {
        Map returnMap = new HashMap();
        try {
            User user = userMapper.findUserByAccount(account);
            if(user != null){
                if(user.getPassword().equals(password) && user.getDisabled() == 0){
                    returnMap = RequestConstant.getRequestDesCode(1);
                }else if(user.getDisabled() == 1){
                    returnMap.put(ParameterConstant.RETURN_MSG,"您已被禁用！");
                    returnMap.put(ParameterConstant.RETURN_CODE,-4);
                }else {
                    returnMap = RequestConstant.getRequestDesCode(-3);
                }
            }else{
                returnMap = RequestConstant.getRequestDesCode(-2);
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map userRegist(String account, String password) {
        Map returnMap = new HashMap();
        try{
            User user = userMapper.findUserByAccount(account);
            UserInfo userInfo = userinfoMapper.findUserInfoByAccount(account);
            if(user != null || userInfo != null){
                returnMap.put(ParameterConstant.RETURN_MSG,"该账号已存在！");
            }else {
                User newUser = new User();
                newUser.setAccount(account);
                newUser.setPassword(password);
                newUser.setDisabled(0);
                userMapper.insertUser(newUser);

                UserInfo newUserInfo = new UserInfo();
                newUserInfo.setAccount(account);
//                newUserInfo.setNickName("");
                newUserInfo.setHead("person.jpg");
//                newUserInfo.setSignature("");
//                newUserInfo.setSex("");
                newUserInfo.setAge(0);
//                newUserInfo.setBirth("");
//                newUserInfo.setHobby("");
//                newUserInfo.setJob("");
//                newUserInfo.setLocation("");
                newUserInfo.setCare_count(0);
                newUserInfo.setFans_count(0);
                newUserInfo.setDisabled(0);
                newUserInfo.setRegist_time(new Timestamp(new Date().getTime()));
                userinfoMapper.insertUserInfo(newUserInfo);
                returnMap = RequestConstant.getRequestDesCode(2);
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map findUserByAccount(String account) {
        Map returnMap = new HashMap();
        try{
            User user = userMapper.findUserByAccount(account);
            if(user != null){
                returnMap.put(ParameterConstant.RETURN_DATA,user);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"返回成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该账号不存在");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map changeUserStatus(User user) {
        Map returnMap = new HashMap();
        try {
            userMapper.changeStatus(user);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

}
