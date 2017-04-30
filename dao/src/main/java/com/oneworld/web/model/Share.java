package com.oneworld.web.model;

import java.sql.Timestamp;

public class Share {
	private Integer pk_id;
	private String id;
	private String sharer_account;
	private String share_title;
	private String share_content;
	private Timestamp share_time;
	private int like_times;
	private String share_thumbnail;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSharer_account() {
		return sharer_account;
	}
	public void setSharer_account(String sharer_account) {
		this.sharer_account = sharer_account;
	}
	public String getShare_title() {
		return share_title;
	}
	public void setShare_title(String share_title) {
		this.share_title = share_title;
	}
	public String getShare_content() {
		return share_content;
	}
	public void setShare_content(String share_content) {
		this.share_content = share_content;
	}
	public Timestamp getShare_time() {
		return share_time;
	}
	public void setShare_time(Timestamp share_time) {
		this.share_time = share_time;
	}
	public int getLike_times() {
		return like_times;
	}

	public void setLike_times(int like_times) {
		this.like_times = like_times;
	}
	
	public String getShare_thumbnail() {
		return share_thumbnail;
	}


	public void setShare_thumbnail(String share_thumbnail) {
		this.share_thumbnail = share_thumbnail;
	}


	@Override
	public String toString() {
		return "Share [id=" + id + ", sharer_account=" + sharer_account + ", share_title=" + share_title
				+ ", share_content=" + share_content + ", share_time=" + share_time + "]";
	}
	
}
