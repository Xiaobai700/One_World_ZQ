package com.oneworld.web.model;

import java.sql.Timestamp;

public class Comment {
	private Integer pk_id;
	private String id;
	private String target_id;//所评论的目标id
	private String comment_content;//评论的内容
	private Timestamp comment_time;//评论的时间
	private String commenter_account;//评论者的
	private int reply_times;//被回复的次数
	private int label;//标签，来区分是对什么的评论，对回答的评论是1，对约伴信息的评论是2，对分享的评论是3


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Timestamp getComment_time() {
		return comment_time;
	}

	public void setComment_time(Timestamp comment_time) {
		this.comment_time = comment_time;
	}
	public String getCommenter_account() {
		return commenter_account;
	}

	public void setCommenter_account(String commenter_account) {
		this.commenter_account = commenter_account;
	}
	public int getReply_times() {
		return reply_times;
	}

	public void setReply_times(int reply_times) {
		this.reply_times = reply_times;
	}
	public int getLabel() {
		return label;
	}

	public void setLabel(int label) {
		this.label = label;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", target_id=" + target_id + ", comment_content=" + comment_content
				+ ", comment_time=" + comment_time + ", commenter_account=" + commenter_account + ", reply_times="
				+ reply_times + ", label=" + label + "]";
	}
	
	
}
