package com.oneworld.web.model;

import java.sql.Timestamp;

/**
 * Created by Master ZQ on 2017/3/16.
 */
public class FeedBack {
    private Integer pk_id;
    private int id;
    private String user_account;
    private String content;
    private Integer is_reply;
    private Integer is_delete;
    private Timestamp feedback_time;



    public String getUser_account() {
        return user_account;
    }

    public void setUser_account(String user_account) {
        this.user_account = user_account;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getIs_reply() {
        return is_reply;
    }

    public void setIs_reply(Integer is_reply) {
        this.is_reply = is_reply;
    }

    public Integer getIs_delete() {
        return is_delete;
    }

    public void setIs_delete(Integer is_delete) {
        this.is_delete = is_delete;
    }

    public Timestamp getFeedback_time() {
        return feedback_time;
    }

    public void setFeedback_time(Timestamp feedback_time) {
        this.feedback_time = feedback_time;
    }

    @Override
    public String toString() {
        return "FeedBack{" +
                "id=" + id +
                ", user_account='" + user_account + '\'' +
                ", content='" + content + '\'' +
                ", is_reply=" + is_reply +
                ", is_delete=" + is_delete +
                ", feedback_time=" + feedback_time +
                '}';
    }
}
