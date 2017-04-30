package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.IndustryMapper;
import com.oneworld.web.model.Industry;
import com.oneworld.web.service.IndustryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/4/12.
 */
@Service
public class IndustryServiceImpl implements IndustryService{
    @Autowired
    private IndustryMapper industryMapper;

    public Map getAllIndustry() {
        Map returnMap = new HashMap();
        try{
            List<Industry> industryList = industryMapper.queryAllIndustry();
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_DATA,industryList);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
}
