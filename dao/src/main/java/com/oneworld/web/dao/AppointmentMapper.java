package com.oneworld.web.dao;

import com.oneworld.web.model.Appointment;

import java.util.List;
import java.util.Map;


public interface AppointmentMapper {
	//增加一个约伴信息
	public int insertAppointment(Appointment appointment);
	
	//显示热门约伴信息，显示最新的三个活动
	public List<Appointment> newestAppointment();
	
	//显示所有约伴活动
	public List<Appointment> findAllAppointment();
	
	//根据id查找约伴信息
	public Appointment findAppointmentById(String id);
	
	//根据想要参加的人数降序排列
	public List<Appointment> findAppointmentByWant_join();
	
	//根据发起者的账号查找约伴信息
	public List<Appointment> findAppointmentByUserAccount(String account);

//	查找所有的约伴活动（后台管理 客户端也用到）
	public List<Appointment> queryAppsPage(Map map);

//	更新约伴信息(后台管理)
	public int updateApp(Appointment appointment);
	
}
