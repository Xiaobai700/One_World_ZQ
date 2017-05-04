package com.oneworld.web.dao;

import com.oneworld.web.model.User;

/**
 * Created by Master ZQ on 2017/2/28.
 */
public interface UserMapper {
    /**新增一个用户*/
    public int insertUser(User user);

    /**根据用户的账号查找用户*/
    public User findUserByAccount(String account);

    /**用户修改密码*/
    public int changePassword(User user);

    /**修改用户状态*/
    public int changeStatus(User user);
}
