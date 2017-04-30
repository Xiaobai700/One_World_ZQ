package com.oneworld.web.service;

import java.util.Map;

public interface DiscussService {
//根据id查询一个讨论
		public Map findDiscussById(int id);
//查询所有讨论
		public Map getDiscussPage(Map map);
}
