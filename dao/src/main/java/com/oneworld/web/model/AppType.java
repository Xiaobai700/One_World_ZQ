package com.oneworld.web.model;

import java.sql.Timestamp;

/**
 * Created by Master ZQ on 2017/3/13.
 */
public class AppType {
    private Integer pk_id;
    private String id;
    private String typeName;
    private Integer attention_num;
    private Timestamp create_time;
    private Timestamp update_time;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Integer getAttention_num() {
        return attention_num;
    }

    public void setAttention_num(Integer attention_num) {
        this.attention_num = attention_num;
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

    @Override
    public String toString() {
        return "AppType{" +
                "id=" + id +
                ", typeName='" + typeName + '\'' +
                ", attention_num=" + attention_num +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                '}';
    }
}
