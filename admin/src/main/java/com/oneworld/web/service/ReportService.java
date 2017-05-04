package com.oneworld.web.service;

import com.oneworld.web.model.Report;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/4.
 */
public interface ReportService {
    Map getReportPage(Map map);

    Map deleteReport(String targetId, Integer targetType, String reportId, Integer processType);

    Map deleteInvitation(String targetId, Integer targetType, String reportId, Integer processType);

    Map updateReport(Report report);

    Map deleteInvitationAndDisUser(String targetId, Integer targetType, String reportId, Integer processType);

    Map disabledUser(String targetId,Integer targetType,String reportId,Integer processType);
}
