package com.oneworld.web.dao;

import com.oneworld.web.model.Like;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/5/2.
 */
public interface LikeMapper {
    int insertLike(Like like);

    int deleteLike(Map map);

/*判断一个用户是否对某个帖子点赞*/
    Like selectLikeByAccountAndId(Map map);
}
