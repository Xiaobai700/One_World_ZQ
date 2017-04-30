package com.oneworld.web.service;

import java.util.Map;

public interface ShareService {
		//根据id查找分享
		public Map findShareById(int id);
//		查找所有分享
	public Map querySharePage(Map map);
}
