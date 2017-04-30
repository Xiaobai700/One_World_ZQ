package com.oneworld.web.model;

import java.sql.Timestamp;

public class Answer {
	private Integer pk_id;
	private String id;
	private String discuss_id;
	private String answer_account;
	private String answer_content;
	private Timestamp answer_time;//回答的时间
	private int agree_times;//点赞数

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDiscuss_id() {
		return discuss_id;
	}

	public void setDiscuss_id(String discuss_id) {
		this.discuss_id = discuss_id;
	}

	public String getAnswer_account() {
		return answer_account;
	}
	public void setAnswer_account(String answer_account) {
		this.answer_account = answer_account;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public Timestamp getAnswer_time() {
		return answer_time;
	}
	public void setAnswer_time(Timestamp answer_time) {
		this.answer_time = answer_time;
	}
	public int getAgree_times() {
		return agree_times;
	}
	public void setAgree_times(int agree_times) {
		this.agree_times = agree_times;
	}
	@Override
	public String toString() {
		return "Answer [id=" + id + ", discuss_id=" + discuss_id + ", answer_account=" + answer_account
				+ ", answer_content=" + answer_content + ", answer_time=" + answer_time + ", agree_times=" + agree_times
				+ "]";
	}
	
}
