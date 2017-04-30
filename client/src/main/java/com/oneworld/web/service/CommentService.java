package com.oneworld.web.service;

import com.oneworld.web.model.Comment;

import java.util.Map;

public interface CommentService {
	//增加一个评论
		public Map insertComment(Comment comment);
		//根据评论的id，删除一个评论
		public Map deleteComment(String id);
		/**
		 * 根据目标id和帖子的类型查询所有评论
		 * 其中包括评论的相关信息
		 * 评论者的相关信息
		*/
		public Map queryCommentsByTarget_id(String target_id, int label);
		//根据评论id找到一个评论
		public Map findCommentById(String id);
}
