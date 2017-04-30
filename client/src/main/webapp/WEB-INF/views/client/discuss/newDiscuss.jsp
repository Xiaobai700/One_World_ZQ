<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/3/21
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--bootstrap-->
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <!-- 重要！不在线引入就会出现各种各样奇葩的问题 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
    <!-- 钟 -->
    <script type="text/javascript" src="static/js/bootstrap-clockpicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap-clockpicker.min.css">
    <!-- 日期 -->
    <link rel="stylesheet" href="static/css/pikaday.css">
    <!--引入主页的css样式文件-->
    <link href="static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="static/css/dao_hang_style.css" rel="stylesheet">
    <link href="static/css/ionicons.css" rel="stylesheet">
    <%--H+的相关样式--%>

    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!--引入主页的js文件-->
    <script src="../../client/js/addAppAndDiscussFunction.js"></script>
    <script src="../../static/js/layer/2.1/layer.js"></script>
    <title>新增活动页面</title>
</head>
<body>
<div id="myTalk" style="text-align: center;" >
                <div style="width: 88%;margin-left: 20px;">
                    <input type="text" id="discuss_title" placeholder="输入问题" class="form-control"><br />
                    <textarea id="question_describe" placeholder="输入问题描述" class="form-control"></textarea>
                    <select id="industry" class="form-control">
                        <option value="-1">请选择问题所属的行业</option>
                        <c:forEach var="industry" items="${industries}">
                            <option value="${industry.id}">
                                ${industry.industry_name}
                            </option>
                        </c:forEach>

                    </select>
                </div>
                <button type="button" onclick="add_discuss()" class="btn btn-primary discuss_btn" style="margin-top: 10px;">发起活动</button>
</div>
</body>
</html>
