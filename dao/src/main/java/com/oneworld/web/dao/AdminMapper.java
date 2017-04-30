package com.oneworld.web.dao;

import com.oneworld.web.model.Admin;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/15.
 */
public interface AdminMapper {
    public int insertAdmin(Admin admin);

    public int deleteAdmin(String account);

    public List<Admin> queryAdminPage(Map map);

    public Admin findAdminByAccount(String account);
}
