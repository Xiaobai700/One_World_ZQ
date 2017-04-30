package com.oneworld.web.controller;

import com.oneworld.web.util.FileUtil;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/6.
 */
@Controller
public class CommonController {
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
    @RequestMapping(value = "upload.action", method = RequestMethod.POST)
    @ResponseBody
    public void upload(
            HttpServletResponse response,
            HttpServletRequest request,
            @RequestParam(value = "upfile")MultipartFile file
    ) throws Exception {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter outWriter = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        Map returnMap = new HashMap();
        try {
           FileUtil fileUtil = new FileUtil();
            returnMap = fileUtil.uploadEditor(file,"/upload/" + simpleDateFormat.format(new Date()), request);
            String callbackcontent = String.valueOf(returnMap.get("callbackcontent"));
            outWriter.write(callbackcontent);

        }catch (Exception e){
            outWriter.write(mapper.writeValueAsString(returnMap));
        }
        return;
    }
}
