package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.IndustryMapper;
import com.oneworld.web.model.Industry;
import com.oneworld.web.service.IndustryService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

/**
 * Created by Master ZQ on 2017/3/17.
 */
@Service
public class IndustryServiceImpl implements IndustryService{
    @Autowired
    private IndustryMapper industryMapper;

    public Map insertIndustry(Industry industry) {
        Map returnMap = new HashedMap();
        try{
            Industry industry1 = industryMapper.findIndustryByName(industry.getIndustry_name());
            if(industry1 != null){
                returnMap.put(ParameterConstant.RETURN_MSG,"该行业已经存在");
            }else {
                industry.setId(UUID.randomUUID().toString());
                industry.setCreate_time(new Timestamp(new Date().getTime()));
                industry.setUpdate_time(new Timestamp(new Date().getTime()));
                industryMapper.insertIndustry(industry);
                returnMap.put(ParameterConstant.RETURN_MSG,"新增行业成功！");
                returnMap.put(ParameterConstant.RETURN_CODE,0);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map deleteIndustry(String id) {
        Map returnMap = new HashedMap();
        try{
            Industry industry = industryMapper.findIndustryById(id);
            if(industry != null){
            industryMapper.deleteIndustry(id);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"删除成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该行业不存在");
            }
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map updateIndustry(Industry industry) {
        Map returnMap = new HashedMap();
        try{
            industryMapper.updateIndustry(industry);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"更新成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return  returnMap;
    }

    public Map queryIndustryPage(Map map) {
        Map returnMap = new HashedMap();
        try{
            List<Industry> industries = industryMapper.queryIndustryPage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,industryMapper.queryIndustryPage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,industryMapper.queryIndustryPage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,industries);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }
}
