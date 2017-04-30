package com.oneworld.web.dao;

import com.oneworld.web.model.Discuss;

import java.util.List;
import java.util.Map;

public interface DiscussMapper {
	//增加一个讨论
	public int insertDiscuss(Discuss discuss);
	//查询所有讨论
	public List<Discuss> queryAllDiscuss();
	//查询热门讨论，根据回答的次数降序，选择前三个
	public List<Discuss> hotDiscuess();
	//根据id查询一个讨论
	public Discuss findDiscussById(String id);
	//更新讨论，主要是更新这个讨论回答数
	public void updateDiscuss(Discuss discuss);
	//根据回答的次数降序排列
	public List<Discuss> queryDiscussByLike();
	//根据用户的账号查询讨论
	public List<Discuss> queryDiscussByUserAccount(String account);
	//分页查找
	//根据回答次数降序分页
	public List<Discuss> queryDiscussByPageTimes(Map map);
//	public List<Discuss> queryDiscussByPageTimes(int pageBegin, int pageSize);
	//根据时间降序排列
	public List<Discuss> queryDiscussPageNew(Map map);
//	public List<Discuss> queryDiscussByPageNew(int pageBegin, int pageSize);

	public List<Discuss> queryAllDiscussPage(Map map);
}
