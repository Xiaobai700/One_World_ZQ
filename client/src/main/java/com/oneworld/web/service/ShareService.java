package com.oneworld.web.service;

import com.oneworld.web.model.Share;

import java.util.Map;

public interface ShareService {
		//增加一个分享
		public Map insertShare(Share share);
		//查询所有分享，按时间降序
		public Map queryAllByTime();
		//查询所有分享，按点赞数降序
		public Map queryAllByLike();
		//根据id查找分享
		public Map findShareById(String id,String account);
		//根据用户的账号查询分享
		public Map findSharesByAccount(String account);
}
