package com.oneworld.web.service;

import com.oneworld.web.model.Admin;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/15.
 */
public interface AdminService {
    public Map insertAdmin(Admin admin);

    public Map deleteAdmin(String account);

    public Map queryAdminPage(Map map);

    public Map findAdminByAccount(String account);

    public Map login(String account,String password);
}
