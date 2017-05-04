package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.ShareMapper;
import com.oneworld.web.model.Share;
import com.oneworld.web.service.ShareService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/13.
 */
@Service
public class ShareServiceImpl implements ShareService {
    @Autowired
    private ShareMapper shareMapper;

    public Map findShareById(String id) {
        return null;
    }

    public Map querySharePage(Map map) {
        Map returnMap = new HashedMap();
        try{
            List<Share> shares = shareMapper.querySharePage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,shareMapper.querySharePage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,shareMapper.querySharePage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,shares);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return  returnMap;
    }
}
