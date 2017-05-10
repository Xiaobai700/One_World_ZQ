package com.oneworld.web.model;

import java.sql.Timestamp;

public class Appointment {
	private Integer pk_id;
	private String id;
	private String organizer_account;//活动发起者账号
	private String theme;//活动主题
	private String content;//活动内容
	private String site;//地点
	private String begin_time;//开始时间
	private Timestamp publish_time;//发布时间
	private String duration;//持续时间
	private String thumbnail;//缩略图
	private String sex_restrict;//性别限制
	private int over_flag;//是否结束
	private int want_join;
	private int is_checked;//是否审核通过
	private String app_type;//活动类型

	public Integer getPk_id() {
		return pk_id;
	}

	public void setPk_id(Integer pk_id) {
		this.pk_id = pk_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrganizer_account() {
		return organizer_account;
	}
	public void setOrganizer_account(String organizer_account) {
		this.organizer_account = organizer_account;
	}
	
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	
	public String getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(String begin_time) {
		this.begin_time = begin_time;
	}

	public Timestamp getPublish_time() {
		return publish_time;
	}

	public void setPublish_time(Timestamp publish_time) {
		this.publish_time = publish_time;
	}

	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getSex_restrict() {
		return sex_restrict;
	}
	public void setSex_restrict(String sex_restrict) {
		this.sex_restrict = sex_restrict;
	}
	
	public int getOver_flag() {
		return over_flag;
	}
	public void setOver_flag(int over_flag) {
		this.over_flag = over_flag;
	}
	
	public int getWant_join() {
		return want_join;
	}
	public void setWant_join(int want_join) {
		this.want_join = want_join;
	}

	public int getIs_checked() {
		return is_checked;
	}

	public void setIs_checked(int is_checked) {
		this.is_checked = is_checked;
	}

	public String getApp_type() {
		return app_type;
	}

	public void setApp_type(String app_type) {
		this.app_type = app_type;
	}

	@Override
	public String toString() {
		return "Appointment{" +
				"organizer_account='" + organizer_account + '\'' +
				", theme='" + theme + '\'' +
				", content='" + content + '\'' +
				", site='" + site + '\'' +
				", begin_time='" + begin_time + '\'' +
				", publish_time='" + publish_time + '\'' +
				", duration='" + duration + '\'' +
				", thumbnail='" + thumbnail + '\'' +
				", sex_restrict='" + sex_restrict + '\'' +
				", over_flag=" + over_flag +
				", want_join=" + want_join +
				", is_checked=" + is_checked +
				", app_type=" + app_type +
				'}';
	}
}
