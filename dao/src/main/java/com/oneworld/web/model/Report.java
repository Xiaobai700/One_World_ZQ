package com.oneworld.web.model;

import java.sql.Timestamp;

/**
 * Created by Master ZQ on 2017/3/13.
 */
public class Report {
    private Integer pk_id;
    private int id;
    private int report_type;
    private int target_id;
    private int target_type;
    private int current_state;
    private int status;
    private Timestamp update_time;


    public int getReport_type() {
        return report_type;
    }

    public void setReport_type(int report_type) {
        this.report_type = report_type;
    }

    public int getTarget_id() {
        return target_id;
    }

    public void setTarget_id(int target_id) {
        this.target_id = target_id;
    }

    public int getTarget_type() {
        return target_type;
    }

    public void setTarget_type(int target_type) {
        this.target_type = target_type;
    }

    public int getCurrent_state() {
        return current_state;
    }

    public void setCurrent_state(int current_state) {
        this.current_state = current_state;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }

    @Override
    public String toString() {
        return "Report{" +
                "report_type=" + report_type +
                ", target_id=" + target_id +
                ", target_type=" + target_type +
                ", current_state=" + current_state +
                ", status=" + status +
                ", update_time=" + update_time +
                '}';
    }
}
