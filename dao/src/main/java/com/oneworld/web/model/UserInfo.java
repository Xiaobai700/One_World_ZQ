package com.oneworld.web.model;

import java.sql.Timestamp;

public class UserInfo {
	private String account;
	private String nickName;
	private String head;
	private int age;
	private String birth;
	private String sex;
	private String job;//职业
	private String location;//常住地
	private String hobby;
	private String signature;//个性签名
	private int care_count;//关注的人数
	private int fans_count;//被关注的次数，即粉丝数
	private Timestamp regist_time;//注册时间
	private Integer disabled;

	public Integer getDisabled() {
		return disabled;
	}

	public void setDisabled(Integer disabled) {
		this.disabled = disabled;
	}

	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public int getCare_count() {
		return care_count;
	}
	public void setCare_count(int care_count) {
		this.care_count = care_count;
	}
	public int getFans_count() {
		return fans_count;
	}
	public void setFans_count(int fans_count) {
		this.fans_count = fans_count;
	}
	public Timestamp getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(Timestamp regist_time) {
		this.regist_time = regist_time;
	}
	

	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	

	@Override
	public String toString() {
		return "UserInfo [account=" + account + ", nickName=" + nickName + ", head=" + head + ", age=" + age
				+ ", birth=" + birth + ", sex=" + sex + ", job=" + job + ", location=" + location + ", hobby=" + hobby
				+ ", signature=" + signature + ", care_count=" + care_count + ", fans_count=" + fans_count
				+ ", regist_time=" + regist_time + "]";
	}
}
