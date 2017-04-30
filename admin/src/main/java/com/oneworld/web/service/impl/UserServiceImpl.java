package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.UserService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserinfoMapper userinfoMapper;

    public Map userLogin(String account, String password) {
        return null;
    }

    public Map userRegist(String account, String password) {
        return null;
    }

    public Map findUserByAccount(String account) {
        return null;
    }

    public Map getUserPage(Map map) {
        Map returnMap = new HashedMap();
        try {
           List<UserInfo> userInfos = userinfoMapper.findAllUserPage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,userinfoMapper.findAllUserPage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,userinfoMapper.findAllUserPage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,userInfos);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap= RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }
}
