package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AppTypeMapper;
import com.oneworld.web.model.AppType;
import com.oneworld.web.service.AppTypeService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/20.
 */
@Service
public class AppTypeServiceImpl implements AppTypeService {
    @Autowired
    private AppTypeMapper appTypeMapper;

    public Map insertAppType(AppType appType) {
        Map returnMap = new HashedMap();
        try {
            AppType appType1 = appTypeMapper.findAppTypeByName(appType.getType_name());
            if(appType1 != null){
                returnMap.put(ParameterConstant.RETURN_MSG,"该活动类型名称已存在！");
            }else {
                appType.setAttention_num(0);
                appType.setCreate_time(new Timestamp(new Date().getTime()));
                appType.setUpdate_time(new Timestamp(new Date().getTime()));
                appTypeMapper.insertAppTye(appType);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"新增活动类型成功！");
            }
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map queryAppTypePage(Map map) {
        Map returnMap = new HashedMap();
        try{
            List<AppType> appTypes = appTypeMapper.queryAppTypeByPage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,appTypeMapper.queryAppTypeByPage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,appTypeMapper.queryAppTypeByPage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,appTypes);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map deleteAppType(int id) {
        Map returnMap = new HashedMap();
        try{
            AppType appType = appTypeMapper.findAppTypeById(id);
            if(appType != null){
                appTypeMapper.deleteById(id);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"删除成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该活动类型不存在！");
            }
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map updateAppType(AppType appType) {
        Map returnMap = new HashedMap();
        try{
            appTypeMapper.updateAppType(appType);
            returnMap.put(ParameterConstant.RETURN_MSG,"更新成功！");
            returnMap.put(ParameterConstant.RETURN_CODE,0);
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map queryAllAppType() {
        Map returnMap = new HashedMap();
        try{
            List<AppType> appTypes = appTypeMapper.queryAllAppType();
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_DATA,appTypes);
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }
}
