package com.oneworld.web.model;

import java.sql.Timestamp;

/**
 * Created by Master ZQ on 2017/3/15.
 */
public class Admin {
    private Integer pk_id;
    private Integer id;
    private String account;
    private String password;
    private String admin_name;
    private Integer sex;
    private Timestamp regist_time;



    public Integer getPk_id() {
        return pk_id;
    }

    public void setPk_id(Integer pk_id) {
        this.pk_id = pk_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Timestamp getRegist_time() {
        return regist_time;
    }

    public void setRegist_time(Timestamp regist_time) {
        this.regist_time = regist_time;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", admin_name='" + admin_name + '\'' +
                ", sex=" + sex +
                ", regist_time=" + regist_time +
                '}';
    }
}
