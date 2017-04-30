package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AdminMapper;
import com.oneworld.web.model.Admin;
import com.oneworld.web.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/15.
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public Map insertAdmin(Admin admin) {
        Map returnMap = new HashMap();
        try {
            Admin admin1 = adminMapper.findAdminByAccount(admin.getAccount());
            if(admin1 != null){
                returnMap.put(ParameterConstant.RETURN_MSG,"此账号已存在");
            }else {
                admin.setRegist_time(new Timestamp(new Date().getTime()));
                adminMapper.insertAdmin(admin);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"添加管理员成功！");
            }
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return  returnMap;
    }

    public Map deleteAdmin(String account) {
        Map returnMap = new HashMap();
        try {
            Admin admin = adminMapper.findAdminByAccount(account);
            if(admin != null){
                adminMapper.deleteAdmin(account);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"删除成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该用户不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  returnMap;
    }

    public Map queryAdminPage(Map map) {
        Map returnMap = new HashMap();
        try{
            List<Admin> admins = adminMapper.queryAdminPage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,adminMapper.queryAdminPage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,adminMapper.queryAdminPage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,admins);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map findAdminByAccount(String account) {
        Map returnMap = new HashMap();
        try {
            Admin admin = adminMapper.findAdminByAccount(account);
            returnMap.put(ParameterConstant.RETURN_DATA,admin);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }
}
