package com.oneworld.web.dao;

import com.oneworld.web.model.Attention;

import java.util.List;
import java.util.Map;

public interface AttentionMapper {
	//增加一个关注
	public int insertAttention(Attention attention);
	//查询一个人所有的关注
	public List<Attention> findAttentionsBycarer_account(String account);
	//查询一个人被那些人关注
	public List<Attention> findAttentionsByCared_account(String cared_account);
	//	根据关注者的账号和被关注者的账号查询
	public Attention findAttentionByTwoAccount(Map map);
}
