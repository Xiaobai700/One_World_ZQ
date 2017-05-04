package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.ReportMapper;
import com.oneworld.web.dao.UserMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Report;
import com.oneworld.web.model.User;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.UserService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserinfoMapper userinfoMapper;
    @Autowired
    private ReportMapper reportMapper;

    @Autowired
    private UserMapper userMapper;

    public Map userLogin(String account, String password) {
        return null;
    }

    public Map userRegist(String account, String password) {
        return null;
    }

    public Map findUserByAccount(String account) {
        return null;
    }

    public Map changeUserStatus(String account,String reportId,Integer processType) {
        Map returnMap = new HashMap();
        try {
            User user = userMapper.findUserByAccount(account);
            Report report = reportMapper.findReportById(reportId);
            if(user != null && report != null){
                user.setDisabled(1);
                userMapper.changeStatus(user);
                report.setCurrentState(1);
                report.setUpdateTime(new Timestamp(new Date().getTime()));
                report.setStatus(3);
                reportMapper.updateReport(report);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"用户已禁用");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该用户不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
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
