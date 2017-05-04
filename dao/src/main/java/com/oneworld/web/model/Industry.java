package com.oneworld.web.model;


import java.sql.Timestamp;

/**
 * Created by Master ZQ on 2017/3/13.
 */
public class Industry {
    private Integer pk_id;
    private String id;
    private String industry_name;
    private int industry_userNum;
    private Timestamp create_time;
    private Timestamp update_time;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Timestamp getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Timestamp create_time) {
        this.create_time = create_time;
    }

    public Timestamp getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }

    public String getIndustry_name() {
        return industry_name;
    }

    public void setIndustry_name(String industry_name) {
        this.industry_name = industry_name;
    }

    public int getIndustry_userNum() {
        return industry_userNum;
    }

    public void setIndustry_userNum(int industry_userNum) {
        this.industry_userNum = industry_userNum;
    }

    @Override
    public String toString() {
        return "Industry{" +
                "id=" + id +
                ", industry_name='" + industry_name + '\'' +
                ", industry_userNum=" + industry_userNum +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                '}';
    }
}
