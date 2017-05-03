<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/3
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>举报类型选择</title>
    <link href="../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script src="../static/js/jquery.min.js?v=2.1.4"></script>
    <%--layer--%>
    <script type="text/javascript" src="../static/js/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="../client/js/addAppAndDiscussFunction.js"></script>

</head>
<body>
<div>
    <table width="400px;">
        <tr>
            <td>色情低俗</td>
            <td><input class="form-control" name="reportType" type="checkbox" value="1"></td>
        </tr>
        <tr>
            <td>政治敏感</td>
            <td><input class="form-control" name="reportType" type="checkbox" value="2"></td>
        </tr>
        <tr>
            <td>违法</td>
            <td><input class="form-control" name="reportType" type="checkbox" value="3"></td>
        </tr>
        <tr>
            <td>广告</td>
            <td><input class="form-control" name="reportType" type="checkbox" value="4"></td>
        </tr>
        <tr>
            <td>木马病毒</td>
            <td><input class="form-control" name="reportType" type="checkbox" value="5"></td>
        </tr>
        <tr>
            <td>其他</td>
            <td><input class="form-control" name="reportType" type="checkbox" value="6"></td>
        </tr>
    </table>
    <div>
        <button class="btn-primary" onclick="report('${account}','${targetId}',${targetType})">举报</button>
    </div>
</div>
</body>
</html>
