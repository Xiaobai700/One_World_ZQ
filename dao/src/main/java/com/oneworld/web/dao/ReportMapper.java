package com.oneworld.web.dao;

import com.oneworld.web.model.Report;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/13.
 */
public interface ReportMapper {
//    增加举报
    public int insertReport(Report report);

//    删除举报
    public int deleteReport(String id);

//    查看所有举报
    public List<Report> queryReportPage(Map map);

//    根据举报对象的类型和id查找举报
    public Report findReportByTargetTypeAndId(Map map);

//    更新举报
    public int updateReport(Report report);

    public Report findReportById(String id);
}
