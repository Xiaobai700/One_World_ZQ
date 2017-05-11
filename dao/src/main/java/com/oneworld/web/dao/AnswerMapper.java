package com.oneworld.web.dao;

import com.oneworld.web.model.Answer;

import java.util.List;
import java.util.Map;


public interface AnswerMapper {
	//增加一个回答
	public int insertAnswer(Answer answer);
	
	//根据讨论的id查询所有回答,这个是用于首页圆桌显示的，显示六个回答
	public List<Answer> findAnswersByDiscuss_id(String discuss_id);
	
	//根据讨论的id显示所有回答
	public List<Answer> findAllAnswersByDiscuss_id(String discuss_id);
	
	//删除一个回答
	public void deleteAnswer(String id);
	
	//根据id找到一个回答
	public Answer findAnswerById(String id);
	
	//根据讨论的id和一个人的账号 找出他在这个讨论下的回答
	public Answer findAnswerByDiscuss_idAndUser_account(Map map);
	
	//根据用户的账号显示所有回答
	public List<Answer> findAnswersByUser_account(String user_account);

	//更新回答
	public int updateAnswer(Answer answer);
	
}
