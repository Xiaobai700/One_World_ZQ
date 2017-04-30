package com.oneworld.web.dao;

import com.oneworld.web.model.Comment;

import java.util.List;
import java.util.Map;


public interface CommentMapper {
	//增加一个评论
	public int insertComment(Comment comment);
	//根据评论的id，删除一个评论
	public void deleteComment(String id);
	//根据目标id查询所有评论
	/**此处的参数改成了map,原来是两个参数，业务逻辑层和控制层都要改*/
	public List<Comment> queryCommentsByTargetIdAndLabel(Map map);
	//根据评论id找到一个评论
	public Comment findCommentById(String id);
}
