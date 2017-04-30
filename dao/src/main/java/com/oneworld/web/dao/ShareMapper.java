package com.oneworld.web.dao;

import com.oneworld.web.model.Share;

import java.util.List;
import java.util.Map;

public interface ShareMapper {
	//增加一个分享
	public int insertShare(Share share);

	//查询所有分享，按时间降序
	public List<Share> queryAllByTime();

	//查询所有分享，按点赞数降序
	public List<Share> queryAllByLike();

	//根据id查找分享
	public Share findShareById(String id);

	//根据用户的账号查询分享
	public List<Share> findSharesByAccount(String account);

	//	查询所有分享
	public List<Share> querySharePage(Map map);
}
