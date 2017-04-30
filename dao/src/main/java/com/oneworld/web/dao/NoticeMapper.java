package com.oneworld.web.dao;

import com.oneworld.web.model.Notice;

import java.util.List;

/**
 * Created by Master ZQ on 2017/3/13.
 */
public interface NoticeMapper {
//    增加一条消息
    public int insertNotice(Notice notice);
//    删除一条消息
    public int deleteById(int id);
//    查询所有消息
    public List<Notice> queryAllNotice();
//
}
