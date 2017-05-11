package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.FeedBackMapper;
import com.oneworld.web.model.FeedBack;
import com.oneworld.web.service.FeedBackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/11.
 */
@Service
public class FeedBackServiceImpl implements FeedBackService {
    @Autowired
    private FeedBackMapper feedBackMapper;
    public Map selectBackPage(Map map) {
        Map returnMap = new HashMap();
        try{
            List<FeedBack> feedBackList = feedBackMapper.queryBackPage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,feedBackMapper.queryBackPage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,feedBackMapper.queryBackPage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,feedBackList);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            e.printStackTrace();
        }
        return  returnMap;
    }

    public Map updateBack(String id) {
        Map returnMap = new HashMap();
        try{
            FeedBack feedBack = feedBackMapper.findBackById(id);
            if(feedBack != null){
                if(feedBack.getIs_reply() ==1){
                    feedBack.setIs_reply(0);
                }else {
                    feedBack.setIs_reply(1);
                }
                feedBackMapper.updateFeedBack(feedBack);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"更新成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该反馈不存在");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }

    public Map deleteBack(String id) {
        Map returnMap = new HashMap();
        try{
            FeedBack feedBack = feedBackMapper.findBackById(id);
            if(feedBack != null){
                feedBackMapper.deleteFeedback(id);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"删除成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该反馈不存在");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return  returnMap;
    }
}
