package com.oneworld.web.service;

import com.oneworld.web.model.Comment;

import java.util.Map;

public interface CommentService {
	//增加一个评论
		public Map insertComment(Comment comment);
		//根据评论的id，删除一个评论
		public Map deleteComment(int id);
		//根据目标id查询所有评论
		public Map queryCommentsByTarget_id(int target_id, int label);
		//根据评论id找到一个评论
		public Map findCommentById(int id);
}
