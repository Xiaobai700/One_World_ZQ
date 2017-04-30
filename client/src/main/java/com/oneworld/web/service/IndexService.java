package com.oneworld.web.service;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
public interface IndexService {
/**
 * 显示主页上的内容
 * 参数暂时保留 可能的值就是登陆者的账号 用来判断热门用户是否是其好友 活动是否报名参加等
 * */
    public Map indexAll(Map map);


    /**
     * 显示所有约伴活动的内容 按时间排序
     * 参数暂时保留
     * */
    public Map yuebanAll(Map map);

    /**
     * 显示所有约伴活动的内容 按想要参加的人数排序
     * 参数暂时保留
     * */
    public Map allYueban(Map map);

    /**
     * 根据活动类型 模糊查询
     * */
    public Map yueBanType(Map map);

    /**
     * 显示所有讨论 按时间排序
     */
    public Map discussPageAll(Map map);

    /**
     * 显示所有讨论 按参与讨论的人数排序
     */
    public  Map allPageDiscuss(Map map);


    /**
     * 显示所有分享 按时间排序
     * */
    public Map shareAll(Map map);
    /**
     * 显示所有分享 按点赞的人数排序
     * */
    public Map allShare(Map map);

    /***
     * 显示用户的个人中心
     */
    public Map userSpace(Map map);
}
