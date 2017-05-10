<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/3/13
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="static/css/animate.min.css" rel="stylesheet">
    <link href="static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript" src="static/js/plugins/jquery/1.9.1/jquery.min.js"></script>
    <title>约伴详情</title>
</head>
<body>
<div>
    <div class="form-group">
        <label class="col-sm-3 control-label">主题：</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" value="${data.theme}" >
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">活动类型：</label>
        <div class="col-sm-8">
            <select class="form-control" id="appType">
                <c:forEach var="appType" items="${appTypeList}">
                    <option value="${appType.id}">
                            ${appType.typeName}
                    </option>
                </c:forEach>
            </select>
        </div>
    </div>
    <%--<div class="form-group">
        <label class="col-sm-3 control-label">内容：</label>
        <div class="col-sm-8">
            <textarea class="form-control" value="${data.content}"></textarea>
        </div>
    </div>--%>
    <div class="form-group">
        <label class="col-sm-3 control-label">活动地点：</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" value="${data.site}" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">活动发布时间：</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" value="${pTime}"  />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">活动开始时间：</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" value="${data.begin_time}" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">活动持续时间：</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" value="${data.duration}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">性别限制：</label>
        <div class="col-sm-8">
           <input type="text" class="form-control" value="${data.sex_restrict}"/>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#appType").find("option[value='${data.app_type}']").attr("selected",true);
</script>
</body>
</html>
