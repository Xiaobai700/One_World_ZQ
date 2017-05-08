package com.oneworld.web.model;

import java.sql.Timestamp;

public class Attention {
	private Integer pkId;
	private String id;//id
	private String carer_account;//关注别人的人的账号
	private Timestamp attention_time;//关注的时间
	private String user_account;//被关注的人的账号

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCarer_account() {
		return carer_account;
	}
	public void setCarer_account(String carer_account) {
		this.carer_account = carer_account;
	}
	public Timestamp getAttention_time() {
		return attention_time;
	}
	public void setAttention_time(Timestamp attention_time) {
		this.attention_time = attention_time;
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	@Override
	public String toString() {
		return "Attention [id=" + id + ", carer_account=" + carer_account + ", attention_time=" + attention_time
				+ ", user_account=" + user_account + "]";
	}
	
}
