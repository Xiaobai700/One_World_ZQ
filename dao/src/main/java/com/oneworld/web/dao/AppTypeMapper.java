package com.oneworld.web.dao;

import com.oneworld.web.model.AppType;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/13.
 */
public interface AppTypeMapper {
//   增加一种类型
    public int insertAppTye(AppType appType);
//    删除
    public  int deleteById(int id);
//    查看所有类型
    public List<AppType> queryAllAppType();
//    分页
    public List<AppType> queryAppTypeByPage(Map map);
//    更新
    public int updateAppType(AppType appType);
//    根据名称查找
    public AppType findAppTypeByName(String type_name);
//    根据id查找
    public AppType findAppTypeById(int id);
}
