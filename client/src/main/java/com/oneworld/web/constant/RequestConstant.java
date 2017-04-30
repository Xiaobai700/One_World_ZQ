package com.oneworld.web.constant;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
public class RequestConstant {
    public final static Map getRequestDesCode(Integer requestCode){
        Map returnMap = new HashMap();
        returnMap.put(ParameterConstant.RETURN_CODE,requestCode);
        switch (requestCode){
            case -1:
                returnMap.put(ParameterConstant.RETURN_MSG,"系统错误");
                break;
            case 0:
                returnMap.put(ParameterConstant.RETURN_MSG,"请求成功！");
                break;
            case 1:
                returnMap.put(ParameterConstant.RETURN_MSG,"登陆成功！");
                break;
            case 2:
                returnMap.put(ParameterConstant.RETURN_MSG,"注册成功！");
                break;
            case -2:
                returnMap.put(ParameterConstant.RETURN_MSG,"该账号不存在");
                break;
            case -3:
                returnMap.put(ParameterConstant.RETURN_MSG,"账号或密码错误");
                break;
            case 10001:
                returnMap.put(ParameterConstant.RETURN_MSG,"'AppointService.newestAppointment抛出异常'");
                break;
            case 10002:
                break;



        }
        return returnMap;
    }
}
