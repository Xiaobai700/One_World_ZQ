package com.oneworld.web.service;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/10.
 */
public interface LikeService {
    //删除帖子相关的点赞数据
    public Map deleteLike(String invitationId,Integer invitationType);
}
