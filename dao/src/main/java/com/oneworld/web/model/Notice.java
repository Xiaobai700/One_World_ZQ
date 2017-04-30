package com.oneworld.web.model;

/**
 * Created by Master ZQ on 2017/3/13.
 */
public class Notice {
    private Integer pk_id;
    private Integer id;
    private String Title;
    private Integer notice_type;
    private String send_account;
    private String receive_account;



    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public Integer getNotice_type() {
        return notice_type;
    }

    public void setNotice_type(Integer notice_type) {
        this.notice_type = notice_type;
    }

    public String getSend_account() {
        return send_account;
    }

    public void setSend_account(String send_account) {
        this.send_account = send_account;
    }

    public String getReceive_account() {
        return receive_account;
    }

    public void setReceive_account(String receive_account) {
        this.receive_account = receive_account;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "id=" + id +
                ", Title='" + Title + '\'' +
                ", notice_type=" + notice_type +
                ", send_account='" + send_account + '\'' +
                ", receive_account='" + receive_account + '\'' +
                '}';
    }
}
