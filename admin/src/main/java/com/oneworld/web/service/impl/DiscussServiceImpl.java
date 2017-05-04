package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.DiscussMapper;
import com.oneworld.web.model.Discuss;
import com.oneworld.web.service.DiscussService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/13.
 */
@Service
public class DiscussServiceImpl implements DiscussService {
@Autowired
private DiscussMapper discussMapper;
    public Map findDiscussById(String id) {
        return null;
    }

    public Map getDiscussPage(Map map) {
        Map returnMap = new HashedMap();
        try{
            List<Discuss> discusses = discussMapper.queryAllDiscussPage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,discussMapper.queryAllDiscussPage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,discussMapper.queryAllDiscussPage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,discusses);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }
}
