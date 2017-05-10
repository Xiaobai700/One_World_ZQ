<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/9
  Time: 13:07
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
<title>讨论详情</title>
</head>
<body>
<div>
    <div class="form-group">
        <label class="col-sm-3 control-label">标题：</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" value="${data.discuss_title}" >
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">行业类型：</label>
        <div class="col-sm-8">
            <select class="form-control" id="industry">
                <c:forEach var="industry" items="${industryList}">
                    <option value="${industry.id}">
                            ${industry.industry_name}
                    </option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">发布时间：</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" value="${dTime}" >
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">描述：</label>
        <div class="col-sm-8">
            <span></span>
            <textarea class="form-control" value="">${data.question_describe}</textarea>
        </div>
    </div>
<script type="text/javascript">
    $("#industry").find("option[value='${data.industry_id}']").attr("selected",true);
</script>
</body>
</html>
