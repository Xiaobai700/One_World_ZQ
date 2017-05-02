package com.oneworld.web.service;

import com.oneworld.web.model.Answer;

import java.util.Map;

public interface AnswerService {
		//增加一个回答
		public Map insertAnswer(Answer answer);
		
		//根据讨论的id查询回答
		public Map findAnswersByDiscuss_id(String discuss_id);
		
		//根据讨论的id显示所有回答
		public Map findAllAnswersByDiscuss_id(String discuss_id);
		
		//删除一个回答
		public Map deleteAnswer(String id);
		
		//根据id找到一个回答
		public Map findAnswerById(String id);
		
		//获得一个讨论下的前六个回答者的信息
		public Map getUserInfosByDiscuss_id(String discuss_id);
		
		//根据讨论的id和一个人的账号 找出他在这个讨论下的回答
		public Map findAnswerByDiscuss_idAndUser_account(String discuss_id, String account);
		
		//根据用户的账号显示所有回答
		public Map findAnswersByUser_account(String user_account);

		//更新讨论
		public Map updateAnswer(Answer answer);
}
