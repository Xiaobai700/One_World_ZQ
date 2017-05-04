package com.oneworld.web.service;

import java.util.Map;

public interface UserService {
	
	//用户登录
	public Map userLogin(String account, String password);
	
	//用户注册
	public Map userRegist(String account, String password);
	
	//根据账号查找用户
	public Map findUserByAccount(String account);

	//修改用户状态
	public Map changeUserStatus(String account,String reportId,Integer processType);

/****以下******admin*******admin*********admin*********admin***********admin*****相关***********************/
	public Map getUserPage(Map map);
}
