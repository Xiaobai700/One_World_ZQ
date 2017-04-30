package com.oneworld.web.service;

import com.oneworld.web.model.Appointment;

import java.util.Map;

public interface AppointService {
		//显示热门约伴信息，显示最新的三个活动
		public Map newestAppointment();
		
		//显示所有约伴活动
		public Map findAllAppointment();
		
		//增加一个约伴活动
		public Map insertAppointment(Appointment appointment);
		
		//根据id查找一个约伴活动
		public Map findAppointmentById(String id);
		
		//根据想要参加的人数降序排列
		public Map findAppointmentByWant_join();
		
		//根据发起者的账号查找约伴信息
		public Map findAppointmentByUserAccount(String account);

		//约伴详情
		public Map appDetail(String id);
}
