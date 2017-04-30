package com.oneworld.web.dao;

import com.oneworld.web.model.UserInfo;

import java.util.List;
import java.util.Map;

public interface UserinfoMapper {
	//增加一个用户信息
	public int insertUserInfo(UserInfo userInfo);

	public int insertUserInfoSelective(UserInfo userInfo);
	
	//根据账号查找用户信息
	public UserInfo findUserInfoByAccount(String account);
	
	//修改用户信息
	public int updateUserInfo(UserInfo userInfo);

//	查询所有用户信息
	public List<UserInfo> findAllUserPage(Map map);
	
	//根据粉丝降序排列用户，取前3名
	public List<UserInfo> hotUserL1();
	//根据粉丝降序排列用户，再取前3名
	public List<UserInfo> hotUserL2();
}
