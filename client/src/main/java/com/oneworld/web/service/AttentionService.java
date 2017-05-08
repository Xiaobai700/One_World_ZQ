package com.oneworld.web.service;

import com.oneworld.web.model.Attention;

import java.util.Map;

public interface AttentionService {
	//增加一个关注
	public Map insertAttention(Attention attention);
	
	//关注一个人
	public Map careUser(String myAccount,String userAccount);

	//取消关注一个用户
	public Map cancelCareUser(String myAccount,String userAccount);
	
	//查询一个人所有的关注
	public Map findAttentionsBycarer_account(String account);
	
	//查询一个人被那些人关注
	public Map findAttentionsByCared_account(String cared_account);
	
	//查询一个人所有的粉丝
	public Map findFansByUserAccount(String user_account);

	//判断这个人自己是否关注
	public boolean isCare(String myAccount,String userAccount);
}
