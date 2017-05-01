package com.oneworld.web.dao;

import com.oneworld.web.model.Join;

import java.util.List;
import java.util.Map;

public interface JoinMapper {
	//增加一条加入活动的信息
	public int insertJoin(Join join);

	//根据活动的id查询所有加入信息
	public List<Join> queryJoinsByAppId(String id);

	//修改加入活动的信息
	public void updateJoin(Join join);

	//根据用户账号查找加入活动的信息
	public List<Join> queryJoinsByJoinAccount(String join_account);

	//根据用户账号和活动的id查找加入信息
	public Join isJoined(Map map);

	//根据是否成功加入 是否申请加入 还有约伴活动的id 查询加入信息
	public List<Join> queryJoinsByMap(Map map);

	//根据用户账号和约伴活动的id查找加入活动信息
	public Join findJoinByUserAccountAndId(Map map);

//	根据id查找
	public Join findJoinById(String id);

//	删除加入信息
	public int deleteJoin(String id);
}
