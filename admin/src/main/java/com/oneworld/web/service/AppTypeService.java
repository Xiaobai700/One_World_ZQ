package com.oneworld.web.service;

import com.oneworld.web.model.AppType;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/20.
 */
public interface AppTypeService {
    Map insertAppType(AppType appType);

    Map queryAppTypePage(Map map);

    Map deleteAppType(String id);

    Map updateAppType(AppType appType);

    Map queryAllAppType();
}
