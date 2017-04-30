package com.oneworld.web.service;

import com.oneworld.web.model.Appointment;

import java.util.Map;

public interface AppointService {

//		增加一个约伴活动
		public Map insertAppointment(Appointment appointment);
		
//		根据id查找一个约伴活动
		public Map findAppointmentById(String id);

//		获得所有约伴活动
		public Map getAppaPage(Map map);

//		审核活动
		public Map checkApp(String id);
}
