package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.MessageMapper;
import com.oneworld.web.model.Message;
import com.oneworld.web.service.MessageService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/4.
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;

    public Map getMessagePage(Map map) {
        Map returnMap = new HashedMap();
        try{
            List<Message> messageList = messageMapper.searchMessage(map);
            map.remove(ParameterConstant.INDEX);
            map.remove(ParameterConstant.LENGTH);
            returnMap.put(ParameterConstant.DATA_ITOTALDISPLAYRECORDS,messageMapper.searchMessage(map).size());
            returnMap.put(ParameterConstant.DATA_ITOTALRECORDS,messageMapper.searchMessage(map).size());
            returnMap.put(ParameterConstant.RETURN_DATA,messageList);
            returnMap.put(ParameterConstant.RETURN_MSG,"数据返回成功！");
        }catch (Exception e){
            returnMap = RequestConstant.getRequestDesCode(-1);
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map insertMessage(Message message) {
       Map returnMap = new HashMap();
       try{
           messageMapper.insertMessage(message);
           returnMap.put(ParameterConstant.RETURN_CODE,0);
           returnMap.put(ParameterConstant.RETURN_MSG,"发布成功！");
       }catch (Exception e){
           e.printStackTrace();
       }
       return returnMap;
    }

    public Map deleteMessage(String id) {
        Map returnMap = new HashMap();
        try{
            Message message = messageMapper.getMessageById(id);
            if(message != null){
                messageMapper.deleteMessageById(id);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"删除成功！");
            }else {
                returnMap.put(ParameterConstant.RETURN_CODE,1008);
                returnMap.put(ParameterConstant.RETURN_MSG,"该公告不存在！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }
}
