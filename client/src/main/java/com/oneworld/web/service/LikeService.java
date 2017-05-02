package com.oneworld.web.service;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/2.
 */
public interface LikeService {
    Map likeInvitation(Map map);

    Map cancelLike(String id);

    boolean isLike(Map map);
}
