package com.oneworld.web.interceptor;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/10.
 */
public class UserInterceptor implements HandlerInterceptor {
//    在实际的handler被执行之前调用
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        httpServletResponse.setContentType("text/html;charset=UTF-8");
        PrintWriter outWriter = httpServletResponse.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map resultMap = new HashMap();
        //
        String requestUri = httpServletRequest.getRequestURI();
        String contextPath = httpServletRequest.getContextPath();
        String url = requestUri.substring(contextPath.length());
//        只要不进行相关操作 就放行 一般展示页面的后缀为.do  涉及到操作的就是.action
        if (url.equals("welcome.do")||url.endsWith("do")) {
            return true;
        } else {
            if (url.endsWith("html") || url.endsWith("action")) {
                if(url.contains("userLogin") || url.contains("userRegist")){
                    return true;
                }else {
                    String account = (String) httpServletRequest.getSession().getAttribute("account");
                    if (account == null) {
                        outWriter.println("<script>");
                        outWriter.println("alert('您还未登陆，快去登陆吧！')");
                        outWriter.println("</script>");
                        httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"login.do");
                        return false;
                    } else{
                        return true;
                    }
                }
            } else {
                return true;
            }
        }
       /* if (url.equals("welcome.do") || url.equals("userLogin.action")*//*||url.endsWith("do")*//*) {
            return true;
        }
//             如果已经登陆，放行
        String user_account = (String)httpServletRequest.getSession().getAttribute("account");
        if(user_account == null){
            resultMap.put(ParameterConstant.RETURN_MSG,"您还未登陆，快去登陆吧！");
            httpServletResponse.sendRedirect(contextPath+"welcome.do");
            outWriter.write(mapper.writeValueAsString(resultMap));
            return false;
        }else {
            return true;
        }*/
    }
//在实际的handler被执行之后调用
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }
//在request处理完成之后调用
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
