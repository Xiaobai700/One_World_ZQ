package com.oneworld.web.model;

import java.sql.Timestamp;


public class Join {
	private Integer pk_id;
private String id;
private String appointment_id;
private String join_account;
private Timestamp want_join_time;
private Timestamp t_join_time;
private Integer join_or_not;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getT_join_time() {
		return t_join_time;
	}

	public void setT_join_time(Timestamp t_join_time) {
		this.t_join_time = t_join_time;
	}

	public String getAppointment_id() {
		return appointment_id;
	}

	public void setAppointment_id(String appointment_id) {
		this.appointment_id = appointment_id;
	}

	public String getJoin_account() {
	return join_account;
}
public void setJoin_account(String join_account) {
	this.join_account = join_account;
}
public Timestamp getWant_join_time() {
	return want_join_time;
}
public void setWant_join_time(Timestamp want_join_time) {
	this.want_join_time = want_join_time;
}

	public Integer getJoin_or_not() {
		return join_or_not;
	}

	public void setJoin_or_not(Integer join_or_not) {
		this.join_or_not = join_or_not;
	}

	@Override
public String toString() {
	return "Join [id=" + id + ", appointment_id=" + appointment_id + ", join_account=" + join_account
			+ ", want_join_time=" + want_join_time + ", join_time=" + t_join_time + ", join_or_not=" + join_or_not + "]";
}

}
