package com.oneworld.web.dao;

import com.oneworld.web.model.FeedBack;

import java.util.List;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/16.
 */
public interface FeedBackMapper {
    public int insertFeedBack(FeedBack feedBack);

    public int deleteFeedback(int id);

    public int updateFeedBack(FeedBack feedBack);

    public List<FeedBack> queryBackPage(Map map);
}
