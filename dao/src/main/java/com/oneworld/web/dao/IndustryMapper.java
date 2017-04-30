package com.oneworld.web.dao;

import com.oneworld.web.model.Industry;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/13.
 */
public interface IndustryMapper {
//    增加一种行业
    public int insertIndustry(Industry industry);
//    删除一种行业
    public int deleteIndustry(String id);
//    修改行业信息
    public int updateIndustry(Industry industry);
//    查看所有行业
    public List<Industry> queryAllIndustry();
//    根据名称查询行业
    public Industry findIndustryByName(String industry_name);
//        根据id查询行业
    public Industry findIndustryById(String id);
//    分页查看（后台管理）
    public List<Industry> queryIndustryPage(Map map);
}
