package com.oneworld.web.service;

import com.oneworld.web.model.Join;

import java.util.Map;

public interface JoinService {
		//增加一个加入信息
		public Map insertJoin(Join join);
		//删除一个加入信息
		public Map deleteJoin(String id);
		//根据活动的id查询所有加入信息
		public Map queryJoinsByAppId(int id);
		//修改加入活动的信息
		public Map updateJoin(Join join);
		//根据用户账号查找加入活动的信息
		public Map queryAllJoinsByJoin_account(String join_account);
		//根据用户账号和活动的id查找加入信息
		public boolean isJoined(String join_account, String app_id);
		//根据活动id查找成功加入活动的用户信息
		public Map joinUserInfo(int id);
		//根据活动id查找想加入活动的用户信息
		public Map wantJoinUserInfo(int id);
		//根据活动的id查询所有 想要 加入信息
		public Map queryWantJoinsByAppId(int id);
		//根据用户账号和约伴活动的id查找加入活动信息
		public Map findJoinByUserAccountAndId(int id, String account);
		
}
