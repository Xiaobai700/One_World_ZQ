package com.oneworld.web.service;

import com.oneworld.web.model.User;

import java.util.Map;

public interface UserService {
	
	//用户登录
	public Map userLogin(String account, String password);
	
	//用户注册
	public Map userRegist(String account, String password);
	
	//根据账号查找用户
	public Map findUserByAccount(String account);

	//更新用户
	public Map changeUserStatus(User user);

}
