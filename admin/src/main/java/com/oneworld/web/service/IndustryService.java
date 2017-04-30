package com.oneworld.web.service;

import com.oneworld.web.model.Industry;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/17.
 */
public interface IndustryService {
    public Map insertIndustry(Industry industry);

    public Map deleteIndustry(int id);

    public Map updateIndustry(Industry industry);

    public Map queryIndustryPage(Map map);
}
