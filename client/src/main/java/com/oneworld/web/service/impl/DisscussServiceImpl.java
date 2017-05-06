package com.oneworld.web.service.impl;

import com.oneworld.web.constant.ParameterConstant;
import com.oneworld.web.constant.RequestConstant;
import com.oneworld.web.dao.AnswerMapper;
import com.oneworld.web.dao.DiscussMapper;
import com.oneworld.web.dao.UserinfoMapper;
import com.oneworld.web.model.Answer;
import com.oneworld.web.model.Discuss;
import com.oneworld.web.model.UserInfo;
import com.oneworld.web.service.CommentService;
import com.oneworld.web.service.DiscussService;
import com.oneworld.web.service.LikeService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Service
public class DisscussServiceImpl implements DiscussService {
    @Autowired
    private DiscussMapper discussMapper;

    @Autowired
    private AnswerMapper answerMapper;

    @Autowired
    private UserinfoMapper userinfoMapper;

    @Autowired
    private CommentService commentService;

    @Autowired
    private LikeService likeService;

    public Map insertDiscuss(Map map) {
        Map returnMap = new HashMap();
        try {
            String discuss_title =(String) map.get("title");
            String question_describe = (String) map.get("description");
            String account = (String) map.get("account");
            String industry_id = (String) map.get("industry_id");

            Discuss discuss  = new Discuss();
            discuss.setId(UUID.randomUUID().toString());
            discuss.setAnswer_times(0);
            discuss.setAsker_account(account);
            discuss.setDiscuss_title(discuss_title);
            discuss.setQuestion_describe(question_describe);
            discuss.setIndustry_id(industry_id);
            discuss.setIs_over(0);
            discuss.setAsk_time(new Timestamp(new Date().getTime()));
            discussMapper.insertDiscuss(discuss);
            returnMap.put(ParameterConstant.RETURN_CODE,0);
            returnMap.put(ParameterConstant.RETURN_MSG,"发布讨论活动成功！");
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map queryAllDiscuss() {
        Map returnMap = new HashMap();
        try{
            List<Discuss> discusses = discussMapper.queryAllDiscuss();
            returnMap.put(ParameterConstant.RETURN_DATA,discusses);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map hotDiscuess() {
        Map returnMap = new HashMap();
        try{
            List<Discuss> discusses = discussMapper.hotDiscuess();
            if(discusses.size() != 0){
                returnMap.put(ParameterConstant.RETURN_DATA,discusses);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"现在还没有任何讨论！");
            }
        }catch(Exception e){
            e.printStackTrace();
            returnMap.put(ParameterConstant.RETURN_MSG,"系统内部错误！");
        }
        return returnMap;
    }

    public Map findDiscussById(String id) {
        Map returnMap = new HashMap();
        try {
            Discuss discuss = discussMapper.findDiscussById(id);
            if(discuss != null){
                returnMap.put(ParameterConstant.RETURN_DATA,discuss);
                returnMap.put(ParameterConstant.RETURN_CODE,0);
                returnMap.put(ParameterConstant.RETURN_MSG,"返回成功");
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该讨论不存在");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map queryDiscussByLike() {
        return null;
    }

    public Map queryDiscussByUserAccount(String account) {
        return null;
    }

    public Map queryDiscussPageTimes(int pageBegin, int pageSize) {
        Map returnMap = new HashMap();
        try{
            Map requestMap = new HashMap();
            requestMap.put("pageBegin",pageBegin);
            requestMap.put("pageSize",pageSize);
            List<Discuss> discusses = discussMapper.queryDiscussByPageTimes(requestMap);
            returnMap.put(ParameterConstant.RETURN_DATA,discusses);
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map queryDisscussPageNew(int pageBegin, int pageSize) {
        Map returnMap = new HashMap();
        try{
            Map requestMap = new HashMap();
            requestMap.put("pageBegin",pageBegin);
            requestMap.put("pageSize",pageSize);
            List<Discuss> discusses = discussMapper.queryDiscussPageNew(requestMap);
            returnMap.put(ParameterConstant.RETURN_DATA,discusses);
        }catch (Exception e){
            e.printStackTrace();
        }
        return returnMap;
    }

    public Map discussDetail(String id,String account) {
        Map returnMap = new HashMap();
        try{
            Discuss discuss = discussMapper.findDiscussById(id);
            Map<String,Object> discussOne = new HashedMap();
            List<Map<String,Object>> answers = new ArrayList<Map<String, Object>>();
            if(discuss != null){
                UserInfo discussUser = userinfoMapper.findUserInfoByAccount(discuss.getAsker_account());
                List<Answer> answerList = answerMapper.findAnswersByDiscuss_id(id);
                if(answerList.size()>0){
                    SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    for (Answer a:answerList) {
                        boolean flag = false;
                        Map requestMap = new HashMap();
                        requestMap.put("invitationId",a.getId());
                        requestMap.put("likerAccount",account);
                        requestMap.put("type",1);
                        flag = likeService.isLike(requestMap);
                        Map<String,Object> answer = new HashedMap();
//                        /*该回答下所有的评论*/
                        List<Map<String,Object>> comments = (List<Map<String,Object>>) commentService.queryCommentsByTarget_id(a.getId(),1).get("data");
                        UserInfo userInfo = userinfoMapper.findUserInfoByAccount(a.getAnswer_account());
                        answer.put("answer",a);
                        answer.put("answerTime",fmt.format(a.getAnswer_time()));
                        answer.put("answerUser",userInfo);
                        answer.put("comment",comments);
                        answer.put("isLike",flag);
                        answers.add(answer);
                    }
                    discussOne.put("answer",answers);
                }
                    discussOne.put("answerNumber",answerList.size());
                    SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String time = fmt.format(discuss.getAsk_time());
                    discussOne.put("time",time);
                    discussOne.put("discuss",discuss);
                    discussOne.put("discussUser",discussUser);
                    returnMap.put(ParameterConstant.RETURN_DATA,discussOne);
            }else {
                returnMap.put(ParameterConstant.RETURN_MSG,"该讨论不存在");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }

    public Map searchDiscuss(Map map) {
        Map returnMap = new HashMap();
        try {
            List<Discuss> discussList = discussMapper.queryDiscussPageNew(map);
            returnMap.put(ParameterConstant.RETURN_DATA,discussList);
        }catch (Exception e){
            e.printStackTrace();
            returnMap = RequestConstant.getRequestDesCode(-1);
        }
        return returnMap;
    }
}
