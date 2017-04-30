package com.oneworld.web.model;

import java.sql.Timestamp;

public class Discuss {
	private Integer pk_id;
private String id;
private String asker_account;
private String discuss_title;
private String question_describe;
private Timestamp ask_time;
private Integer answer_times;
private Integer industry_id;
private Integer is_over;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAsker_account() {
	return asker_account;
}
public void setAsker_account(String asker_account) {
	this.asker_account = asker_account;
}
public String getDiscuss_title() {
	return discuss_title;
}
public void setDiscuss_title(String discuss_title) {
	this.discuss_title = discuss_title;
}
public String getQuestion_describe() {
	return question_describe;
}
public void setQuestion_describe(String question_describe) {
	this.question_describe = question_describe;
}
public Timestamp getAsk_time() {
	return ask_time;
}
public void setAsk_time(Timestamp ask_time) {
	this.ask_time = ask_time;
}
public Integer getAnswer_times() {
	return answer_times;
}
public void setAnswer_times(Integer answer_times) {
	this.answer_times = answer_times;
}

	public Integer getIndustry_id() {
		return industry_id;
	}

	public void setIndustry_id(Integer industry_id) {
		this.industry_id = industry_id;
	}

	public Integer getIs_over() {
		return is_over;
	}

	public void setIs_over(Integer is_over) {
		this.is_over = is_over;
	}

	@Override
	public String toString() {
		return "Discuss{" +
				"id=" + id +
				", asker_account='" + asker_account + '\'' +
				", discuss_title='" + discuss_title + '\'' +
				", question_describe='" + question_describe + '\'' +
				", ask_time=" + ask_time +
				", answer_times=" + answer_times +
				", industry_id=" + industry_id +
				", is_over=" + is_over +
				'}';
	}
}
