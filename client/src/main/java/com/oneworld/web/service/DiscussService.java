package com.oneworld.web.service;

import java.util.Map;

public interface DiscussService {
		//增加一个讨论
		public Map insertDiscuss(Map map);
		//查询所有讨论
		public Map queryAllDiscuss();
		//查询热门讨论，根据回答的次数降序，选择前三个
		public Map hotDiscuess();
		//根据id查询一个讨论
		public Map findDiscussById(String id);
		//根据回答的次数降序排列
		public Map queryDiscussByLike();
		//根据用户的账号查询讨论
		public Map queryDiscussByUserAccount(String account);
		//根据回答的次数降序分页
		public Map queryDiscussPageTimes(int begainPage, int pageSize);
		//根据创建的时间降序分页
		public Map queryDisscussPageNew(int begainPage, int pageSize);

		//查看讨论详情
	public Map discussDetail(String id,String account);
}
