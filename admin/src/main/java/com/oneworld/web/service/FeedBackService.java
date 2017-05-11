package com.oneworld.web.service;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/11.
 */
public interface FeedBackService {
    public Map selectBackPage(Map map);

    public Map updateBack(String id);

    public Map deleteBack(String id);
}
