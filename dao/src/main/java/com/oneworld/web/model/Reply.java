package com.oneworld.web.model;

import java.sql.Timestamp;

public class Reply {
    private Integer pkId;
    private String id;
    private String commentId;
    private String replyContent;
    private Timestamp replyTime;
    private String replyerAccount;
    private String replyedAccount;
    private Integer replyType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Timestamp getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Timestamp replyTime) {
        this.replyTime = replyTime;
    }

    public String getReplyerAccount() {
        return replyerAccount;
    }

    public void setReplyerAccount(String replyerAccount) {
        this.replyerAccount = replyerAccount;
    }

    public String getReplyedAccount() {
        return replyedAccount;
    }

    public void setReplyedAccount(String replyedAccount) {
        this.replyedAccount = replyedAccount;
    }

    public Integer getReplyType() {
        return replyType;
    }

    public void setReplyType(Integer replyType) {
        this.replyType = replyType;
    }
}
