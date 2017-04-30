package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AppTypeMapper;
import com.oneworld.web.model.AppType;
import com.oneworld.web.service.AppTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/4/12.
 */
@Service
public class AppTypeServiceImpl implements AppTypeService {
    @Autowired
    private AppTypeMapper appTypeMapper;

    public Map getAllAppType() {
        Map returnMap = new HashMap();
        try{
            List<AppType> appTypeList = appTypeMapper.queryAllAppType();
            returnMap.put(ParameterConstant.RETURN_DATA,appTypeList);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
}
