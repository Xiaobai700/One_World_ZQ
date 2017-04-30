package com.oneworld.web.service;

import com.oneworld.web.model.UserInfo;

import java.util.Map;

public interface UserInfoService {
	//增加一个用户信息
	public Map insertuserInfo(UserInfo userInfo);
	
	//根据账号查找用户信息
	public Map findUserInfoByAccount(String account);
	
	//更新用户下信息
	public Map updateUserInfo(UserInfo userInfo);


	
	//根据粉丝数降序，取前三名
//	public List<UserInfo> hotUserL1();
	//根据粉丝数降序，再取三名即 4 5 6 名
//	public List<UserInfo> hotUserL2();
}
