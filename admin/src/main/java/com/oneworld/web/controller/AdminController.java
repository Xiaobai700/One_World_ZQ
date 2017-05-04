package com.oneworld.web.controller;

import com.oneworld.web.model.Admin;
import com.oneworld.web.service.AdminService;
import com.oneworld.web.util.DateTableUtil;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/11.
 */
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("admin-list.html")
    public ModelAndView adminList(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("/manage/admin/admin-list");
        return modelAndView;
    }

    @RequestMapping("admin-list.json")
    @ResponseBody
    public void adminListDo(HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            @RequestParam String aoData
    ) throws IOException {
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter outWriter = response.getWriter();
            ObjectMapper mapper = new ObjectMapper();
            Map returnMap = new HashMap();
            /*转变日期格式*/
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mapper.setDateFormat(fmt);
            try {
                Map requestMap = DateTableUtil.getDateTableRequestDate(aoData);
                returnMap = adminService.queryAdminPage(requestMap);
                outWriter.write(mapper.writeValueAsString(returnMap));
            } catch (Exception e) {
                e.printStackTrace();
                outWriter.write(mapper.writeValueAsString(returnMap));
            }
        }

    @ResponseBody
    @RequestMapping("add-admin.action")
    public void adminListDo(HttpServletRequest request,
                            HttpServletResponse response,
                             String admin_name,
                             String account,
                            String password,
                            int sex
    ) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try {
            Admin admin = new Admin();
            admin.setAccount(account);
            admin.setAdmin_name(admin_name);
            admin.setPassword(password);
            admin.setSex(sex);
            returnMap = adminService.insertAdmin(admin);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @ResponseBody
    @RequestMapping("delete-admin.action")
    public void adminListDo(HttpServletRequest request,
                            HttpServletResponse response,
                            String account
    ) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try {
            returnMap = adminService.deleteAdmin(account);
            outWriter.write(mapper.writeValueAsString(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping("login.action")
    @ResponseBody
    public void login(HttpServletRequest request,HttpServletResponse response,
                      String account,String password) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try{
            returnMap = adminService.login(account,password);
            if(returnMap.get("code").equals(0)){
                request.getSession().setAttribute("account",account);
            }
            outWriter.write(mapper.writeValueAsString(returnMap));
        }catch (Exception e){
            e.printStackTrace();
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
    }

    @RequestMapping(value = "logout.html")
    public ModelAndView logout(HttpServletResponse response, HttpServletRequest request){
        request.getSession().invalidate();
        return new ModelAndView("/manage/login");
    }
}
