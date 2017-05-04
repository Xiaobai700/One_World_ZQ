package com.oneworld.web.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by yinhaijin on 16/6/29.
 */
public class DateTableUtil {
    public static Map getDateTableRequestDate(String aoData){
        Map requestMap = new HashMap();
        JSONArray jsonArray = JSONArray.fromObject(aoData);
        int size = jsonArray.size();
        for (int i = 0; i < size; i++)
        {
            try
            {
                JSONObject jsonObject = (JSONObject)jsonArray.get(i);
                if (jsonObject.get("name").equals("sEcho"))
                    requestMap.put("sEcho", jsonObject.get("value").toString());
                else if (jsonObject.get("name").equals("iDisplayStart"))
                    requestMap.put("index", Integer.valueOf(jsonObject.get("value").toString()));
                else if (jsonObject.get("name").equals("iDisplayLength"))
                    requestMap.put("length", Integer.valueOf(jsonObject.get("value").toString()));
                else if (jsonObject.get("name").equals("sSearch"))
                    requestMap.put("keys", jsonObject.get("value").toString());
                else if (jsonObject.get("name").equals("sStora"))
                    requestMap.put("sortId", jsonObject.get("value").toString());
                else if (jsonObject.get("name").equals("sortId")) {
                    if (!jsonObject.get("value").toString().equals("0")) {
                        requestMap.put("sortId", jsonObject.get("value").toString());
                    }
                }
                else if (jsonObject.get("name").equals("SearchNames")) {
                    if (!jsonObject.get("value").toString().equals("0")) {
                        requestMap.put("SearchNames", jsonObject.get("value").toString());
                    }
                }
                else if (jsonObject.get("name").equals("is_checked")) {
                    if (!jsonObject.get("value").toString().equals("0")) {
                        requestMap.put("is_checked", jsonObject.get("value").toString());
                    }
                }
                else if (jsonObject.get("name").equals("currentState")) {
                    if (!jsonObject.get("value").toString().equals("0")) {
                        requestMap.put("currentState", jsonObject.get("value").toString());
                    }
                }
                else if (jsonObject.get("name").equals("reportType")) {
                    if (!jsonObject.get("value").toString().equals("0")) {
                        requestMap.put("reportType", jsonObject.get("value").toString());
                    }
                }
                else if (jsonObject.get("name").equals("iSortCol_0")) {
                    if (!jsonObject.get("value").toString().equals("-1")&&!jsonObject.get("value").toString().equals("")) {
                        requestMap.put("sortColumn", jsonObject.get("value").toString());
                    }
                }
                else if (jsonObject.get("name").equals("questionCount")) {
                    if (!jsonObject.get("value").toString().equals("-1")&&!jsonObject.get("value").toString().equals("")) {
                        requestMap.put("questionCount", jsonObject.get("value").toString());
                    }
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
                break;
            }
        }
        return requestMap;
    }
}
